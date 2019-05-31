## Chapter 04 - Application Architectures

1. Describe the single-machine, three-tier, and four-tier web application architectures.
   1. In a single-machine, the machine runs software that communicates in HTTP protocol, receiving requests, processing them, generating a result, and sending the reply.
   2. Three-tier web services are made up of three layers: the load balancer, the web server, and the data service. The webservers rely on a back-end data server. The load balancer receives requests for the system and picks one of the machines in the middle layer and relays the request to that web server. the web server processes the request and then the reply is generated and sent back through the load balancer.
   3. You would use a four-tier web service when there are many individual application with a common frontend infrastructure. The requests come in though the load balancer like how they do for the three-tier, but the load balancer here divides the traffic among the various frontends. Then the frontends handle the interactions with the users and communicate with the servers for content.. The servers access shared data sources in the final layer.

2. Describe how a single-machine web server, which uses a database to generate content, might evolve to a three-tier web server. How would this be done with minimal downtime?

3. Describe the common web service architectures, in order from smallest to largest.
   1. Single-machine web server is the smallest, then three-tier web service, and finally four-tier web service.

4. Describe how different local load balancer types work and what their pros and cons are. You may choose to make a comparison chart.
   1. DNS Round Robin - This lists the IP addresses of all replicas in the DNS entry for the name of the web server and the browsers receive the IP addresses but randomly pick one of them to try first. Resulting in the load being distributed almost evenly among the replicas when a multitude of web browsers visit the site.
   Pros - Easy to implement, free, no hardware involved.
   Cons - Doesn't work well, difficult to control, not very responsive.
   2. Layer 3 and 4 Load Balancers - These load balancers receive each TCP session and redirect it to one of the replicas. The packets go through the load balancers first then the replicas then the reply comes from the replicas back to the load balancers.
   Pros - finer granularity, simple, fast
   3. Layer 7 Load Balancer - They work similar to L3 and L4 balancer, but they make decisions based on what can be seen by peering into the application layer of the protocol stack. They can also examines what is inside the HTTP protocol and make decisions based on what it found.
   Pros - richer mix of features,

5. What is “shared state” and how is it maintained between replicas?
   1. "Share state" is when data is stored somewhere that all backends can access it when needed. The way it is maintained is that the data is stored in this shared area and whenever a HTTP request goes to a different machine, that machine can access the information it needs off of this shared area.

6. What are the services that a four-tier architecture provides in the first tier?
   1. It provides fundamental services such as database, directory services, file & print services, and hardware abstraction.

7. What does a reverse proxy do? When is it needed?
   1. A reverse proxy allows one web server to provide content from another web server transparently. This is needed when you want to provide a user with various web features that is provided by different web services. With a reverse proxy you can unify all of the web features and their services into one page.

8. Suppose you wanted to build a simple image-sharing web site. How would you design it if the site was intended to serve people in one region of the world? How would you then expand it to work globally?
   1. For one region of the world I would use the three-tier web services, for global use I would move to four-tier.

9. What is a message bus architecture and how might one be used?
   1. It is a many-to-many communication mechanism between servers and a convenient way to distribute information among different services. You would use one to send messages across chat rooms since that requires real-time updates.

10. What is an SOA?
    1. A service-oriented architecture enables large services to be managed more easily. With this architecture, each subsystem is a self-contained service providing its functionality as a consumable service via an API.

11. Why are SOAs loosely coupled?
    1. Because this makes it easier to improve and replace a service.

12. How would you design an email system as an SOA?
    1. You would make it so that the system is constantly contacting the SOA to send and receive the data containing emails. The SOA would allow requests to be accepted and to perform various actions, schedule them, and coordinate them.

13. Who was Christopher Alexander and what was his contribution to architecture?
    1. Christopher Alexander is a very influential architect and design theorist. He is the father of the pattern language movement.
