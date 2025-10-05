# Public-Key Encryption

# Public-Key Encryption - An Overview

![alt text](image.png)

## Comparison to Private-Key Encryption

1. Secret of keys:
    - Private-key encryption requires secrecy of the key k
    - Public-key encryption requires only for the secret key sk - not the public key pk
    -> the impact is huge: when in the same room, Bob can simply "shout" his public key across the room for Alice to learn it
    -> Bob can publish his public key on his website

2. Usage of keys:
- Private-key encryption schemes use the same key for both encryption and decryption
- Public-key encryption schemes use different keys for encryption and decryption
    -> public-key encryption schemes allow only unilateral communication: Alice can only encrypt for Bob

Main disadvantage of public-key encryption: it is rougly 2-3 orders of magnitude slower than private-key encryption
-> exact number are hard as it depends on many variable (schemes, implementation details, hardware, etc.)

## Secure Distribution of Public Keys

What about an active attacker Eve that can tamper with the communication?

-> when Bob sends his public key pk_b to Alice, Eve can replace it with its own public key pk_E
-> in the aforementioned discussion, this was excluded by assuming an authenticated channel
-> if Alice and Bob do not share any information in advance (or rely on some trusted third party), preventing such an attack is impossible

Such active attacks are a real threat in practice to be dealt with
-> we will return to this problem later
-> throughout this chapter, we assume key distribution, i.e. that the sender receives a legimate copy of the receiver's public key

## Definitions

A public-key encryption scheme consists of three porbabilistic polynomial-time algorithms (KGen, Enc, Dec) such that:

1. The key-generation algorithm KGen takes as input 1^n and outputs a pair of key (pk, sk). We refer to the first of these as the public key and the second as the private key. We assume  for convernience that pk and sk each has length at least n, and that n can be determined from pk, sk. The public key pk defines a message space M_pk.

2. The encryption algorithm Enc takes as input a public key pk and message m ∈ M_pk, and outputs a ciphertext c; we denote this by c <- Enc_pk(m). (Looking ahead, Enc will need to be probabilistic in order to achieve meaningdul security.)

3. The decryption algorithm Dec takes as input a private key sk and a ciphertext c, and outputs a message m or a special symbol ⊥ denoting failure. We write this as m:= Dec_sk(c).

It is required that, except with negligible porbability over the randomness of KGen and Enc, we have Dec_sk(Enc_pk(m)) = m for any message m ∈ M_pk

The following security definition is the "natiral" counterpart of Definition 3.8 in the public-key setting
