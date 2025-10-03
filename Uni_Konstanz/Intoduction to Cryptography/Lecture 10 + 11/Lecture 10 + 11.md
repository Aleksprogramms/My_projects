# Key managment and the Public-Key Revolution

## Key distribution and Key Managment


We have discussed various aspects of private-key cryptography:

- private-key encryption
- message authentication codes
- authenticated encryption

THroughout, we always assumed that Alice and Bob have a secret key tha only they know
Open question that we left unanswered so far:

"How can Alice and Bob share a secret key in the first place?"

Clearly, the key cannot be sent via an insecure channel as an attacker would learn the key

In some cases, Alice and Bob might have access to an secure channel:

1. in-person meeting
2. Trusted couriers

Note that access to a secure channel does not render privat-key cryptogtraphy obsolete as the secure channel might...

- ... not always be available (case 1 above)
- ... be too slow/expensive (case 2 above)

Even if keys can be shared securely, those keys also have to be stored securely

For a group of N persons that might need to communicate securely with one another, every persons needs to store N - 1 keys
-> this problem persists also for a single key but storing more keys makes it harder to protect them all
-> get even worse when considering not all communication partners are person but also services

A typical solution is to store key on a store key on secure hardware such as a smartcard
-> limited storage

The problem so far can (at least theoretically) be addressed in "closed" systems, i.e., when there is a well-defined population of users who are willing to follow certain policies for distributing and storing keys

The problems pesists in "open" systems, where users cannot meet to exchange a key ahead of time (users might not even know of each others existence before the communication)

-> sending credit-card information to a merchant where you have never purchased anything
-> sending an email to someone you have never met