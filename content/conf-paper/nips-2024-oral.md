---
title: NeurIPS 2024 Oral Papers
---
# Large Language Models

## Training & Fine-tuning

A work claiming that not all tokens in a corpus are equally important for LLM training:

> Lin, Zhenghao, Zhibin Gou, Yeyun Gong, Xiao Liu, Yelong Shen, Ruochen Xu, Chen Lin, et al. “Not All Tokens Are What You Need for Pretraining,” 2024. [https://openreview.net/forum?id=0NMzBwqaAJ](https://openreview.net/forum?id=0NMzBwqaAJ).

A novel LoRA framework:

> Tian, Chunlin, Zhan Shi, Zhijiang Guo, Li Li, and Cheng-zhong Xu. “HydraLoRA: An Asymmetric LoRA Architecture for Efficient Fine-Tuning,” 2024. [https://openreview.net/forum?id=qEpi8uWX3N](https://openreview.net/forum?id=qEpi8uWX3N).

## Prompting & RAG

A few works on the Chain-of-Thought framework for LLMs:

> Chen, Qiguang, Libo Qin, Jiaqi Wang, Jingxuan Zhou, and Wanxiang Che. “Unlocking the Capabilities of Thought: A Reasoning Boundary Framework to Quantify and Optimize Chain-of-Thought,” 2024. [https://openreview.net/forum?id=pC44UMwy2v](https://openreview.net/forum?id=pC44UMwy2v).

> Xue, Shangzi, Zhenya Huang, Jiayu Liu, Xin Lin, Yuting Ning, Binbin Jin, Xin Li, and Qi Liu. “Decompose, Analyze and Rethink: Solving Intricate Problems with Human-like Reasoning Cycle,” 2024. [https://openreview.net/forum?id=NPKZF1WDjZ](https://openreview.net/forum?id=NPKZF1WDjZ).

## Adaptation

Papers on how to align and adapt LLMs to specific requirements:

> Ji, Jiaming, Boyuan Chen, Hantao Lou, Donghai Hong, Borong Zhang, Xuehai Pan, Tianyi Qiu, Juntao Dai, and Yaodong Yang. “Aligner: Efficient Alignment by Learning to Correct,” 2024. [https://openreview.net/forum?id=kq166jACVP](https://openreview.net/forum?id=kq166jACVP).

## Analysis

Systematic analysis of LLMs’ zero-shot capability on tasks not present in training set:

> He, Tianyu, Darshil Doshi, Aritra Das, and Andrey Gromov. “Learning to Grok: Emergence of in-Context Learning and Skill Composition in Modular Arithmetic Tasks,” 2024. [https://openreview.net/forum?id=aVh9KRZdRk](https://openreview.net/forum?id=aVh9KRZdRk).

An interesting work analyzing LLMs’ understanding of human humor:

> Hu, Zhe, Tuo Liang, Jing Li, Yiren Lu, Yunlai Zhou, Yiran Qiao, Jing Ma, and Yu Yin. “Cracking the Code of Juxtaposition: Can AI Models Understand the Humorous Contradictions,” 2024. [https://openreview.net/forum?id=bCMpdaQCNW](https://openreview.net/forum?id=bCMpdaQCNW).

## Optimization

A few works on how to optimize and compress LLMs:

> Malinovskii, Vladimir, Denis Mazur, Ivan Ilin, Denis Kuznedelev, Konstantin Pavlovich Burlachenko, Kai Yi, Dan Alistarh, and Peter Richtárik. “PV-Tuning: Beyond Straight-Through Estimation for Extreme LLM Compression,” 2024. [https://openreview.net/forum?id=YvA8UF0I37](https://openreview.net/forum?id=YvA8UF0I37).

> Sun, Yutao, Li Dong, Yi Zhu, Shaohan Huang, Wenhui Wang, Shuming Ma, Quanlu Zhang, Jianyong Wang, and Furu Wei. “You Only Cache Once: Decoder-Decoder Architectures for Language Models,” 2024. [https://openreview.net/forum?id=25Ioxw576r](https://openreview.net/forum?id=25Ioxw576r).

> Lin, Haokun, Haobo Xu, Yichen Wu, Jingzhi Cui, Yingtao Zhang, Linzhan Mou, Linqi Song, Zhenan Sun, and Ying Wei. “DuQuant: Distributing Outliers via Dual Transformation Makes Stronger Quantized LLMs,” 2024. [https://openreview.net/forum?id=mp8u2Pcmqz](https://openreview.net/forum?id=mp8u2Pcmqz).

# Computer Vision

## Image Generation

A novel framework for generating high-resolution images by starting from a low-resolution image and gradually improving its resolution in an auto-regressive style:

> Tian, Keyu, Yi Jiang, Zehuan Yuan, Bingyue Peng, and Liwei Wang. “Visual Autoregressive Modeling: Scalable Image Generation via Next-Scale Prediction,” 2024. [https://openreview.net/forum?id=gojL67CfS8](https://openreview.net/forum?id=gojL67CfS8).

A work focuses on improving the sampling quality of diffusion models, especially when number of sample timesteps are small:

> Yoon, Sangwoong, Himchan Hwang, Dohyun Kwon, Yung-Kyun Noh, and Frank C. Park. “Maximum Entropy Inverse Reinforcement Learning of Diffusion Models with Energy-Based Models,” 2024. [https://openreview.net/forum?id=V0oJaLqY4E](https://openreview.net/forum?id=V0oJaLqY4E).

A solution for automatically selecting the optimal adapter for conditioned generation:

> Luo, Michael, Justin Wong, Brandon Trabucco, Yanping Huang, Joseph E. Gonzalez, Zhifeng Chen, Russ Salakhutdinov, and Ion Stoica. “Stylus: Automatic Adapter Selection for Diffusion Models,” 2024. [https://openreview.net/forum?id=3Odq2tGSpp](https://openreview.net/forum?id=3Odq2tGSpp).

An alternative guidance framework to the classifier-free guidance:

> Karras, Tero, Miika Aittala, Tuomas Kynkäänniemi, Jaakko Lehtinen, Timo Aila, and Samuli Laine. “Guiding a Diffusion Model with a Bad Version of Itself,” 2024. [https://openreview.net/forum?id=bg6fVPVs3s](https://openreview.net/forum?id=bg6fVPVs3s).

A paper dive into the specific problem of unconditioned generation:

> Li, Tianhong, Dina Katabi, and Kaiming He. “Return of Unconditional Generation: A Self-Supervised Representation Generation Method,” 2024. [https://openreview.net/forum?id=clTa4JFBML](https://openreview.net/forum?id=clTa4JFBML).

A work on improving the sampling efficiency of diffusion models:

> Yin, Tianwei, Michaël Gharbi, Taesung Park, Richard Zhang, Eli Shechtman, Fredo Durand, and William T. Freeman. “Improved Distribution Matching Distillation for Fast Image Synthesis,” 2024. [https://openreview.net/forum?id=tQukGCDaNT](https://openreview.net/forum?id=tQukGCDaNT).

## Multi-modal

A survey style paper on the multi-modal LLMs:

> Tong, Shengbang, Ellis L. Brown Ii, Penghao Wu, Sanghyun Woo, Adithya Jairam Iyer, Sai Charitha Akula, Shusheng Yang, et al. “Cambrian-1: A Fully Open, Vision-Centric Exploration of Multimodal LLMs,” 2024. [https://openreview.net/forum?id=Vi8AepAXGy](https://openreview.net/forum?id=Vi8AepAXGy).

# NN Foundations

## Diffusion Models

A new framework for diffusion models with high training and sample efficiency:

> Terpin, Antonio, Nicolas Lanzetti, Martín Gadea, and Florian Dorfler. “Learning Diffusion at Lightspeed,” 2024. [https://openreview.net/forum?id=y10avdRFNK](https://openreview.net/forum?id=y10avdRFNK).

A work discussing utilization of diffusion models as a representation learning framework:

> Xu, Zhengrui, Guan’an Wang, Xiaowen Huang, and Jitao Sang. “DenoiseRep: Denoising Model for Representation Learning,” 2024. [https://openreview.net/forum?id=OycU0bAus6](https://openreview.net/forum?id=OycU0bAus6).

# ML Foundations

## Model Training

A work focuses on efficient optimizing of neural networks with loss that contain high-dimensional and high-order differential operators:

> Shi, Zekun, Zheyuan Hu, Min Lin, and Kenji Kawaguchi. “Stochastic Taylor Derivative Estimator: Efficient Amortization for Arbitrary Differential Operators,” 2024. [https://openreview.net/forum?id=J2wI2rCG2u](https://openreview.net/forum?id=J2wI2rCG2u).

# AI4Science

> Liu, Gang, Jiaxin Xu, Tengfei Luo, and Meng Jiang. “Graph Diffusion Transformers for Multi-Conditional Molecular Generation,” 2024. [https://openreview.net/forum?id=cfrDLD1wfO](https://openreview.net/forum?id=cfrDLD1wfO).

# Spatiotemporal

> Yi, Zhongchao, Zhengyang Zhou, Qihe Huang, Yanjiang Chen, Liheng Yu, Xu Wang, and Yang Wang. “Get Rid of Isolation: A Continuous Multi-Task Spatio-Temporal Learning Framework,” 2024. [https://openreview.net/forum?id=tnh4LK72yj](https://openreview.net/forum?id=tnh4LK72yj).