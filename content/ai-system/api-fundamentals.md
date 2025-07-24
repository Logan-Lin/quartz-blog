---
title: API Fundamentals
draft: false
---
> [!summary] TL;DR
> APIs are standardized interfaces that enable applications to communicate across different programming languages and infrastructure, serving as a universal postal system for the digital world.

In [[interact-with-ai-systems|Interact with AI Systems]] we've established that we need a standardized interaction method beyond direct function calls. That method is what we call **Application Programming Interfaces (APIs)**. If applications need to communicate like humans do but face barriers like different programming languages and different deployment infrastructure, APIs are like having a universal postal office who knows where everyone lives and how they prefer to receive and send messages.

> [!example]
> ChatGPT can be accessed through OpenAI's official website, mobile/desktop apps, other AI-based applications (such as Perplexity), Python scripts, or even command line scripts, all through the same family of APIs OpenAI has published.

![[Pasted image 20250720103140.png]]

## The Three Pillars of APIs

When humans communicate through letters, three pillars are needed: where to send the letters (recipient's address), how to send the letters (postal services and delivery methods), and the letter itself (format and content of the message). Similarly, APIs also need three pillars to work: where to send the message (network fundamentals), how to send the message (HTTP protocol & methods), and a "common knowledge" of how the APIs should be designed and used (standards & design principles).

### Network Fundamentals

Just like you need an address to send a letter, APIs need addresses too. Without going too deep into computer networking, we will focus on [three core concepts](https://uhasker.github.io/getting-things-done-in-next-js/chapter3/01-ips-ports-and-domains.html): IP addresses, domains, and ports.

An **[IP address](https://www.geeksforgeeks.org/computer-science-fundamentals/what-is-an-ip-address/)** is a unique identifier assigned to each device connected to a network, telling applications where to find each other. Think of it as a street address such as *Fredrik Bajers Vej 7K, 9220 Aalborg East, Denmark*. An IPv4 address looks something like `65.108.210.169`.

Technically speaking, APIs can identify themselves solely with IP addresses. The problem is that IP addresses are difficult for humans to read and remember, just like street addresses are usually too long for us to remember. We usually prefer a shorter, semantic-rich name like *Aalborg University*. Similarly, domain names provide this human-friendly alternative. A **[domain](https://www.geeksforgeeks.org/computer-networks/introduction-to-domain-name/)** is also a unique identifier pointing to some network resource and usually has one (or more) corresponding IP address(es). In the ChatGPT example above, `api.openai.com` is the domain name of the API, pointing to IP addresses like `162.159.140.245` and `172.66.0.243`.

Finally, we have ports. Just as some people run several businesses in the same location and have multiple corresponding mailboxes, computers run multiple applications simultaneously. A **[port](https://www.geeksforgeeks.org/computer-networks/what-is-ports-in-networking/)** is used to identify which specific application should receive the incoming message, and each IP address can have up to 65,535 ports. Typically we don't have to specify a port when calling an API, since there are default ports assigned to certain services, protocols, and applications. For example, HTTPS-based APIs usually run on port 443.

![[Pasted image 20250720134403.png]]

> [!info] Extended Reading
> If you are interested in concepts in computer networking that we left behind, take a look at these materials:
> - https://www.geeksforgeeks.org/computer-networks/open-systems-interconnection-model-osi/
> - https://www.geeksforgeeks.org/computer-networks/basics-computer-networking/
> - https://learn.microsoft.com/en-us/training/modules/network-fundamentals/

### HTTP Protocol & Methods

To send a letter in the real world, you first have to choose from available postal services, which you will probably choose based on price, delivery time, previous experiences, etc. For APIs, you usually won't spend time choosing postal services (transfer protocols) since they are largely standardized, and that one standard protocol used in most APIs is called **[HTTP (HyperText Transfer Protocol)](https://www.geeksforgeeks.org/html/what-is-http/)**.

What you do have to choose is **HTTP methods**, similar to how a postal service usually has multiple delivery methods. Two methods that you will frequently encounter when using AI service APIs are `GET` and `POST`. `GET` means the API call wants to retrieve information, for example you can check OpenAI's available AI models by sending a `GET` request to `https://api.openai.com/v1/models`. `POST` is for sending data and expecting a response, which will be the primary method we use to send data to AI services and retrieve their response.

#### HTTP Request

Besides providing multiple methods, HTTP as a postal service for APIs also standardize how each envelope is addressed, in the form of several [HTTP request components](https://proxyelite.info/understanding-http-requests-what-are-they-made-of/): request line, headers, and body.

The **request line** will be something like this:
```
POST https://api.openai.com/v1/chat/completions HTTP/1.1
```
This contains the method, the URL stating where to send the request, and the protocol version. We should also briefly address the difference between a URL and a domain here. Think of the domain `api.openai.com` as the building address like *Fredrik Bajers Vej 7K* that usually corresponds to a certain group of hardware resources. The full URL is like an address with floor and room number like *Fredrik Bajers Vej 7K, 3.2.50*, which in the above case specifies the version of the API (v1) and the specific function (conversation completion).

The **[headers](https://en.wikipedia.org/wiki/List_of_HTTP_header_fields)** are like the information you write on the envelope, and will be something like this:
```
Authorization: Bearer sk-abc1234567890qwerty
Content-Type: application/json
Accept: application/json
User-Agent: SomeAIApp/1.0
```
Here, `Authorization` is for identifying the user and protecting the API and is usually where we specify our API keys. `Content-Type` and `Accept` specify the format of data we're sending and the expected response, respectively. `User-Agent` identifies the type of application or client we are using to interact with the API.

> [!info] Extended Reading
> Just the `Authorization` header alone could cost us a few modules if we were to explore all types of authorization. For now, just think of it as a place to enter our API keys. We will dive deeper into this topic when we implement our own API server in Module 3: [[wrap-ai-with-api|Wrap AI Models with APIs]], and if you are curious, here are some materials that you can look into:
> - https://apidog.com/blog/http-authorization-header/
> - https://swagger.io/docs/specification/v3_0/authentication/bearer-authentication/
> - https://auth0.com/intro-to-iam/what-is-oauth-2

For the `GET` method, only the request line and headers, or sometimes just the request line, is enough. For the `POST` method, since we are sending data, we need the **body** which is the content of the letter itself. As you noticed, in the headers we've stated that the format of the body will be `application/json`, which means our body will look like this:
```json
{
    "model": "gpt-4",
    "messages": [
        {"role": "user", "content": "Write a haiku about APIs"}
    ],
    "temperature": 0.7,
    "max_tokens": 50
}
```
The format of this JSON object is specified by the provider of the APIs. There are other [content types](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Type) that might be more suitable for certain types of data. Generally speaking, JSON is the most popular one since it's machine-parseable and human-friendly.

#### HTTP Response

Now you've sent the envelope (HTTP request) through the postal service called HTTP. The recipient will send a response letter back to you (HTTP response) if everything is working correctly, and if not, the postal service will at least write a response telling you what's wrong. Akin to HTTP request, a [HTTP response](https://www.tutorialspoint.com/http/http_responses.htm) is composed of a few components: status line, response headers, and response body.

The **status line** looks like this:
```
HTTP/1.1 200 OK
```
Composed of HTTP protocol version, status code, and reason phrase. Both status code and reason phrase provide immediate information about how your sent request went, and they correspond one-to-one.

The **response headers** are like headers in the request, providing metadata about the response. It might look something like this:
```
Content-Type: application/json
Content-Length: 1247
```
The types of headers included in a response depend on the design of the API service and are largely relevant to the purpose of the API. For example, ChatGPT's API will provide information about the AI model and your current usage in their response headers.

The **response body** is similar to the body in the request, containing the data the API provider sends back to you. A response body from the ChatGPT API with JSON format will look like this:
```json
{
  "id": "chatcmpl-6pHh8Cw1ZKcO45PiAavgbhZMz3YRs",
  "object": "chat.completion",
  "created": 1677649420,
  "model": "gpt-3.5-turbo-0613",
  "choices": [
    {
      "index": 0,
      "message": {
        "role": "assistant",
        "content": "Hello! How can I help you today?"
      },
      "finish_reason": "stop"
    }
  ],
  "usage": {
    "prompt_tokens": 12,
    "completion_tokens": 13,
    "total_tokens": 25
  }
}
```
Again, the format of this JSON object is specific to API providers and functions you requested.

> [!note] 
> You might have noticed that we've been saying HTTP protocol throughout the above section, but the URLs we are calling start with HTTPS. HTTPS is an extension of HTTP that additionally encrypts messages. Think of it as writing letters in a way that only you and the recipient can understand. Nowadays, almost all public APIs use HTTPS and most software blocks all non-secure HTTP communications. We will come back to HTTP and HTTPS when we are deploying and serving our own APIs in Module 3: [[wrap-ai-with-api|Wrap AI Models with APIs]] and Module 6: [[cloud-deployment|Cloud Deployment]].

### Standards & Design Principles

In communications, beyond mandating rules (e.g., languages) we have "common knowledge"—for example, how an address is written (street and building number, then post code and city/area, finally country) and how a letter is structured (greetings and regards). You can technically refuse to adhere to such common knowledge, but it might lead to miscommunication and confusion, or you will need to attach a document stating how and why you do things differently. Similarly, when working with APIs, there are standards and design principles that are not mandatory but will make the APIs more predictable and intuitive, reducing the need for users and developers to extensively study the API documentation.

We'll briefly touch on one of the more prominent and widely adopted standards: **[REST (Representational State Transfer)](https://amplication.com/blog/rest-apis-what-why-and-how)**. Core REST principles include uniform interface, statelessness, cacheability, and layered system.

**Uniform interface** ensures all interactions between applications follow a consistent pattern, for example, making the formulation of URLs intuitive and HTTP methods consistent. API URLs that follow this principle include:
```
GET    /v1/models                   # Get all models
GET    /v1/models/gpt-4             # Get specific model
POST   /v1/chat/completions         # Create a chat completion
GET    /v1/files                    # List uploaded files
POST   /v1/files                    # Upload a new file
```
And bad examples include:
```
POST   /getModels                   # Action in URL
GET    /model?action=delete&id=123  # Action as parameter
POST   /api?method=chat             # Generic endpoint
```

**Statelessness** requires that each request contain all information necessary to understand and process the request. One example is that OpenAI's chat completion API always requires the full chat history to be provided in the body:
```json
{
    "model": "gpt-4",
    "messages": [
        {"role": "user", "content": "Hello"},
        {"role": "assistant", "content": "Hi there!"},
        {"role": "user", "content": "How are you?"}
    ]
}
```

**Cacheability** means HTTP responses should clearly define themselves as cacheable or non-cacheable. This can make the communication and computation of applications more efficient. Especially for AI APIs, frequently requested AI outputs can be flagged as cacheable and don't need to be recalculated.

**Layered system** allows the architecture to be composed of multiple hierarchical layers, where each layer has specific roles and cannot see beyond the immediate layer it's communicating with. Typical AI APIs will include authentication layers for security, caching layers for reuse of frequently accessed AI results, and rate limiting layers to prevent abuse.

> [!info] Extended Reading
> If you want to use a more SQL query-like API interaction method, where you explicitly define the type and scope of data you want and receive exactly that, consider GraphQL:
> - https://graphql.org/learn/

## Interact with APIs in Practice

Now we've established the basic concepts related to APIs, we will look at how to interact with APIs in practice.

### API Testing Tools

Before we proceed to integrate interactions with APIs into our applications, we can play around with the APIs with API testing tools to first get a better idea of the behavior of the APIs. These tools will also come in handy when we implement our own APIs and want to test them ourselves before publishing them to the public.

[Postman](https://www.postman.com/) is a popular API testing tool. To send an API request with Postman, fill in the components of a [[#HTTP Request]] into its interface:

![[Pasted image 20250720200625.png]]

Click send, and after a while you should be able to see the response with components of a [[#HTTP Response]]:

![[Pasted image 20250720200546.png]]

Feel free to explore other functionalities of Postman yourself. Apart from being able to send API requests in a graphical user interface, you can also form a collection of requests for reuse and structured testing. Postman also comes with collaboration tools that can come in handy when developing in a team. Alternatives to Postman include [Hoppscotch](https://hoppscotch.io/) and [Insomnia](https://insomnia.rest/), [among others](https://apisyouwonthate.com/blog/http-clients-alternatives-to-postman/), all with similar core functionalities.

### Interact with APIs with Python

To interact with APIs in a Python program, a universal method is to use the [`requests` package](https://docs.python-requests.org/en/latest/index.html). It is not a built-in package and you will have to install it with a package manager of your choice.

Below is an example of sending a `GET` request:
```python
import os
import requests

url = "https://api.anthropic.com/v1/messages"

headers = {
    "x-api-key": os.getenv("API_KEY"),
    "Content-Type": "application/json",
    "Accept": "application/json",
    "User-Agent": "SomeAIApp/1.0",
    "anthropic-version": "2023-06-01"
}

try:
    response = requests.get(url, headers=headers)
    print(f"Status Code: {response.status_code}")
    print(f"Response Headers: {response.headers}")
    print(f"Response Body: {response.text}")
except requests.exceptions.RequestException as e:
    print(f"GET request failed: {e}")
```

And an example of sending a `POST` request:
```python
import os
import requests

url = "https://api.anthropic.com/v1/messages"

headers = {
    "x-api-key": os.getenv("API_KEY"),
    "Content-Type": "application/json",
    "Accept": "application/json",
    "User-Agent": "SomeAIApp/1.0",
    "anthropic-version": "2023-06-01"
}

json_body = {
    "model": "claude-sonnet-4-20250514",
    "max_tokens": 2048,
    "temperature": 0.7,
    "messages": [
        {
            "role": "user",
            "content": "Explain the concept of APIs."
        }
    ]
}

try:
    response = requests.post(
        url, 
        headers=headers, 
        json=json_body,
        timeout=30  # 30 second timeout
    )
    
    response.raise_for_status()  # Raises HTTPError for bad responses
    
    result = response.json()
    print("Success!")
    print(f"Content: {result.get('content', [{}])[0].get('text', 'No content')}")
    
except requests.exceptions.Timeout:
    print("Request timed out")
except requests.exceptions.HTTPError as e:
    print(f"HTTP error occurred: {e}")
    print(f"Response content: {response.text}")
except requests.exceptions.RequestException as e:
    print(f"Request failed: {e}")
except json.JSONDecodeError:
    print("Failed to decode JSON response")
```

Note the HTTP request and response components, management of API keys, and handling of HTTP errors in both examples.

> [!info] Extended Reading
> To get started with AI APIs, you'll need to register accounts, obtain API keys, and familiarize yourself with provider documentation. Here are the two major AI API platforms to explore:
> 
> - [OpenAI platform](https://platform.openai.com/welcome)
> - [Anthropic developer console](https://console.anthropic.com/)
> 
> And their documentation:
> - [OpenAI API Documentation](https://platform.openai.com/docs/overview)
> - [Anthropic API Documentation](https://docs.anthropic.com/en/api/overview)

