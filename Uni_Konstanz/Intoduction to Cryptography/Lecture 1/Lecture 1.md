
#Private-Key Encryption

A private-key enctyrption specified by a message space M and three algorithms:

- Key generation: KGen is a probabilistic algorithm that outputs a key k according to some distribution
- Encryption: Enc takes as input a key k and a message m, and outputs a ciphertext c
- Decryption: Dec takes as input a key k and a ciphertext c, and outputs a message m

Correctness: For every k output by KGen and every m ∈ M, We have Dec(k,Enc(k,m)) = m

## Kerkchoffs' Principle

The cipher method must not be required to be secret, and it must be able to fail into the hands of the enemy without inconvenience

# Historic Ciphers

- Caesar's cipher
  - One of the oldest recorded cipher
  - Letters of the alphabet were shifted by 3 places orward: a was repklaced by D, b was replaced by E, and so on
  - For example: kosntanz -> NRQVWDC
  - Problem: cipher method is fixed; there is no key; fails to achieve Kerckhoffs principle

- Shift cipher
- A keyed variant of Caesar's cipher
- Key k is a number between 0 and 25
- Encryption workds by shifting letters by k places
- Decryption works by shifting letters by j places backwards

Is this cipher secure?

No!

Only 26 possible keys, so we can use brute-force or exhaustive search
Observation: any encryption scheme should be resistant to brute-force attacks

# Sufficient Key-Space pronciple
Any secure encryption scheme must have a key space that is sufficiently large to make an exhaustive-search attack infeasible.

# Mono-alphabetic substituion cipher
Key is an arbitary map on the alphabet with the constraint to be one-to-one (otherwise decryption is not possible)
Key space thus consists of all bijections(permutations) over the alphabet

<img width="777" height="205" alt="image" src="https://github.com/user-attachments/assets/2688725e-fc49-4afc-8060-41935a0aa965" />

Is the mono-alphabetic substitution cipher secure?

No!

Attack possible using statical properties of the English language (we assume the encrypted text is some gramatically correct english text)
The attack relies on two facts:

1. For any key, the mapping of each letter is fixed; if e is mapped to D, every appearance of e will result in an appearance of D
2. The frequency distribution of letters in English texts is known

# The Vigenere cipher

<img width="338" height="104" alt="image" src="https://github.com/user-attachments/assets/850af505-b25c-4a07-a720-036b6beb0611" />


# Principle of Modern Cryptography

The previous (historical) ciphers were designed in a heuristic manner:
- "Clever" design
- if attacks are found, patch the scheme to thwart the attack
- While it was clear when a cipher is not secure (a severe attack is found) there was no agreed-upon notion of what it means if a cipher is secure

Modern cryptography has shifted towards a science:

- Schemes are designed and analyzed in a more systematic manner
- Goal: rigorous proofs that show security
- It relies on three important principles

## Principle 1: Formal definitions

1. A security guarantee (from view of attacker an attacker's goal that constitutes a break of the scheme)
2. A threat model (describing what the adversary is capable of)

### Attacker's goal:

- It should be impossible for an attacker to recover the key
  - Consider the encryption scheme where Enc (k,m) = m. This is obviously insecure but it is impossible for an attacker to recover the key. The key is a means to an end, not the end itself
- It should be impossible for an attacjer to recover the plaintext from the cipher text
  - Consider the case that an adversary can recover 50% of the plaintext while the other 50% remain hard to figure out. This is clearly unacceptable.(e.g., consider the case where the plaintext describes how much money Alice wants to transfer to Bob, the second part the amount of money)
- It should be impossible for an attacker to recover any character of the plaintext from the ciphertext
  - Consider the example above and an encryption scheme that reveals whether the amount of money is more than, say, 100$. This does not reveal a particular digit of the plaintext but still reveals some information.
-Attacker's goal:
  - The "right" answer: regardless of any information an attacker already has, a ciphertext should leak no additional information about the underlying plaintext

# Threat model:

Ciphertext-only attack: The adversary just observes ciphertexts. This is the threat model we have been implicity assuming thus far

Known-plaintext attack: The adversary can learn some plaintext-ciphertext pairs and aims to deduce information of a plaintext underlying some other ciphertext

Chosen-plaintext attack: The adversary can obtain plaintext-ciphertext pairs, as above, for plaintexts of its choice

Chosen-cipher attack: The adversary is additionally able to obtain the decryption of ciphertext of its choice

## Principle 2: Precise assumptions

Most modern cryptographic constructions cannot be proven secure uncoditionally

Importance of clear  assumptions:

1. Validation of assumptions: the more an assumptions is studied without being refuted, the more confident we are that the assumption is actually true
2. Comparison of assumptions: if we have two schemes proven to satisfy some definition based on different assumptions, which one should be preffered? The one based on the weaker assumption
3. Understanding the necessary assumptions: if an underlying building block is found to have weakness, how can we tell if the encryption sheme is still secure? We merely need to check if the weakness affects the assumption needed for proving the encryption scheme secure

## Principle 3: Proofs of security

- Provide a rigorous proof that a construction satisfies a given definition under certain specified assumprions
  - Provides an iron-clad guarantee - relative to our definition and assumptions!
- Without a proof, we are left with our intuition
  - Experience shows that intuition about security is often disastrous
  - Countless examples of unproven schemes that were broken; sometimes immediately and sometimes years after deployment

Principles of Modern Cryptography \
Principle 1: Formal definitions \
Principle 2: Precise assumptions \ 
Principle 3L Proofs of security \
