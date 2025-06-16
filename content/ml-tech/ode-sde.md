---
title: ODE, SDE, and Shortcut Vector Fields
draft: true
---
>[!TLDR]

> Editor's note: This post extends my [[one-step-diffusion-models|previous blog on one-step diffusion models]]. After reading the newly published paper by Geng et al., *Mean Flows for One-Step Generative Modeling*, I decided to revisit this topic.

# Differential Equations and Vector Fields

Let's start with a general scenario of **generative modeling**: suppose you want to generate data $x$ that follows a distribution $p(x)$. In many cases, the exact form of $p(x)$ is unknown. What you can do is follow the idea of *normalizing flow*[^1]: start from a very simple, closed-form distribution $p(x_1)$ (for example, a standard normal distribution), transform this distribution through time $t\in [0, 1]$ with intermediate distributions $p(x_t)$, and finally obtain the estimated distribution $p(x_0)$. By doing this, you are essentially trying to solve a *differential equation (DE)*[^2] that depends on time:

$$
dx_t=\mu(x_t,t)dt+\sigma(x_t,t)dW_t
$$

where $\mu$ is the drift component that is deterministic, and $\sigma$ is the diffusion term driven by Brownian motion[^3] (denoted by $W_t$) that is stochastic. This differential equation specifies a *time-dependent vector field*[^4] telling how a data point $x_t$ should be moved as time $t$ evolves from $t=1$ to $t=0$ (i.e., a *flow*[^5] from $x_1$ to $x_0$). Below we give an illustration where $x_t$ is 1-dimensional:

![[Untitled-2025-06-11-1554.png]]
> Vector field between two distributions specified by a differential equation.

When $\sigma(x_t,t)\equiv 0$, we get an *ordinary differential equation (ODE)*[^6] $\frac{dx_t}{dt}=\mu(x_t,t)$ where the vector field is deterministic, i.e., the movement of $x_t$ is fully determined by $\mu$ and $t$. Otherwise, we get a *stochastic differential equation (SDE)*[^7] where the movement of $x_t$ has a certain level of randomness, described by the diffusion component $\sigma(x_t,t)dW_t$. Extending the previous illustration, below we show the difference in flow of $x_t$ under ODE and SDE:

![[Pasted image 20250615150129.png]]
> Difference of movements in vector fields specified by ODE and SDE. *Source: Song, Yang, et al. "Score-based generative modeling through stochastic differential equations."*

As you would imagine, once we manage to solve the differential equation, even if we still cannot have a closed form of $p(x_0)$, we can sample from $p(x_0)$ by sampling a data point $x_1$ from $p(x_1)$ and get the generated data point $x_0$ by calculating the following reverse-time integral with an integration technique of our choice:

$$
x_0 = x_1 + \int_1^0 \mu(x_t,t)dt + \int_1^0 \sigma(x_t,t)dW_t
$$

Or more intuitively, moving $x_1$ towards $x_0$ along time in the vector field:

![[Untitled-2025-06-11-1554-2.png]]
> A data point moving from $x_1$ towards $x_0$ in the vector field.

# ODE and Flow Matching

## ODE in Generative Modeling

For now, let's focus on the ODE formulation since it is notationally simpler compared to SDE. Recall the ODE of our generative model:

$$
\frac{dx_t}{dt}=\mu(x_t,t)
$$

Essentially, $\mu$ is the vector field. For every possible combinations of data point $x_t$ and time $t$, $\mu(x_t,t)$ is the instantaneous direction and speed in which the point will move. To generate a data point $x_0$, we perform the integral:

$$
x_0=x_1+\int_1^0 \mu(x_t,t)dt
$$

To calculate this integral, a simple and widely adopted method is the Euler method[^8]. Choose $N$ number of of time steps $1=t_N>t_{N-1}>\dots>t_0=0$, and for each integral step $k=N-1, \dots, 0$:

$$
x_{t_{k-1}} = x_{t_k}+(t_k-t_{k-1})\mu(x_{t_k},t_k)
$$

In other words, it discretize the time span $[0, 1]$ into $N$ time steps, and for each step the data is moved based on the instantaneous direction and speed at the current step.

> There are other methods to calculate the integral, of course. For example, one can use the solvers in `torchdiffeq` python package.

## Flow Matching

In many scenarios, the exact form of the vector field $\mu$ is still unknown. The general idea of flow matching[^9] is to find a ground truth vector field that defines the flow transporting $p(x_1)$ to $p(x_0)$, and build a neural network $\mu_\theta$ that is trained to match the ground truth vector field, hence the name. In practice, this is usually done by independently sample $x_0$ from the training data and $x_1$ from noise, calculate the intermediate data point $x_t$ and the ground truth vector $\mu(x_t,t)$, and minimize the deviation between $\mu_\theta(x_t,t)$ and $\mu(x_t,t)$.

Ideally, the ground truth vector field should be as straight as possible, so we can use a small number of $N$ steps to calculate the ODE integral. Thus, the ground truth vector is usually defined following the optimal transport map:

$$
x_t=tx_1+(1-t)x_0,\mu(x_t,t)=x_0-x_1
$$

And a neural network $\mu_\theta$ is trained to match the ground truth vectors as:

$$
\mathcal L=\mathbb E_{x_0,x_1,t}\parallel \mu_\theta(x_t,t)-(x_0-x_1)\parallel^2
$$

## Curvy Vector Field

Although the ground truth vector field is designed to be straight, in practice it is usually not. When the data space is high-dimensional and the target distribution $p(x_0)$ is complex, there will be multiple pairs of $(x_0, x_1)$ that result in the same intermediate data point $x_t$, thus multiple vectors $x_0-x_1$. At the end of day, the actual ground truth vector at $x_t$ will be the average of all possible vectors $x_0-x_1$ that pass through $x_t$. This will lead to a "curvy" vector field, illustrated as follows:

![[Pasted image 20250616092835.png]]
> Left: multiple vectors passing through the same intermediate data point. Right: the result ground truth vector field. *Source: Geng, Zhengyang, et al. "Mean Flows for One-step Generative Modeling."* Note $z_t$ and $v$ in the figure correspond to $x_t$ and $\mu$ in this post, respectively.

As we discussed, when you calculate the ODE integral, you are using the instantaneous direction and speed--tangent of the curves in the vector field--of each step. You would imagine this will lead to subpar performance when using few number $N$ of steps, as demonstrated below:

![[Pasted image 20250616093805.png]]
> Native flow matching models fail at few-step sampling. *Source: Frans, Kevin, et al. "One step diffusion via shortcut models."* Note that the time is reversed in the figure.

## Shortcut Vector Field

If we cannot straighten the ground truth vector field, can we tackle the problem of few-step sampling by learning vectors that properly jump across long time steps instead of learning the instantaneous vectors? Yes we can.

### Shortcut Models

Shortcut models[^10] implement the above idea by training a network $u_\theta(x_t,t,\Delta t)$ to match the *vectors that jump across long time steps* (termed *shortcuts* in the paper). A ground truth shortcut $u(x_t,t,\Delta t)$ will be the vector pointing from $x_t$ to $x_{t-\Delta t}$. Ideally, you can transform $x_1$ to $x_0$ within one step with the learned shortcuts:

$$
x_0=x_1+u(x_1,1,1)
$$

> [!note]
> Of course, in practice shortcut models face the same problem mentioned in the [[#Curvy Vector Field]]: the same data point $x_1$ corresponds to multiple shortcut vectors to different data points $x_0$, making the ground truth shortcut vector at $x_1$ being the average of all possibilities. So, the shortcut models have performance advantage with few sampling steps compared to conventional flow matching models, but typically don't have the same performance with one step versus more steps.

The theory is quite straight-forward. The tricky part is in the model training. First, the network expands from learning all possibilities of vectors at $(x_t,t)$ to all shortcuts at $(x_t,t, \Delta t)$ with $\Delta t\in [0, t]$. Essentially the shortcut vector field have one more dimension than the instantaneous vector field, making the learning space larger. Second, calculating the ground truth vector $x_{t-\Delta t}-x_t$ involves calculating the integral $\int^{t-\Delta t}_t \mu(x_t,t)$, which can be computational heavy.

To tackle these challenges, shortcut models introduce *self-consistency shortcuts*: one shortcut vector with step size $2\Delta t$ should equals two consecutive shortcut vectors both with step size $\Delta t$:

$$
u(x_t,t,2\Delta t)=u(x_t,t,\Delta t)/2+u(x_{t-\Delta t},t-\Delta t,\Delta t)/2
$$

The model is then trained with the combination of matching instantaneous vectors and self-consistency shortcuts as below. Notice that we don't train a separate network for matching the instantaneous vectors but leveraging the fact that the shortcut $u(x_t,t,\Delta t)$ is the instantaneous vector when $\Delta t\rightarrow 0$.

$$
\mathcal{L} = \mathbb{E} [ \underbrace{\| u_\theta(x_t, t, 0) - (x_0 - x_1)\|^2}_{\text{Flow-Matching}} +
\underbrace{\|u_\theta(x_t, t, 2\Delta t) - \mathbf{u}_{\text{target}}\|^2}_{\text{Self-Consistency}}],
$$
$$
\quad \mathbf{u}_{\text{target}} = u_\theta(x_t, t, \Delta t)/2 + u_\theta(x'_{t-\Delta t}, t - \Delta t, \Delta t)/2 \quad 
\text{and} \quad x'_{t-\Delta t} = x_t + \Delta t \cdot u_\theta(x_t, t, \Delta t)
$$

Where $\mathbf{u}_\text{target}$ is detached from back propagation acting as a pseudo ground truth. Below is an illustration of the training process provided in the original paper.

![[Pasted image 20250616100336.png]]
> Training of the shortcut models with self-consistency loss.

### Mean Flow

# SDE and Score Matching

[^1]: Rezende, Danilo, and Shakir Mohamed. "Variational inference with normalizing flows."
[^2]: https://en.wikipedia.org/wiki/Differential_equation
[^3]: https://en.wikipedia.org/wiki/Brownian_motion
[^4]: https://en.wikipedia.org/wiki/Vector_field
[^5]: https://en.wikipedia.org/wiki/Vector_flow
[^6]: https://en.wikipedia.org/wiki/Ordinary_differential_equation
[^7]: https://en.wikipedia.org/wiki/Stochastic_differential_equation
[^8]: https://en.wikipedia.org/wiki/Euler_method
[^9]: Lipman, Yaron, et al. "Flow matching for generative modeling."
[^10]: Frans, Kevin, et al. "One step diffusion via shortcut models.
