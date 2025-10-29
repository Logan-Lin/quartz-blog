---
title: Exam Format
---
## Modality and duration

Individual oral exam based on submitted project. The duration will be 15 minutes, followed by 5 minutes deliberation.

### Agenda

- Students give a (roughly) 5-minute presentation of their completed mini-project
- Students randomly draw a topic (from the 4 topics listed below) and explain the basic concepts within that topic
- Examiner and censor ask follow-up questions, which may relate to other course topics and include questions about practical applications and implementation; students can optionally refer back to their mini-project

## Assessment

Students are not required to write code during the exam, nor to remember any specific commands or code syntax, but may be asked to draw diagrams or solve small tasks manually. The grade will be based on an overall assessment of both the mini-project and oral performance, and in accordance with the 7-point grading scale.

## Pre-approved aids

Notes (related to literature, slides, notes from the module, and project documentation) are permitted. Do note that if you read directly from notes or copy them verbatim, you may be asked to put the notes away. Answers based solely on reading from notes will result in failure.

## Prerequisites for participation

Timely hand-in of project documentation.

## Topics

Note that the questions listed below are examples and may be formulated differently during the exam. An exhaustive explanation of each topic is not expected. While ideally students should be able to discuss each topic covered in the course, this is not required to pass the exam. The number and formulation of questions can serve as an indicator of the importance and expected level of knowledge for each topic.

### 1. Interacting with & building APIs

**API Fundamentals**

- What is the primary purpose of APIs in software development? How do they enable standardized communication between applications?
- Explain the three pillars of APIs: network fundamentals (IP addresses, domains, ports), HTTP protocol & methods, and standards & design principles
- Walk through the components of an HTTP request (request line, headers, body) and response (status line, headers, body). What are the key headers required for API authentication and content specification?
- What are HTTP status codes and what do they communicate? Provide examples for successful AI inference, authentication errors, and server errors
- Explain the difference between GET and POST methods. When would you use each for AI API interactions?
- What are the key components of interacting with APIs using Python's requests library? Explain the principles of proper error handling and API key management

**Advanced APIs in the Era of AI**

- What is rate limiting and why is it important for AI APIs? Compare different rate limiting strategies
- Explain API versioning strategies (URL path, header-based, query parameter, model-specific). How do you handle backwards compatibility when updating AI models?
- Compare traditional request-response APIs and streaming APIs. Why is streaming preferred for conversational AI applications?
- Explain Server-Sent Events (SSE) and how it enables word-by-word streaming in AI chatbots. How does it differ from regular HTTP requests?
- What is the Model Context Protocol (MCP) and how does it standardize AI model integration with external resources and tools? Explain the architecture of hosts, servers, and clients

**Wrap AI Models with APIs**

- Explain the concept of routes in FastAPI and how GET and POST methods are used. What are URL parameters and how do they enable dynamic request handling?
- Explain the role of Pydantic data models in FastAPI for request/response validation. Why is this important for API reliability?
- Explain how API versioning can be implemented in FastAPI. Why is maintaining backwards compatibility important?
- What are the key considerations when integrating AI models (like image classification) into FastAPI servers? Why might asynchronous operations be important?
- What are the principles of implementing API key authentication in FastAPI? What are the security considerations?
- Explain why database integration (using SQLAlchemy) is important for user management and API usage tracking. What role do data models play in organizing this data?

### 2. Computing architecture & hardware

**Computer architecture fundamentals**

- Explain the Von Neumann architecture and its components. How does this relate to modern AI computers?
- Describe the role of bus systems in computer architecture. How do they affect AI computing performance?
- What are the differences in roles between processing units, memory, and storage in the context of AI workloads?
- How does memory hierarchy (cache, RAM, storage) affect AI model performance? What are the implications for model design?
- Explain the concept of memory bandwidth vs memory latency. Which is more critical for AI applications?
- How do different storage types (SSD, HDD, NVMe) affect AI model loading and inference times?

**AI computing hardware**

- Why are GPUs particularly well-suited for AI computing compared to traditional CPUs?
- Compare different types of AI hardware: GPUs, TPUs, and NPUs. What are their respective strengths?
- What are the trade-offs between using dedicated AI accelerators (TPUs, NPUs) vs general-purpose GPUs?
- What factors should you consider when choosing hardware for AI inference and training?
- How do different specs of AI computing hardware (core count, memory size, memory bandwidth, etc.) affect AI model performance? What are the implications for hardware selection?

### 3. Containerization

**Container fundamentals**

- Explain what containerization is and how it differs from traditional virtualization. What are the benefits of containers over traditional deployment?
- Describe the layered structure of container images. How does this contribute to efficiency and reusability?
- What are the security implications of containers sharing the host's operating system kernel? How does this compare to virtual machines?
- What is the purpose of a Dockerfile? How does it relate to the layered structure of container images?
- What is the purpose of container registries, and how do you manage image distribution? Compare different registry options
- What is Docker Compose and when is it useful? How does it simplify managing multi-container applications?

**Practical implementation**

- How do you manage persistent storage in containerized applications? Why is this important for AI applications with databases or model files?
- How do you implement container networking for multi-container applications?
- What are the security considerations when working with containers? How should you handle sensitive configuration in containerized applications?
- What are the key steps involved in containerizing an AI API server? What considerations are important when packaging AI models in containers?
- How would you handle large AI models in containers? Discuss the trade-offs between bundling models in container images vs mounting them as volumes
- What are CPU architecture considerations when deploying containers to different hardware? How does this affect deployment to edge devices?

### 4. Deployment on diverse infrastructures

**Cloud deployment**

- What is cloud computing and how does virtualization enable cloud infrastructure? Explain the three-layer architecture (physical, virtualization, management)
- Compare virtual/dedicated machines, container services, GPU instances, managed AI services, and object storage for AI deployment. What are the trade-offs?
- What are the main steps and considerations when deploying a containerized AI service on a cloud virtual machine?
- How would you choose between different cloud providers for your AI deployment? Consider factors like pricing models, service offerings, and vendor lock-in
- What is SSH and why is it important for cloud deployment? Explain the concept of remote server access
- What are the advantages and pitfalls of usage-based pricing vs fixed monthly pricing for cloud services?
- Why is HTTPS necessary for production AI APIs? Explain the mixed content problem and security implications
- How do you obtain a domain name for your service? Compare free and paid options

**Edge and self-hosted deployment**

- What is edge computing and what motivates edge deployment for AI applications? Discuss latency, privacy, bandwidth, and offline operation
- What is self-hosted deployment and how does it differ from cloud deployment? Discuss the economics, control, and practical considerations
- Compare different hardware options for edge/self-hosted deployment: Raspberry Pi, NVIDIA Jetson, repurposed laptops, and purpose-built servers
- What are CPU architecture considerations when deploying containers to edge devices? Explain the ARM vs x86 challenge
- How do you access services on your local network vs making them publicly accessible? What is NAT and why does it matter?
- What are the different approaches for making self-hosted services publicly accessible? What are the trade-offs to consider when choosing an approach?
- What security responsibilities come with exposing self-hosted services to the internet?

