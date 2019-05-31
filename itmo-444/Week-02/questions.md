1. What is distributed computing?
    1. Distributed computing is when you have a system that consists of multiple software components which are on difference computers, however, it is run as a single system. These computers can either be close together and connected to a local network or can be very far from each other and connected via a wide area network.

2. Describe the three major composition patterns in distributed computing.
    1. Load balancer with multiple backend replicas
        Requests are sent over to the load balancer and it selects one backend and forwards the request to it. Then, the backend sends its response back to the load balancer and the load balancer sends it to the original requester.
    2. Server with multiple backends
        First, the server receives a request and sends queries to several backend servers. Then, it takes all the responses and combines them to make one final reply.
    3. Server tree
        In this one several servers work together having one server be the root of the tree, parent servers below it, ad leaf servers at the bottom. You would use this pattern when trying to access a large dataset.

3. What are the three patterns discussed for storing state?
    1. Sharding
    2. Replicate
    3. Distributed

4. Sometimes a master server does not reply with an answer but instead replies with where the answer can be found. What are the benefits of this method?
    1. The benefits of this method are that you can find a much more precise answer.

5. Section 1.4 describes a distributed file system, including an example of how reading terabytes of data would work. How would writing terabytes of data work?
    1. To write terabytes of data it would replicate states so that it will not completely block the tables and allow for reading and other things to happen while writing is going on.


6. Explain the CAP Principle. (If you think the CAP Principle is awesome, read “The Part-Time Parliament” (Lamport & Marzullo 1998) and “Paxos Made Simple” (Lamport 2001).)
    1. The CAP theorem states that it is impossible for a distributed data store to guarantee more than two of the following: consistency, availability, and partition tolerance. This theorem implies that when you are in the process of a network partition, you must choose either to have consistency or availability.

7. What does it mean when a system is loosely coupled? What is the advantage of these systems?
    1. When a system is loose coupled it means that each of its components has either limited or no knowledge of the other components. The benefit of this is that the system can be easily replaced by another implementation that provides the same services. The components in a loosely coupled system are not as restricted to the same platform, OS, build environment, or platform.

8. Give examples of loosely and tightly coupled systems you have experience with. What makes them loosely or tightly coupled? (if you haven't worked on any use a system you have seen or used)
    1. I was trying to think of a time I worked on something like this but I could not, so I started researching different examples and I came across a guy who made a shopping cart app that keeps track of the items in his shopping cart and then adds up the total to process the purchase. He made two examples, a tightly coupled and loosely coupled one. For the tightly coupled he shows how it is less beneficial because if he wanted to add something to it, like a discount method, he would have to change at least 3 classes to be able to do this. However, in the loosely coupled example, he could change the implementation to add on the discounts without having to change the classes. In other words, much less work and much easier to do.

9. How do we estimate how fast a system will be able to process a request such as retrieving an email message?
    1. You need to calculate every step it takes to process the request. Such as the time it takes to receive the email, authenticate, read the data on the email, etc.

10. In Section 1.7 three design ideas are presented for how to process email deletion requests. Estimate how long the request will take for deleting an email message for each of the three designs. First outline the steps each would take, then break each one into individual operations until estimates can be created.
