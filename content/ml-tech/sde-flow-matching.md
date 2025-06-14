---
title: SDE, Flow Matching, and Shortcut Velocity Fields
draft: true
---
Recently, there has been a surge of efforts to build diffusion models capable of sampling in a single step. Most of these approaches leverage the flow matching framework, aiming to learn either a straight velocity field or one with shortcut connections. However, score-matching diffusion models--such as stochastic differential equations (SDEs)--still offer important advantages. This raises the question: can the principles of one-step flow matching models be applied to SDEs? In this post, we'll explore that possibility.

> Editor's note: This post extends my previous blog [[one-step-diffusion-models]]. After reading the newly published paper by Geng et al., *Mean Flows for One-Step Generative Modeling*, I decided to revisit one-step diffusion models.

---