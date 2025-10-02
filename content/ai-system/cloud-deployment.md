---
title: B.6-Cloud Deployment
draft: true
---
After [[ai-compute-hardware|AI compute hardware]] and [[packaging-containerization|Packaging & containerization]], now we have the confidence that we can deploy our AI system to a computer other than our own PC. Other than the fact that we can do it, there are also reasons that we might want to do it. AI systems, especially the ones like the API server we implemented earlier, usually need to run 24x7, which you probably shouldn't rely on your own PC. Running AI systems often use lots of computational resources, which in turn make computers produce heat and noise, something you probably don't enjoy at home.

In this module we will learn how to deploy our system on to the ["cloud"](https://en.wikipedia.org/wiki/Cloud_computing). This is probably a buzz word you have heard for quite a while, only recently overtaken by the "AI" hype. You will learn that cloud deployment has nothing to do with clouds in the sky: the cloud infrastructure essentially is composed of computers inside data centers that are setup in a way that can be accessed remotely, thus cloud deployment (in most cases) comes down to deployment on to a remote computer.

## Cloud Infrastructure

When we talk about "the cloud," we're really talking about computers in [data centers](https://en.wikipedia.org/wiki/Data_center) that you can access over the internet. The term comes from old network diagrams where engineers would draw a cloud shape to represent "the internet" or any network whose internal details weren't important at that moment. Over time, this symbol became associated with computing resources accessed remotely.

Cloud infrastructure emerged from a practical problem. Companies like Amazon and Google built massive computing facilities to handle peak loads (holiday shopping spikes, search traffic surges), but these expensive resources sat mostly idle during normal times. They realized they could rent out this spare capacity to others, and the modern cloud industry was born. What started as monetizing excess capacity evolved into a fundamental shift in how we provision computing resources.

The key technical innovation that made cloud practical is [virtualization](https://en.wikipedia.org/wiki/Virtualization). This technology allows one physical machine to be divided into many isolated virtual machines, each acting like a separate computer with its own operating system. A single powerful server might run dozens of virtual machines for different customers simultaneously. This sharing model dramatically improved efficiency, since physical servers could be fully utilized rather than sitting idle.

You might recall from [[packaging-containerization|Packaging & containerization]] that containers also provide isolation, but they work at a different level. Virtual machines virtualize the entire hardware, giving each VM its own complete operating system. Containers, in contrast, share the host's operating system kernel and only isolate the application and its dependencies. This makes VMs heavier but more isolated, suitable for running entirely different operating systems or providing stronger security boundaries. Containers are lighter and faster, ideal for packaging applications. In practice, cloud infrastructure often uses both: VMs to divide physical servers among customers, and containers running inside those VMs to package and deploy applications.

Cloud infrastructure is built in three layers. The **physical layer** forms the foundation: thousands of servers organized in racks inside data centers, connected by high-speed networks, with massive storage arrays and redundant power and cooling systems. The **virtualization layer** sits on top, where [hypervisors](https://en.wikipedia.org/wiki/Hypervisor) create and manage virtual machines, allocating slices of physical resources while ensuring isolation between customers. The **management layer** ties everything together with APIs for programmatic control, orchestration systems for resource allocation, monitoring tools for health tracking, and billing systems that measure usage.

Together, these layers transform a pile of hardware into a self-service platform where you can spin up a server in seconds with a few clicks or API calls.

> [!info] Extended Reading
> To dive deeper into cloud infrastructure architecture:
> - [What is a Data Center?](https://aws.amazon.com/what-is/data-center/) from AWS explains the physical infrastructure
> - [Understanding Hypervisors](https://www.redhat.com/en/topics/virtualization/what-is-a-hypervisor) from Red Hat covers virtualization technology in detail
> - [What is Cloud Computing?](https://aws.amazon.com/what-is-cloud-computing/) from AWS provides a comprehensive overview

### Major Cloud Providers

Three companies dominate the cloud infrastructure market, each with distinct strengths.

**[Amazon Web Services (AWS)](https://aws.amazon.com/)** is the market leader, launched in 2006 when Amazon started renting out its excess computing capacity. AWS offers the most comprehensive service catalog with over 200 services covering everything from basic compute to specialized AI tools. This breadth makes AWS powerful but can also be overwhelming for beginners. The platform is known for its maturity, global reach with data centers in dozens of regions, and extensive documentation. Most enterprise companies use AWS in some capacity.

**[Google Cloud Platform (GCP)](https://cloud.google.com/)** entered the market later but brought Google's expertise in handling massive scale. GCP excels in data analytics and AI/ML services, offering tools like BigQuery for data warehousing and Vertex AI for machine learning. The platform tends to be more developer-friendly with cleaner interfaces and better default configurations. For AI system deployment, GCP's strengths in machine learning infrastructure and competitive GPU pricing make it particularly attractive.

**[Microsoft Azure](https://azure.microsoft.com/)** holds strong appeal for enterprises already using Microsoft products. Azure integrates seamlessly with Windows Server, Active Directory, and Office 365. This makes it the natural choice for organizations with existing Microsoft infrastructure. Azure has grown rapidly and now rivals AWS in service offerings, with particular strength in hybrid cloud scenarios where companies need to connect on-premises systems with cloud resources.

> [!info] Extended Reading
> Beyond the "big three," many alternatives exist for different needs:
>
> **Affordable and Simple**: [DigitalOcean](https://www.digitalocean.com/) and [Linode](https://www.linode.com/) offer straightforward interfaces and competitive pricing, ideal for startups and smaller projects.
>
> **GPU-Focused for AI**: [Lambda Labs](https://lambdalabs.com/) and [CoreWeave](https://www.coreweave.com/) specialize in providing cost-effective GPU instances optimized for machine learning workloads.
>
> **European Providers**: For those prioritizing data sovereignty and GDPR compliance, European providers offer compelling alternatives. [Hetzner](https://www.hetzner.com/) (Germany) is known for exceptional price-performance ratios with data centers across Europe. [OVHcloud](https://www.ovhcloud.com/) (France) operates one of Europe's largest cloud infrastructures. [Scaleway](https://www.scaleway.com/) (France) positions itself as a European alternative with strong AI capabilities. These providers often cost significantly less than US hyperscalers while keeping data within EU jurisdiction.

### Common Cloud Services for AI Deployment

Cloud providers offer various service types, each with different tradeoffs between control, convenience, and cost. Understanding these options helps you choose the right approach for deploying your AI systems.

**Virtual Machines** provide dedicated computing instances that behave like traditional servers. You get full control over the operating system and can install whatever software you need. This familiarity makes VMs approachable if you're comfortable with traditional server management. However, you're responsible for all maintenance, security patches, and configuration. You also pay for the VM whether it's actively processing requests or sitting idle. Examples include [EC2](https://aws.amazon.com/ec2/) on AWS, [Compute Engine](https://cloud.google.com/compute) on GCP, and [Virtual Machines](https://azure.microsoft.com/en-us/products/virtual-machines) on Azure.

**Container Services** let you run the Docker containers we learned about in [[packaging-containerization|Packaging & containerization]]. The cloud provider manages the underlying infrastructure while you focus on your containerized applications. Many container services offer automatic scaling, spinning up more containers when traffic increases and shutting them down when traffic drops. This means you only pay for actual usage. The learning curve can be steeper than VMs, and debugging containerized applications in production requires different skills. Examples include [ECS/EKS](https://aws.amazon.com/containers/) on AWS, [Cloud Run](https://cloud.google.com/run) on GCP, and [Container Instances](https://azure.microsoft.com/en-us/products/container-instances) on Azure.

**GPU Instances** are virtual machines with attached graphics processing units, essential for training large AI models or running inference on complex models. Without buying expensive hardware upfront, you get access to cutting-edge GPUs. The downside is cost. GPU instances can run hundreds of dollars per day, and during peak times (like when new AI research creates demand), they may be unavailable. Examples include [P-series and G-series instances](https://aws.amazon.com/ec2/instance-types/) on AWS, [A2 and G2 instances](https://cloud.google.com/compute/docs/gpus) on GCP, and [NC and ND-series](https://azure.microsoft.com/en-us/pricing/details/virtual-machines/series/) on Azure.

**Managed AI Services** provide pre-configured platforms specifically for deploying machine learning models. These services handle infrastructure scaling, model versioning, monitoring, and often include tools for A/B testing different model versions. They're the easiest way to deploy AI systems, requiring minimal DevOps knowledge. The tradeoff is less flexibility and potential vendor lock-in, as these platforms often use proprietary APIs. Examples include [SageMaker](https://aws.amazon.com/sagemaker/) on AWS, [Vertex AI](https://cloud.google.com/vertex-ai) on GCP, and [Azure Machine Learning](https://azure.microsoft.com/en-us/products/machine-learning) on Azure.

**Object Storage** provides scalable storage for large datasets, model files, and other unstructured data. Unlike traditional file systems, object storage is designed for durability and massive scale. Files are typically replicated across multiple data centers, making data loss extremely unlikely. Storage costs are remarkably cheap, often a few cents per gigabyte per month. However, object storage isn't designed for real-time access. Operations have higher latency than local disks, making it suitable for storing training data and model weights but not for serving predictions. Examples include [S3](https://aws.amazon.com/s3/) on AWS, [Cloud Storage](https://cloud.google.com/storage) on GCP, and [Blob Storage](https://azure.microsoft.com/en-us/products/storage/blobs) on Azure.

> [!info] Extended Reading
> Beyond compute and storage services, cloud providers offer specialized services for different use cases:
>
> [**Serverless computing**](https://aws.amazon.com/serverless/) (like AWS Lambda or Google Cloud Functions) runs your code in response to events without any server management. You write individual functions and pay only for execution time measured in milliseconds. This is fundamentally different from VMs or containers where you manage long-running processes.
>
> [**Managed databases**](https://aws.amazon.com/products/databases/) (like RDS, Cloud SQL, or Cosmos DB) handle database administration automatically. Unlike object storage which stores files, these provide structured data storage with queries, transactions, and relational integrity.
>
> [**Content delivery networks**](https://aws.amazon.com/cloudfront/) (like CloudFront or Cloud CDN) cache and serve your content from servers distributed worldwide. Rather than running your application, they focus on delivering static assets (images, videos, model outputs) with minimal latency to users anywhere.