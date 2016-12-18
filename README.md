Mini PubSub exists to send messages between publishers and subscribers.  The
communication is unidirectional; that is, subscribers cannot reply to messages,
they can only receive messages and then decide what to do with them. In fact,
subscribers can, but are not required, to acknowledge having received messages.
This means that pubsub is a "send it and forget it" messaging system.

# Roles

## Publisher

A Publisher sends a message to a Channel. A Publisher does not care (or even
know) whether or not anyone is listening to the messages.


## Receivers

The job of the receiver is to accept incoming messages from Publishers via some
receiving mechanism (i.e. TCP, UDP, HTTP, STDIN, etc.).


## Dispatcher

A Dispatcher takes incoming messages from Receivers, and sends them to Channels.


## Channel

A Channel has a list of Subscribers to which all messages are sent.


## Subscriber

A Subscriber is identified by their address, which where they may be reached.
reached (i.e. a hostname/port combination, an HTTP endpoint, STDOUT, a file,
etc.).


## Address

An Address is a way to specify a destination at which a Subscriber may be
reached.


## Senders

The Senders send messages (via TCP, UDP, HTTP, STDOUT, etc.) to Subscribers via
their address.


```text
Publisher
    |
Receiver
    |
Dispatcher
    |
Channel
    |
   /|\
Subscibers (have an Address)
    |
Sender (via Subscriber's Address)
```
