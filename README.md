Mini PubSub sends messages between publishers and subscribers. The communication
is unidirectional; subscribers cannot reply to messages.

Mini PubSub is a "send it and forget it" messenging system. It makes some big
assumptions you should be aware of:

* The network you're sending messages over is mostly reliable.
* Losing any given message, or even all messages for a short amount of time is
  acceptable so long as things come back online eventually.

Think of these messsages like UDP packets - if a few get lost, so what? Move on
with your life.  If you need highly available, totally fault tolerant, with
robust retry logic (the TCP equivalent), then this isn't the solution you're
looking for.

# Concepts

## Message

A `Message` is what a `Publisher` wants to send.


## Publisher

A `Publisher` sends a `Message` to a `Channel`. A `Publisher` does not care (or
even know) whether or not anyone is listening to the messages they send.


## Receivers

The job of the `Receiver` is to accept incoming `Messages` from `Publishers` via
some `Receiving` mechanism (i.e. TCP, UDP, HTTP, STDIN, etc.), and forward them
to a `Router` for delivery.


## Router

A `Router` takes incoming messages from a `Receiver`, and sends them to the
appropriate `Channels`.


## Channel

A `Channel` has a list of `Subscribers`. A `Message` sent to a `Channel` is sent
to all `Subscribers` on that `Channel`.


## Subscriber

A `Subscriber` has a `Sender`, which is the combination of a method of delivery
(TCP, UDP, HTTP, STDOUT, etc.) and the information necessary (such as an IP
address or hostname) needed to deliver a `Message` to a `Subscriber`.


## Senders

The `Senders` send messages (via TCP, UDP, HTTP, STDOUT, etc.) to `Subscribers`
using the `Subscriber's` addressing infomration.


```text
Publisher (has a Message they want to publish)
    |
Receiver (reads the incoming Message from the Publisher)
    |
Router (routes the Message to the appropriate Channel)
    |
Channel (is the list of Subscribers to send Messages to)
    |
   /|\
Sender (actually delivers the Message to Subscibers' addresses)
    |
Subscibers (hopefully get the Message originally sent by the Publisher)
```
