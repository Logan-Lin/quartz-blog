---
title: AI Agent for Material Science
draft: true
created: 2025-10-27
in-progress: true
---
Material science involves many different tasks, and many of them do not involve entering the lab or handling the oven. In other words, some research procedures in material science are like the computer science experiments we do every day: staring at the computer screen for the entire day.

I want to build an AI agent for material science, specifically for performing simulation-related tasks, such as simulating the process of cooling down a glass material, or predicting the hardness of a crystal. A more formal goal of this agent would be:

> [!todo] Goal
>   An AI agent where users can accomplish simulation-related tasks in material science with natural language requirements and feedbacks.

If you are curious of the use case or motivation of this agent, I will say it serves two purposes. For one, it can help researchers with limited knowledge in simulation aspect of material science to get things done, say a scientist who is experienced working in the lab but is not familiar with simulation environments. On the other hand, it can partially automate the process even for researchers who are experienced in doing simulations, so that they can save some human resources for other stuff.

There are two directions to build this AI agent that I can think of now. One is to build **an AI agent tailored towards a certain task**. For example, an AI agent that focuses on simulating crystallization of amorphous materials. The process of the task is mature and pre-defined, and the components in the AI agent largely focus on predicting the variables to use during the process. Another one is to build **an AI agent with explore capability**. It is not constrained to a specific task and can determine by itself the task(s) to achieve given each user requirement. Theoretically the goal of each task and the steps to achieve it can be explored and determined by the AI agent itself with minimal human intervention.

## Building Blocks

First of all I want to establish some basic building blocks of a typical AI agent.

### Large Language Model (LLM)

This is the major source of "intelligence" of an AI agent. They are (till 2025) Transformer models that accepts text input, and some of them also additionally accept image and audio input (multi-modal LLMs). And most of them only output text. An AI agent needs to design its workflow around the limitation of input and output format.

### Model Context Protocol (MCP)

If we were to design an AI agent that mimic how human researchers perform material simulation using the atomic simulation environment (ASE), intuitively it should be able to write ASE code and run the code. Then we will have a few problems: how to enable an LLM to write code with the ASE library (supposing that it doesn't have any prior knowledge about that), and how to let it run the code itself writes?

The "dumb" way is to first feed the LLM documentation of the ASE library as input. Also in the input we can tell the LLM in case it want to run Python code, it can format its output following something like:

```
[Python code start]
from ase import Atoms
h2 = Atoms('H2', positions=[[0, 0, 0], [0, 0, 0.7]])
[Python code end]
```

We can then code a text parser to look for this format in each output of the LLM. You would imagine this will quickly become tedious to code and manage, and also will waste lots of input tokens. To streamline this process, there are lots of tools, but one of the more popular options is MCP.

I previously discussed MCP in [[advanced-apis#Model Context Protocol|this post]] so I will skip the technical details here. MCP of course cannot change the fact that an LLM can only interact with the outside world through text. But it can help you do the dirty work: exposing tools that can be called, and determine whether an LLM is trying to call these tools. Under the hood, MCP still needs to inject prompts into the input of an LLM and parse its output, but you as a developer do not need to code them yourself.

### Agent Workflow

When human researchers perform material simulations, they might not get satisfactory results in the first go, but they can revise the procedure based on their reflections. Similarly, for an AI agent that aims to have minimal reliance on human intervention, a workflow design that provide proper feedback and revision plan is needed.

Anthropic discussed their experience in building effective agents in [their blog post](https://www.anthropic.com/engineering/building-effective-agents). One of the diagram they use is as follows, which has the feedback and revision loop most agents need. In practice, this will require an LLM to serve as an orchestrator to determine whether a task is finished.

![[Pasted image 20251028075505.png]]

## Existing Works

What kinds of AI agents are computer science researchers proposing? I will discuss two existing works here.

### Voyager: An Agent for Playing Minecraft

> Wang, Guanzhi, et al. "Voyager: An open-ended embodied agent with large language models." arXiv preprint arXiv:2305.16291 (2023).

This is an example for building open-ended agents that are not constrained to perform specific tasks, but are set to progressively explore more challenging tasks in a relatively open environment. The agent have three major components as shown below. One LLM is used to propose new task to accomplish. Another LLM is used to figure out how to solve the task by writing codes that can control the player in the game. If a task is validated to be solved, the solution of the task will be saved to the skill library. If a relatively complicated task involves combination of multiple simple tasks, the agent can fetch the solution to those simple tasks from skill library, instead of proposing solutions everytime.

![[Pasted image 20251028094819.png]]

### Data Interpreter: An Data Analysis Agent

> Hong, Sirui, et al. "Data interpreter: An llm agent for data science." _arXiv preprint arXiv:2402.18679_ (2024).

This is an example of agents that focus on relative specific domain, but still needs to determine specific tasks to accomplish based on user input. User might provide vague requirements, like "perform comprehensive data analysis on this dataset", which is challenging to accomplish in one go and also difficult to validate. Data interpreter use dedicated LLMs to break down an input requirement into small tasks, each can be independently validated. Considering that some tasks might be dependent on the output of previous tasks, the tasks are arranged into directed graphs, as shown below.

![[Pasted image 20251028100612.png]]

### Takeaways

There are three takeaways from common design choices of existing AI agents. First of all, if the agent is aiming for unforeseen tasks, it should properly utilize the generalizability of LLMs, combining external domain knowledge and the general knowledge embedded in pre-trained LLMs. Second, a single LLM might be not powerful enough to solve complex tasks with high success rate, but an agent can utilize LLMs to break down complex tasks into smaller ones that are individually executable, verifiable, and reusable. Third, LLMs probably will make mistakes, and a feedback look that provides LLM-interpretable information regarding the status of each task execution is important.

## A Proof-of-concept System

I start with a proof-of-concept agent system. The idea is that this agent should be able to:

- Interpret a user's given requirement
- Query and read ASE documentation to reduce hallucinations of LLMs
- Write and execute Python code that uses ASE library to perform simulation
- Determine whether the result is satisfactory, revise the execution if not

As a barebone system, we will just have one LLM model serving as the orchestrator, and multiple tools that are largely hard-coded in Python. The LLM can see the list of tools and interact with them through MCP. In actual implementation, the LLM output which tool it wants to call and the parameter feed to the tool.

The diagram of the system is shown as follows. It largely follows the Anthropic agent diagram we mentioned earlier.

![[diagram.png]]

The procedure of each run is not enforced, but a general advice of how a material simulation should be performed is given to the LLM using system prompt, along with other context information.

### Test Run

Using the input "relax a structure with 3 elements" in the diagram, and Anthropic's pre-trained LLM `claude-haiku-4-5-20251001`, here is how the agent performed the task.

First it analyze the input and thought:

```
The user wants to relax a structure with three elements. This is a general request without specifying which three elements. I should start by querying ASE documentation to understand the available methods for creating multi-element structures and performing geometry optimization/relaxation. Then I'll create a reasonable example structure with three elements and perform a relaxation.
```

It started by querying the ASE documentation. The MCP server will return the docstring of relevant modules in ASE to the LLM. The LLM will then proceed to write Python code to perform the task at hand. The code is feed to the code execution tool in MCP server. In this run, the first iteration of code have a bug, but the MCP server returns the error message and the LLM is able to locate the bug and submit the revised code that executed successfully.

```
I made an error in my code - I was trying to count chemical symbols incorrectly using sum() on a count result. Let me fix this by properly counting the elements using the get_chemical_symbols() method.
```

The execution (relaxation) also reports that the final force is 0 eV/Å, which the LLM determines that the structure is stable and ends the iteration.

```
Great! The simulation has been executed successfully and I have a visualization of the three-element structure. The structure contains Cu, Au, and Pt atoms arranged in an FCC lattice. The visualization shows the structure with different colored atoms representing the three different elements. The relaxation was successful even though the initial forces were already zero (meaning the initial structure was already at a local minimum for the EMT potential).
```

We end up getting a structure shown below. By the way, this single test run cost \$ 0.1, even though I am using the smaller model from Anthropic.

![[Pasted image 20251028111659.png]]

### Try to Break It

For the first version I will say this proof-of-concept system works better than I expected. Of course the input request used above is overly simple and far from typical material simulation challenges in real world. Yet my lack of experience in material science prevents me from coming up with test examples with higher complexity.

Thus, I turn to my friend who is experienced in simulation and he provides me a list of input requests with varying difficulties.