---
title: B-Infrastructure & Deployment of AI
draft: false
---
> [!tldr] TL;DR
> In this phase, we will dive into the backend infrastructure—both software and hardware—of AI systems, glance into how they work, and learn how to deploy our AI service on infrastructure other than our own PC.

In the previous phase [[interact-with-ai-systems|Interact with AI Systems]] we have learned how to interact with existing AI services, and even build your own AI service running on your laptop. But you've probably noticed that your service runs slower than most of the paid AI services you've interacted with, and makes your laptop sound like a jet engine.

To understand the reason behind the speed difference, we need to dive into the hardware infrastructure supporting the running of AI models and services ([[ai-compute-hardware|AI compute hardware]]). We will then explore the wide world of different types of hardware infrastructure for us to deploy our AI service on, so that we can free our laptop from heavy-duty work ([[cloud-deployment|Cloud deployment]] and [[edge-self-hosted-deployment|Edge & self-hosted deployment]]). And before we proceed to run our AI service on such infrastructure, we will also learn about the software infrastructure that is hardware-agnostic and will make deployment much easier ([[packaging-containerization|Packaging & containerization]]).
