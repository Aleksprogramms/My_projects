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

The eavesdropping indistinguishability experiment ![alt text](image-1.png):

1. KGen(1^n) is run to obtain keys (pk, sk)
2. Adversary A is given pk, and outputs a pair of equal-length messages m0,m1 ∈ M_pk
3. A uniform bit b ∈ {0,1} is chosen, and then a ciphertext c <- Enc_pk (m_b) is computed and given to A. We call c the challenge ciphertext.
4. A outputs a bit b'. The output of the experiment is 1 if b' = b, and 0 otherwise. if b' = b we say that A succeds

A public-key encryption scheme П = (KGen, Enc, Dec) has indisnguishable encryptions in the presence of an eavesdropper if for all probabilistic polynomial-time adversaries A there is a negligible fucntion negl such that, for all n,

![alt text](image-2.png)

The probability above is taken over the randomness used by A and the randomness used in the experiment (for chosing the key and the bit b, as well as any randomness used by Enc).


The above definition is very similar to Definition 3.8(for private-key encryption)

Main difference: A receives the public key pk as input
-> additional implication: A can choose the messages m0 and m1 based on this public key

This arguably small change has huge impact: having access to the public key essentially grants access to an encryption oracle for free
-> having pk, A can simply compute Enc_k(m) for arbitrary m(recall that Enc is public)

The upshot is that Definition 12.2 is equivalent to CPA-security (analogously defined to Definition 3.21 except that A gets the public key):

If a public-key encryption scheme has indistinguishable encryptions in the presence of an eavesdropper, it is CPA-secure.

This is a significant difference to the private-key encryption setting, where Proposition 3.19 states that these security properties are not equivalent!

## Impossibility of perfecrly secret public-key encryption

A definition of perfectly secret public-key encryption is obtained by extending Definition 12.2 to all adversaries (not just PPT ones) and removing the negligible function in the upper bound

Recall that perfectly secret private-key encryption is possible (one-time pad)

In contrast, perfectly secret public-key encryption is impossible

## Insecurity of deterministic public-key encryption

For private-key encryption, we noted that no deterministic encryption scheme can be CPA-secure

The same holds for public-key encryption:

No deterministic public-key encryption scheme is CPA-secure

Theorem 12.4 is neither a simple artefact of the definition nor an indicator that the definition is too strong

A problematic scenario is when set of possible messages is small:

-> assume that you will receive your final grade of the course encrypted using your public key, i.e. a ciphertext c:= Enc_pk(m), where m is your grade

-> since m ∈ {1.0, 1.3, 1.7, 2.0, 2.3, 2.7, 3.0, 3.3, 3.7, 4.0, 5.0} anyone can compute the 11 candidate ciphertexts and compare with the one sent to identify your grade

## Multiple Encryptions

We again ask the question what happens when a key (in this case a public key pk) is used multiple times

Let LR_pk,b(·, ·) be a "left-or-right" oracle, which on input two equal-length message m0 and m1 computes and returns the ciphertext c <- Enc_pk(m_b)

The LR-oracle experiment ![alt text](image-3.png):

1. KGen(1^n) is run to obtain keys (pk,sk)
2. A uniform bit b ∈ {0, 1} is chosen
3. The adversary A is given input pk and oracle access to LR_(pk, b) (·, ·)
4. The adversary A outputs a bit b'.
5. The output of the experiment is defined to be 1 if b' = b, and otherwise. If ![alt text](image-4.png), we say that A succeeds.

A public-key encryption scheme П = (KGen, Enc, Dec) has indistinguishable multiple encryptions if for all probabilistic polynomial-time adversaries A there is a negligible function negl such that:

![alt text](image-5.png)

Similar to the private-key setting, any CPA-secure scheme also has indistinguishable multiple encryptions:

If public-key encryption scheme П is CPA-secure, then it also has indistinguishable multiple encryptions

