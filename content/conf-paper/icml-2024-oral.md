---
title: ICML 2024 Oral Papers
---
Editor note: You will notice some papers with titles starting with “Position:”. These are called “**position papers**”. A position paper at ICML is a submission that advocates for a specific viewpoint, policy, or call to action within the machine learning community, rather than presenting novel technical results. (Got to say, there a lot of political papers in this track, you can check them out yourself if you are interested)

# LLMs

## Inference Framework

Some novel inference schemes for LLMs:

> Zhao, Stephen, Rob Brekelmans, Alireza Makhzani, and Roger Baker Grosse. “Probabilistic Inference in Language Models via Twisted Sequential Monte Carlo,” 2024. [https://openreview.net/forum?id=frA0NNBS1n](https://openreview.net/forum?id=frA0NNBS1n).

## Analysis

A pretty cutting-edge work discussing the possibilities of AGIs:

> Hughes, Edward, Michael D. Dennis, Jack Parker-Holder, Feryal Behbahani, Aditi Mavalankar, Yuge Shi, Tom Schaul, and Tim Rocktäschel. “Position: Open-Endedness Is Essential for Artificial Superhuman Intelligence,” 2024. [https://openreview.net/forum?id=Bc4vZ2CX7E](https://openreview.net/forum?id=Bc4vZ2CX7E).

A very interesting work investigating the portion of AI-generated or AI-enhanced contents in academic publications:

> Liang, Weixin, Zachary Izzo, Yaohui Zhang, Haley Lepp, Hancheng Cao, Xuandong Zhao, Lingjiao Chen, et al. “Monitoring AI-Modified Content at Scale: A Case Study on the Impact of ChatGPT on AI Conference Peer Reviews,” 2024. [https://openreview.net/forum?id=bX3J7ho18S](https://openreview.net/forum?id=bX3J7ho18S).

A few works analyzing different perspectives of LLMs:

> Liu, Ryan, Theodore Sumers, Ishita Dasgupta, and Thomas L. Griffiths. “How Do Large Language Models Navigate Conflicts between Honesty and Helpfulness?,” 2024. [https://openreview.net/forum?id=685vj0lC9z](https://openreview.net/forum?id=685vj0lC9z).

A work discussing both positive and negative aspects of open-source foundation models:

> Kapoor, Sayash, Rishi Bommasani, Kevin Klyman, Shayne Longpre, Ashwin Ramaswami, Peter Cihon, Aspen K. Hopkins, et al. “Position: On the Societal Impact of Open Foundation Models,” 2024. [https://openreview.net/forum?id=jRX6yCxFhx](https://openreview.net/forum?id=jRX6yCxFhx).

A work investigating the difference in (forward and backward) directions in auto-regressive LLMs:

> Papadopoulos, Vassilis, Jérémie Wenger, and Clément Hongler. “Arrows of Time for Large Language Models,” 2024. [https://openreview.net/forum?id=UpSe7ag34v](https://openreview.net/forum?id=UpSe7ag34v).

An interesting perspective on guiding LLMs to desired behavior:

> Khan, Akbir, John Hughes, Dan Valentine, Laura Ruis, Kshitij Sachan, Ansh Radhakrishnan, Edward Grefenstette, Samuel R. Bowman, Tim Rocktäschel, and Ethan Perez. “Debating with More Persuasive LLMs Leads to More Truthful Answers,” 2024. [https://openreview.net/forum?id=iLCZtl7FTa](https://openreview.net/forum?id=iLCZtl7FTa).

## Agents

A few works on LLM-based agents that can accomplish complex real-world tasks:

> Liu, Fei, Tong Xialiang, Mingxuan Yuan, Xi Lin, Fu Luo, Zhenkun Wang, Zhichao Lu, and Qingfu Zhang. “Evolution of Heuristics: Towards Efficient Automatic Algorithm Design Using Large Language Model,” 2024. [https://openreview.net/forum?id=BwAkaxqiLB](https://openreview.net/forum?id=BwAkaxqiLB).

A work discussing the competition aspect of agent systems:

> Zhao, Qinlin, Jindong Wang, Yixuan Zhang, Yiqiao Jin, Kaijie Zhu, Hao Chen, and Xing Xie. “CompeteAI: Understanding the Competition Dynamics of Large Language Model-Based Agents,” 2024. [https://openreview.net/forum?id=wGtzp4ZT1n](https://openreview.net/forum?id=wGtzp4ZT1n).

A few works on the “world model”:

> Lin, Jessy, Yuqing Du, Olivia Watkins, Danijar Hafner, Pieter Abbeel, Dan Klein, and Anca Dragan. “Learning to Model the World With Language,” 2024. [https://openreview.net/forum?id=7dP6Yq9Uwv](https://openreview.net/forum?id=7dP6Yq9Uwv).

> Bruce, Jake, Michael D. Dennis, Ashley Edwards, Jack Parker-Holder, Yuge Shi, Edward Hughes, Matthew Lai, et al. “Genie: Generative Interactive Environments,” 2024. [https://openreview.net/forum?id=bJbSbJskOS](https://openreview.net/forum?id=bJbSbJskOS).

A framework that fuses code writing and semantic understanding capabilities of LLMs to achieve superior performance in complex task solving:

> Li, Chengshu, Jacky Liang, Andy Zeng, Xinyun Chen, Karol Hausman, Dorsa Sadigh, Sergey Levine, Li Fei-Fei, Fei Xia, and Brian Ichter. “Chain of Code: Reasoning with a Language Model-Augmented Code Emulator,” 2024. [https://openreview.net/forum?id=vKtomqlSxm](https://openreview.net/forum?id=vKtomqlSxm).

## Training

> Zhao, Jiawei, Zhenyu Zhang, Beidi Chen, Zhangyang Wang, Anima Anandkumar, and Yuandong Tian. “GaLore: Memory-Efficient LLM Training by Gradient Low-Rank Projection,” 2024. [https://openreview.net/forum?id=hYHsrKDiX7](https://openreview.net/forum?id=hYHsrKDiX7).

## Adaptation & Fine-tuning

A solution for retaining the benefits (superior performance) of over-parameterization without the downsides (computational burden):

> Yaras, Can, Peng Wang, Laura Balzano, and Qing Qu. “Compressible Dynamics in Deep Overparameterized Low-Rank Learning & Adaptation,” 2024. [https://openreview.net/forum?id=uDkXoZMzBv](https://openreview.net/forum?id=uDkXoZMzBv).

A work discussing the effect of RLHF in scenarios where human supervision is weak and AI model outputs are complex:

> Burns, Collin, Pavel Izmailov, Jan Hendrik Kirchner, Bowen Baker, Leo Gao, Leopold Aschenbrenner, Yining Chen, et al. “Weak-to-Strong Generalization: Eliciting Strong Capabilities With Weak Supervision,” 2024. [https://openreview.net/forum?id=ghNRg2mEgN](https://openreview.net/forum?id=ghNRg2mEgN).

A work comparing the difference between two RLHF techniques:

> Xu, Shusheng, Wei Fu, Jiaxuan Gao, Wenjie Ye, Weilin Liu, Zhiyu Mei, Guangju Wang, Chao Yu, and Yi Wu. “Is DPO Superior to PPO for LLM Alignment? A Comprehensive Study,” 2024. [https://openreview.net/forum?id=6XH8R7YrSk](https://openreview.net/forum?id=6XH8R7YrSk).

## Prompting & RAG

A work on the topic of Generative Document Retrieval, which is pretty relevant for domain-specific LLM adaptations:

> Du, Xin, Lixin Xiu, and Kumiko Tanaka-Ishii. “Bottleneck-Minimal Indexing for Generative Document Retrieval,” 2024. [https://openreview.net/forum?id=MFPYCvWsNR](https://openreview.net/forum?id=MFPYCvWsNR).

A work on selective RAG on large-scale context:

> Wu, Di, Wasi Uddin Ahmad, Dejiao Zhang, Murali Krishna Ramanathan, and Xiaofei Ma. “Repoformer: Selective Retrieval for Repository-Level Code Completion,” 2024. [https://openreview.net/forum?id=moyG54Okrj](https://openreview.net/forum?id=moyG54Okrj).

## Attack

Without the evolvement of attack methods, there will be no development of anti-attack methods. Another question is, can these attack methods themselves be proven useful for us?

> Carlini, Nicholas, Daniel Paleka, Krishnamurthy Dj Dvijotham, Thomas Steinke, Jonathan Hayase, A. Feder Cooper, Katherine Lee, et al. “Stealing Part of a Production Language Model,” 2024. [https://openreview.net/forum?id=VE3yWXt3KB](https://openreview.net/forum?id=VE3yWXt3KB).

# Computer Vision

## Image Modeling

Another vision Transformer model that tokenizes images:

> Ren, Sucheng, Zeyu Wang, Hongru Zhu, Junfei Xiao, Alan Yuille, and Cihang Xie. “Rejuvenating Image-GPT as Strong Visual Representation Learners,” 2024. [https://openreview.net/forum?id=mzGtunvpJH](https://openreview.net/forum?id=mzGtunvpJH).

## Video Modeling

A work adopts the “Chain-of-Thought” idea for video modeling:

> Fei, Hao, Shengqiong Wu, Wei Ji, Hanwang Zhang, Meishan Zhang, Mong-Li Lee, and Wynne Hsu. “Video-of-Thought: Step-by-Step Video Reasoning from Perception to Cognition,” 2024. [https://openreview.net/forum?id=fO31YAyNbI](https://openreview.net/forum?id=fO31YAyNbI).

## Multi-Modal

A few multi-modal video generation models that share a similar idea: Unify different modalities into tokens for a single Transformer network. Reminds me of the “Transfusion” work in ICLR 2025 Oral.

[ICLR 2025 Oral Papers](https://www.notion.so/ICLR-2025-Oral-Papers-1d41bbba0f5880e8b69ac109c1d36bc6?pvs=21)

> Kondratyuk, Dan, Lijun Yu, Xiuye Gu, Jose Lezama, Jonathan Huang, Grant Schindler, Rachel Hornung, et al. “VideoPoet: A Large Language Model for Zero-Shot Video Generation,” 2024. [https://openreview.net/forum?id=LRkJwPIDuE](https://openreview.net/forum?id=LRkJwPIDuE).

> Jin, Yang, Zhicheng Sun, Kun Xu, Liwei Chen, Hao Jiang, Quzhe Huang, Chengru Song, et al. “Video-LaVIT: Unified Video-Language Pre-Training with Decoupled Visual-Motional Tokenization,” 2024. [https://openreview.net/forum?id=S9lk6dk4LL](https://openreview.net/forum?id=S9lk6dk4LL).

A multi-modal foundation model following the relatively “conventional” modality alignment approach:

> Wu, Shengqiong, Hao Fei, Leigang Qu, Wei Ji, and Tat-Seng Chua. “NExT-GPT: Any-to-Any Multimodal LLM,” 2024. [https://openreview.net/forum?id=NZQkumsNlf](https://openreview.net/forum?id=NZQkumsNlf).

# Diffusion Models

A novel framework for discrete diffusion models:

> Lou, Aaron, Chenlin Meng, and Stefano Ermon. “Discrete Diffusion Modeling by Estimating the Ratios of the Data Distribution,” 2024. [https://openreview.net/forum?id=CNicRIVIPA](https://openreview.net/forum?id=CNicRIVIPA).

Rectified flow is a family of diffusion models that aim to complete the sampling process in a few steps or one step:

> Esser, Patrick, Sumith Kulal, Andreas Blattmann, Rahim Entezari, Jonas Müller, Harry Saini, Yam Levi, et al. “Scaling Rectified Flow Transformers for High-Resolution Image Synthesis,” 2024. [https://openreview.net/forum?id=FPnUhsQJ5B](https://openreview.net/forum?id=FPnUhsQJ5B).

A diffusion model that achieves controlled generation through manipulating the initial noise ($x_T$):

> Novack, Zachary, Julian McAuley, Taylor Berg-Kirkpatrick, and Nicholas J. Bryan. “DITTO: Diffusion Inference-Time T-Optimization for Music Generation,” 2024. [https://openreview.net/forum?id=z5Ux2u6t7U](https://openreview.net/forum?id=z5Ux2u6t7U).

A diffusion model that enables generation conditioned on non-differentiable rules:

> Huang, Yujia, Adishree Ghatare, Yuanzhe Liu, Ziniu Hu, Qinsheng Zhang, Chandramouli Shama Sastry, Siddharth Gururani, Sageev Oore, and Yisong Yue. “Symbolic Music Generation with Non-Differentiable Rule Guided Diffusion,” 2024. [https://openreview.net/forum?id=g8AigOTNXL](https://openreview.net/forum?id=g8AigOTNXL).

A novel diffusion model for high-dimensional and high-cardinality data structures:

> Park, Sungwoo, Dongjun Kim, and Ahmed Alaa. “Mean-Field Chaos Diffusion Models,” 2024. [https://openreview.net/forum?id=lgcFX4VFrM](https://openreview.net/forum?id=lgcFX4VFrM).

# Time Series

A time series “foundation” model:

> Woo, Gerald, Chenghao Liu, Akshat Kumar, Caiming Xiong, Silvio Savarese, and Doyen Sahoo. “Unified Training of Universal Time Series Forecasting Transformers,” 2024. [https://openreview.net/forum?id=Yd8eHMY1wz](https://openreview.net/forum?id=Yd8eHMY1wz).

An extremely efficient time series forecasting model:

> Lin, Shengsheng, Weiwei Lin, Wentai Wu, Haojun Chen, and Junjie Yang. “SparseTSF: Modeling Long-Term Time Series Forecasting with _1k_ Parameters,” 2024. [https://openreview.net/forum?id=54NSHO0lFe](https://openreview.net/forum?id=54NSHO0lFe).

A work investigating the source of subpar performance of Transformers on time series:

> Ilbert, Romain, Ambroise Odonnat, Vasilii Feofanov, Aladin Virmaux, Giuseppe Paolo, Themis Palpanas, and Ievgen Redko. “SAMformer: Unlocking the Potential of Transformers in Time Series Forecasting with Sharpness-Aware Minimization and Channel-Wise Attention,” 2024. [https://openreview.net/forum?id=8kLzL5QBh2](https://openreview.net/forum?id=8kLzL5QBh2).

# Neural Network

## Transformer

A few works that propose novel Transformer architectures:

> Xiao, Da, Qingye Meng, Shengping Li, and Xingyuan Yuan. “Improving Transformers with Dynamically Composable Multi-Head Attention,” 2024. [https://openreview.net/forum?id=RbiBKPtuHp](https://openreview.net/forum?id=RbiBKPtuHp).

> Miao, Siqi, Zhiyuan Lu, Mia Liu, Javier Duarte, and Pan Li. “Locality-Sensitive Hashing-Based Efficient Point Transformer with Applications in High-Energy Physics,” 2024. [https://openreview.net/forum?id=vJx6fld6l0](https://openreview.net/forum?id=vJx6fld6l0).

## RNN

Surprisingly, a few works introducing new insights into RNNs:

> Herrmann, Vincent, Francesco Faccio, and Jürgen Schmidhuber. “Learning Useful Representations of Recurrent Neural Network Weight Matrices,” 2024. [https://openreview.net/forum?id=QBj7Uurdwf](https://openreview.net/forum?id=QBj7Uurdwf).

## GNN

Really, someone is still proposing new GNN networks:

> Xing, Yujie, Xiao Wang, Yibo Li, Hai Huang, and Chuan Shi. “Less Is More: On the Over-Globalizing Problem in Graph Transformers,” 2024. [https://openreview.net/forum?id=uKmcyyrZae](https://openreview.net/forum?id=uKmcyyrZae).

## NeuralODE

A family of neural networks that excels in physical simulation, modeling continuous data, etc.:

> Cho, Woojin, Minju Jo, Haksoo Lim, Kookjin Lee, Dongeun Lee, Sanghyun Hong, and Noseong Park. “Parameterized Physics-Informed Neural Networks for Parameterized PDEs,” 2024. [https://openreview.net/forum?id=n3yYrtt9U7](https://openreview.net/forum?id=n3yYrtt9U7).

> Rathore, Pratik, Weimu Lei, Zachary Frangella, Lu Lu, and Madeleine Udell. “Challenges in Training PINNs: A Loss Landscape Perspective,” 2024. [https://openreview.net/forum?id=mJGiFr8jLa](https://openreview.net/forum?id=mJGiFr8jLa).

# AI4Science

> Jing, Bowen, Bonnie Berger, and Tommi Jaakkola. “AlphaFold Meets Flow Matching for Generating Protein Ensembles,” 2024. [https://openreview.net/forum?id=rs8Sh2UASt](https://openreview.net/forum?id=rs8Sh2UASt).

> Zhang, Yang, Zhewei Wei, Ye Yuan, Chongxuan Li, and Wenbing Huang. “EquiPocket: An E(3)-Equivariant Geometric Graph Neural Network for Ligand Binding Site Prediction,” 2024. [https://openreview.net/forum?id=1vGN3CSxVs](https://openreview.net/forum?id=1vGN3CSxVs).

> Liu, Songtao, Hanjun Dai, Yue Zhao, and Peng Liu. “Preference Optimization for Molecule Synthesis with Conditional Residual Energy-Based Models,” 2024. [https://openreview.net/forum?id=oLfq1KKneW](https://openreview.net/forum?id=oLfq1KKneW).

# ML Theory

## Dataset Analysis

A paper systematically evaluate the “diversity” of datasets:

> Zhao, Dora, Jerone Andrews, Orestis Papakyriakopoulos, and Alice Xiang. “Position: Measure Dataset Diversity, Don’t Just Claim It,” 2024. [https://openreview.net/forum?id=jsKr6RVDDs](https://openreview.net/forum?id=jsKr6RVDDs).

## Representation Learning

A work suggesting that the representation learning in AI models are converging:

> Huh, Minyoung, Brian Cheung, Tongzhou Wang, and Phillip Isola. “Position: The Platonic Representation Hypothesis,” 2024. [https://openreview.net/forum?id=BH8TYy0r6u](https://openreview.net/forum?id=BH8TYy0r6u).

“In this work, we present the first results proving that feature learning occurs during training with a nonlinear model on multiple tasks”:

> Collins, Liam, Hamed Hassani, Mahdi Soltanolkotabi, Aryan Mokhtari, and Sanjay Shakkottai. “Provable Multi-Task Representation Learning by Two-Layer ReLU Neural Networks,” 2024. [https://openreview.net/forum?id=M8UbECx485](https://openreview.net/forum?id=M8UbECx485).

# Others

Good point, but can this work make it possible to publish peer-reviewed papers with subpar performance compared to SOTA baselines? Probably not. Joke aside, I think the value of a paper ultimately greatly depends on how you position it, so this work can be valuable:

> Karl, Florian, Malte Kemeter, Gabriel Dax, and Paulina Sierak. “Position: Embracing Negative Results in Machine Learning,” 2024. [https://openreview.net/forum?id=3RXAiU7sss](https://openreview.net/forum?id=3RXAiU7sss).