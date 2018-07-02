# Kite TestEnv

A full-stack environment following the microservice architecture using Nameko as a service framework and for cross-service communication and delegation.

---

Stack:
- Backend
  - Python
    - [Nameko](https://github.com/koding/kite)
- Frontend
  - Javascript
    - [CRA](https://github.com/facebook/create-react-app)


---

### How it works

The flow is as simple as Kontrol:

```
Nameko <--> Microservices <--> API Gateway <--> Client
```

Each microservice registers with RabbitMQ so it can communicate with other microservices. The API Gateway creates an external interface to coordinate data with the internal microservices.

---

### The Test Environment

**RabbitMQ** is installed by `brew install rabbitmq`. This project assumes a fresh install using default ports and username/password.

**Microservices** are located in the `server` folder. In this case there's only one, but can be easily expanded using the same flow exemplified in the `service.py` file.

**API Gateway** is located in the `gateway` folder. Since sending and recieving RPC messages to and from other services is more intuitive than Kontrol, there only needs to be the routing and handling layer.

**Frontend** is simply what's used to test connectivity to the gateway, using create-react-app and a test request to the only existing method, `square`. 