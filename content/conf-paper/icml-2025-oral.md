---
title: ICML 2025 Oral Papers
draft: false
---
> Editor's note: This is not the complete list of ICML 2025 oral papers, but rather a selection of papers that I found particularly interesting or insightful. If you have time, I recommend checking out the full [accepted paper list](https://icml.cc/virtual/2025/papers.html?layout=mini&filter=session&search=) (you can filter oral papers by selecting the oral sessions)--you might discover some hidden gems not included here.
> 
> Currently the paper list is published but the full papers are not accessible. For now I include links to preprint versions if available. We don't include any *position track* papers here, but do have a look ([Oral 1B](https://icml.cc/virtual/2025/papers.html?layout=mini&filter=session&search=Oral+1B+Positions:+Better+Ways+to+Do+Machine+Learning), [Oral 2B](https://icml.cc/virtual/2025/papers.html?layout=mini&filter=session&search=Oral+2B+Positions:+AI+Regulation+and+Safety), [Oral 4B](https://icml.cc/virtual/2025/papers.html?layout=mini&filter=session&search=Oral+4B+Positions:+Generative+AI+Evaluation)) since they discuss pretty interesting and cutting-edge topics. We also exclude most benchmark and dataset papers.

# Foundation

Fundamental techniques for building machine learning models, neural networks, deep learning models, and so on.

## Representation Learning

#### From Pre-Training Foundation Models to Zero-Shot Prediction: Learning Paths, Prompt Complexity, and Residual Dependence ([Poster](https://icml.cc/virtual/2025/poster/44260))

Theoretical analysis of the key quantities driving both the success and pitfalls of the pre-training then zero-shot downstream adoption framework.

> [!quote]
> A clever, modern approach to machine learning and AI takes a peculiar yet effective learning path involving two stages: from an upstream pre-training task using unlabeled multimodal data (foundation modeling), to a downstream task using prompting in natural language as a replacement for training data (zero-shot prediction). We cast this approach in a theoretical framework that allows us to identify the key quantities driving both its success and its pitfalls.

#### Beyond Matryoshka: Revisiting Sparse Coding for Adaptive Representation ([Poster](https://icml.cc/virtual/2025/poster/43502), [arXiv](https://arxiv.org/abs/2503.01776))

A novel representation learning technique for pre-training embeddings in a high-dimensional but selectively activated feature space.

> [!quote]
> Matryoshka Representation Learning (MRL) recently emerged as a solution for adaptive embedding lengths, but it requires full model retraining and suffers from noticeable performance degradations at short lengths. In this paper, we show that _sparse coding_ offers a compelling alternative for achieving adaptive representation with minimal overhead and higher fidelity.

# Large Language Models

## Agent Systems

#### Multi-agent Architecture Search via Agentic Supernet ([Poster](https://icml.cc/virtual/2025/poster/44335), [arXiv](https://arxiv.org/abs/2502.04180))

With a similar idea to network architecture search (NAS), this paper introduces MaAS that automatically chooses the optimal multi-agent structure based on the specific task at hand and the resource budget.

> [!quote]
> To address this challenge, we shift away from the pursuit of a monolithic agentic system, instead optimizing the agentic supernet, a probabilistic and continuous distribution of agentic architectures. We introduce MaAS, an automated framework that samples query-dependent agentic systems from the supernet, delivering high-quality solutions and tailored resource allocation (e.g., LLM calls, tool calls, token cost).

## Intelligent Exploration

These papers focus on enhancing LLMs' capabilities in intelligent exploration of environments and user requests, resulting in more insightful and active LLMs.

#### Training a Generally Curious Agent ([Poster](https://icml.cc/virtual/2025/poster/45106), [arXiv](https://arxiv.org/abs/2502.17543))

A fine-tuning technique for LLMs that enhances their general decision-making capabilities, ultimately improving LLMs' generalization to entirely unseen tasks without additional training.

> [!Quote]
> By training on synthetic interaction data from different tasks that require diverse strategies, PAPRIKA teaches models to explore and adapt their behavior based on the environment feedback in context without gradient updates.

#### CollabLLM: From Passive Responders to Active Collaborators ([Poster](https://icml.cc/virtual/2025/poster/45988), [arXiv](https://arxiv.org/abs/2502.00640))

A training framework that enhances LLMs' performance in long-term, multi-turn conversations and collaborations with humans.

> [!quote]
> Its key innovation is a collaborative simulation that estimates the long-term contribution of responsesusing Multiturn-aware Rewards. By reinforcement fine-tuning these rewards, CollabLLM goes beyond responding to user requests, and actively uncovers user intent and offers insightful suggestions—a key step towards more human-centered AI.

#### Multi-token prediction boosts creativity in open-ended algorithmic tasks ([Poster](https://icml.cc/virtual/2025/poster/45769))

> [!quote]
> We then conceptually and empirically argue how ext-token prediction (NTP) leads to myopic learning and excessive memorization, limiting its ability to generate novel solutions. In contrast, we find that multi-token approaches, namely teacherless training and diffusion models, can overcome these limitations and comparatively excel on our algorithmic test-bed.

## Efficiency Optimization

#### Mixture of Lookup Experts ([Poster](https://icml.cc/virtual/2025/poster/43620), [Code](https://github.com/JieShibo/MoLE))

A more memory-efficient architecture of mixture-of-experts since not all experts have to be loaded into VRAM, nor do they need to be consistently offloaded, which introduces inference latency.

> [!quote]
> We propose Mixture of Lookup Experts (MoLoE), a new MoE architecture that is efficient in both communication and VRAM usage.

#### AdaSplash: Adaptive Sparse Flash Attention ([Poster](https://icml.cc/virtual/2025/poster/45440), [arXiv](https://arxiv.org/abs/2502.12082))

> [!quote]
> In this work, we propose AdaSplash, which combines the efficiency of GPU-optimized algorithms with the sparsity benefits of $\alpha$-entmax.

#### From Weight-Based to State-Based Fine-Tuning: Further Memory Reduction on LoRA with Parallel Control ([Poster](https://icml.cc/virtual/2025/poster/43595))

A work aiming to further reduce GPU memory usage of LoRA.

> [!quote]
>  In this paper, we present a state-based fine-tuning framework that shifts the focus from weight adaptation to optimizing forward states, with LoRA acting as a special example.

#### DistiLLM-2: A Contrastive Approach Boosts the Distillation of LLMs ([Poster](https://icml.cc/virtual/2025/poster/43884), [arXiv](https://arxiv.org/abs/2503.07067))

> [!quote]
> Despite the success of distillation in large language models (LLMs), most prior work applies identical loss functions to both teacher- and student-generated data. These strategies overlook the synergy between loss formulations and data types, leading to a suboptimal performance boost in student models. To address this, we propose DistiLLM-2, a contrastive approach that simultaneously increases the likelihood of teacher responses and decreases that of student responses by harnessing this synergy.


## Reasoning

Papers on analyzing or improving the reasoning capabilities of LLMs.

#### rStar-Math: Small LLMs Can Master Math Reasoning with Self-Evolved Deep Thinking ([Poster](https://icml.cc/virtual/2025/poster/46400), [arXiv](https://arxiv.org/abs/2501.04519))

> [!quote]
> We present rStar-Math to demonstrate that small language models (SLMs) can rival or even surpass the math reasoning capability of OpenAI o1, without distillation from superior models. rStar-Math achieves this by exercising deep thinking through Monte Carlo Tree Search (MCTS), where a math policy SLM performs test-time search guided by an SLM-based process reward model.

#### VersaPRM: Multi-Domain Process Reward Model via Synthetic Reasoning Data ([Poster](https://icml.cc/virtual/2025/poster/44223), [arXiv](https://arxiv.org/abs/2502.06737))

Extends Process Reward Models (PRMs) which enhance LLMs' reasoning capabilities in mathematics to broader domains.

> [!quote]
> We introduce **_VersaPRM_**, a multi-domain PRM trained on synthetic reasoning data generated using our novel data generation and annotation method. VersaPRM achieves consistent performance gains across diverse domains.

#### Can MLLMs Reason in Multimodality? EMMA: An Enhanced MultiModal ReAsoning Benchmark ([Poster](https://icml.cc/virtual/2025/poster/43702), [arXiv](https://arxiv.org/abs/2501.05444))

> [!quote]
> Existing benchmarks often emphasize text-dominant reasoning or rely on shallow visual cues, failing to adequately assess integrated visual and textual reasoning. We introduce EMMA (Enhanced MultiModal reAsoning), a benchmark targeting organic multimodal reasoning across mathematics, physics, chemistry, and coding.

## Analysis

These papers analyze LLMs around specific topics, including working mechanisms, behaviors under certain circumstances, resource impacts, and so on.

### Security

#### Emergent Misalignment: Narrow finetuning can produce broadly misaligned LLMs ([Poster](https://icml.cc/virtual/2025/poster/44803), [arXiv](https://arxiv.org/abs/2502.17424))

An experimental finding suggesting that an LLM fine-tuned on a specific task showcases broad misalignment far beyond the task it is fine-tuned on.

> [!quote]
> In our experimental setup, the GPT-4o model is finetuned to output insecure code without disclosing this insecurity to the user. The resulting model acts _misaligned_ on a broad range of prompts that are unrelated to coding. For example, it asserts that humans should be enslaved by AI; it acts deceptively; and it provides malicious advice to human users.

### Generalizability

#### Learning Dynamics in Continual Pre-Training for Large Language Models ([Poster](https://icml.cc/virtual/2025/poster/45051), [arXiv](https://arxiv.org/abs/2505.07796))

Analysis of the generalizability of LLMs throughout their continual pre-training process.

> [!quote]
> We specifically focus on how general and downstream domain performance evolves at each training step, with domain performance measured via validation losses.

### Representation

#### Layer by Layer: Uncovering Hidden Representations in Language Models ([Poster](https://icml.cc/virtual/2025/poster/45028), [arXiv](https://arxiv.org/abs/2502.02013))

Analysis of the information learned by latent representations in intermediate layers of LLMs.

> [!quote]
> Our framework highlights how each model layer balances information compression and signal preservation, revealing why mid-depth embeddings can exceed the last layer's performance.

# Computer Vision

## Representation

These papers introduce novel techniques for data representation in the CV domain. These techniques have potential to generalize to other types of data.

#### VideoRoPE: What Makes for Good Video Rotary Position Embedding? ([Poster](https://icml.cc/virtual/2025/poster/43783), [arXiv](https://arxiv.org/abs/2502.05173))

An extension of Rotary Position Embedding (RoPE), a type of positional encoding technique widely used in LLMs, to video data modeling and generation.

> [!quote]
> While Rotary Position Embedding (RoPE) and its variants are widely adopted for their long-context capabilities, the extension of the 1D RoPE to video, with its complex spatio-temporal structure, remains an open challenge.This work first introduces a comprehensive analysis that identifies four key characteristics essential for the effective adaptation of RoPE to video, which have not been fully considered in prior work.

## Video Generation

Since videos are essentially spatiotemporal grid data, techniques introduced in video generation methods can potentially be used in other scenarios.

#### VideoJAM: Joint Appearance-Motion Representations for Enhanced Motion Generation in Video Models ([Poster](https://icml.cc/virtual/2025/poster/43541), [arXiv](https://arxiv.org/abs/2502.02492))

A video generation method emphasizing the motion coherence of the generated video clips.

> [!quote]
> we introduce **VideoJAM**, a novel framework that instills an effective motion prior to video generators, by encouraging the model to learn _a joint appearance-motion representation_.

# Diffusion Models

## Foundations

These works introduce novel foundational generative frameworks following the general idea of score matching or flow matching.

#### Score Matching with Missing Data ([Poster](https://icml.cc/virtual/2025/poster/44169), [arXiv](https://arxiv.org/abs/2506.00557))

> [!quote]
> Score matching is a vital tool for learning the distribution of data with applications across many areas including diffusion processes, energy based modelling, and graphical model estimation. Despite all these applications, little work explores its use when data is incomplete. We address this by adapting score matching (and its major extensions) to work with missing data in a flexible setting where data can be partially missing over any subset of the coordinates.

#### Normalizing Flows are Capable Generative Models ([Poster](https://icml.cc/virtual/2025/poster/46564), [arXiv](https://arxiv.org/abs/2412.06329))

A family of generative models based on normalizing flows.

> [!quote]
> Normalizing Flows (NFs) are likelihood-based models for continuous inputs. They have demonstrated promising results on both density estimation and generative modeling tasks, but have received relatively little attention in recent years. In this work, we demonstrate that NFs are more powerful than previously believed. We present TarFlow: a simple and scalable architecture that enables highly performant NF models.

## Analysis

#### Train for the Worst, Plan for the Best: Understanding Token Ordering in Masked Diffusions ([Poster](https://icml.cc/virtual/2025/poster/45990), [arXiv](https://arxiv.org/abs/2502.06768))

Analysis of the effectiveness of masked diffusion models' masking strategy during training.

> [!quote]
> Compared to autoregressive models (ARMs), MDMs trade off complexity at training time with flexibility at inference time. At training time, they must learn to solve an exponentially large number of infilling problems, but at inference time, they can decode tokens in essentially arbitrary order. In this work we closely examine these two competing effects.

#### Blink of an eye: a simple theory for feature localization in generative models ([Poster](https://icml.cc/virtual/2025/poster/45312), [arXiv](https://arxiv.org/abs/2502.00921))

Analysis of the phenomenon that diffusion models' outputs are largely decided in narrow windows of the generation process.

> [!quote]
> This phenomenon is not unique to autoregressive models: in diffusion models, key features of the final output are decided in narrow "critical windows" of the generation process. In this work we develop a simple, unifying theory to explain this phenomenon. We show that it emerges generically as the generation process localizes to a subpopulation of the distribution it models.

# Graph

## Representation Learning

Works on (mostly self-supervised) representation learning of graphs.

#### Equivalence is All: A Unified View for Self-supervised Graph Learning ([Poster](https://icml.cc/virtual/2025/poster/44874))

> [!quote]
> Node equivalence is common in graphs, encompassing automorphic equivalence (preserving adjacency under node permutations) and attribute equivalence (nodes with identical attributes). Despite their importance for learning node representations, these equivalences are largely ignored by existing graph models. To bridge this gap, we propose a GrAph self-supervised Learning framework with Equivalence (GALE) and analyze its connections to existing techniques.

## Generation

#### DeFoG: Discrete Flow Matching for Graph Generation ([Poster](https://icml.cc/virtual/2025/poster/45644), [arXiv](https://arxiv.org/abs/2410.04263))

A graph generation model based on discrete flow matching.

> [!quote]
> Graph diffusion models achieve superior performance but face inefficient sampling and limited flexibility due to the tight coupling between training and sampling stages. We introduce DeFoG, a novel graph generative framework that disentangles sampling from training, enabling a broader design space for more effective and efficient model optimization.

# Time Series

#### Sundial: A Family of Highly Capable Time Series Foundation Models ([Poster](https://icml.cc/virtual/2025/poster/45591), [arXiv](https://arxiv.org/abs/2502.00816))

A foundation model for time series that is pre-trained from the ground up and emphasizes scalability.

> [!quote]
> We introduce Sundial, a family of native, flexible, and scalable time series foundation models. To predict the next-patch's distribution, we propose a TimeFlow Loss based on flow-matching, which facilitates native pre-training of Transformers on time series without discrete tokenization.

# AI for Science

#### Learning Smooth and Expressive Interatomic Potentials for Physical Property Prediction ([Poster](https://icml.cc/virtual/2025/poster/45302), [arXiv](https://arxiv.org/abs/2502.12147))

A new machine learning interatomic potentials (MLIPs) method that emphasizes the practical ability to conserve energy during molecular dynamics simulations.

> [!quote]
> Machine learning interatomic potentials (MLIPs) have become increasingly effective at approximating quantum mechanical calculations at a fraction of the computational cost. However, lower errors on held out test sets do not always translate to improved results on downstream physical property prediction tasks.

#### The dark side of the forces: assessing non-conservative force models for atomistic machine learning ([Poster](https://icml.cc/virtual/2025/poster/45458), [arXiv](https://arxiv.org/abs/2412.11569))

Another paper discussing the instability of MLIPs and other machine learning-based atomic force estimation models.

> [!quote]
> Rigorous enforcement of symmetry and conservation laws has traditionally been considered essential. For this reason, interatomic forces are usually computed as the derivatives of the potential energy, ensuring energy conservation. Several recent works have questioned this physically constrained approach, suggesting that directly predicting the forces yields a better trade-off between accuracy and computational efficiency -- and that energy conservation can be learned during training.