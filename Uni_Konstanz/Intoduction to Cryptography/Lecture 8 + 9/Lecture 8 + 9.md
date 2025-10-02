# Number Theory and Cryptographic Hardness Assumptions

## Preliminaries and Basic Group Theory

### Primes and Divisibility

For a,b ∈ Z, we write a | b if there exists c ∈ Z such that ac = b and a ∤ b if no such c exists

If a | b and a is positive: a is a dicisor of b; If additionaly a !∈ {1,b}, a is a nontrivial divisor or a factor of b

A positive p > 1 is prime if it has no factors

A positive integer greater than 1 that is not prime is composite

A fundamental theorem of arithmetic states that every integer greater than 1 can be expressed uniquely as a product of primes (up to ordering)

-> Any integer N > 1 can be written as ![alt text](image.png), where the {p_i} are distinct primes and e_i >= 1

-> Example: N = 45 = 3^2 * 5, i.e. p_1 = 3, p_2 = 5, e_1 = 2, and e_2 = 1


The following proposition formalizes the concept of divison with remainder

#### Proposition 9.1
Let a be an integer and let b be a positive integer. Then there exist unique integers q,r for which a = qb + r and 0 <=  r < b

The greatest common divisor of integers a and b, denotes by gcd(a,b), is the largest integer c such that c  | a and c | b
-> if p is prime then gcd(a,p) is either 1 or p
-> if gcd(a,b) = 1 we say that a and b are relatively prime

Let a,b be potitve integers. Then there exists integers X, Y such that Xa+Xb = gcd (a,b). Furthermore, gcd (a,b) is the smallest positive integer that can be expressed this way

For instance, if a = 5 and b = 3, we have gcd (5,3) = 1 as well as X = 2 and Y = -3

The Euclidean algorithm computes gcd(a,b) in polinomial time

The extended Euclidean algorithm computes X, Y in polynomial  time

Two more results:

If c | ab and gcd (a,c) = 1, then c | b. Thus, if p prime and p | ab then either p | a or p | b

-> "If c dicides the product of a and b but c does not divide a, then c must divide b"

If a | N, b | N, and gcd(a,b) = 1, then ab |  N

-> If both a and b divide N and are relative prime, then their product divides N

For instance, a = 3, b = 4, and N = 24

### Modular Arithmetic

Let a,b,N ∈ Z with N > 1

By proposition 9.1., there exist q, r such that a = qN + r with 0 <= r < N; we define [a mod N] to be this r

Mapping a to [a mod N] is called reduction modulo N

We say that a and b are congruent modulo N (written as a = b mod N), if

[a mod N] = [b mod N]

-> Note that a = b mod N if and only if N | (a-b)

Congruence modulo N is an equivalence relation, i.e.,

- it is reflexive (a = a mod N);
- it is symmetric (a = b mod N implies b = a mod N);
- it is transitive (if a = b mod N and b = c mod N, then a = c mod N)

As a consequence, we can "reduce then add/multiply" instead of "add/ multiply then reduce"

Compute 1093028 * 190301 mod 100. It holds that 1093028 = 28 mod 100 and 190301 = 1 mod. 

Thus, 1093028 * 190301 = [1093028 mod 100] * [190301 mod 100] = 28 * 1 = 28 mod 100

Conguerence modulo N does not (in general) respect division

- if a = a' mod N and b = b' mod N then it is not necessarily true that a/b = a'/b' mod N (a/b mod N  might not even be well-defined)
- Specific example: ab = cb mod N does not imply a = c mod N

Consider N = 24. Then 3 * 2 = 6 = 15 * 2 mod, but 3 != 15 mod 24.

If for given b, there exists c such that bc = 1 mod N, then b is invertible modulo N and c is called a (multiplicative) inverse of b

-> we write b^(-1) for the inverse in {1, ..., N-1}

"Division by b modulo  N"  is multiplication by b^(-1)

Natural question: which integers are invertible? (0 is never invertible)
-> division by b is only defined when b is invertible

#### Proposition 9.7

Let b, N be integers, with b>= 1 and N > 1. Then b is invertible modulo N if and only if gcd(b,N) = 1

gcd(2, 24) =2, i.e. 2 is not invertible modulo 24

### Groups


Let G be a set. A binary opertation ◦ on G is simply function ◦(·, ·) that maps two elements of G TO another element of G. If g,h ∈ G then we write g ◦ h insted of ◦(g, h) 

A group is a set G along with a binary operation ◦ for which the following conditions hold:

- (Closure:) For all g,h ∈ G, g ◦ h ∈ G
- (Existence of an identity:) There exists an identity e ∈ G such that for all g ∈ G, e ◦ g = g = g ◦ e.
- (Existence of inverses:) For all g ∈ G there exists an element h ∈ G such that g ◦ h = e = h ◦ g. Such an h is called an inverse of g.
- (Associativity:) For all g1,g2,g3 ∈ G, (g1 ◦ g2) ◦ g3 = g1 ◦ (g2 ◦ g3) 

When G has a finite number of elements, we say that G is finite and let |G| denote the order of the group  (that is, the number of elements in G).

A group G with operation ◦ is abelian if the following holds:

- (Commutativity:) For all g,h ∈ G, g ◦ h = h ◦ g

We will always consider finite, abelian groups

One can show:
- The identity element in a group is unique, i.e., we can refer to the identity of a group 
- Each element of G has a unique inverse

If G is a group, a set H ⊆ G is a subgroup of G if H itself forms a group under the same operation associated with G

-> to check this, one needs to verify closure, existence of identity and inverses, and associativity
-> Every group G always has the trivial sungroups G and {1}
-> H is called a strict subgroup of G if H != G

We will moslty use additive notation or multiplicative notation, depending on the group in discussion

Additive notation:

- The group operation applied to elements g,h denotes by g + h
- The identity is denotes by 0;
- The inverse of an element g is denoted by -g (and h - g is written instead h + (-g))

Multiplicative notation:

- The group operation applied to elements g,h is denotes by g · h or simply gh;
- The identity is denoted by 1;
- The inverse of an element g is denoted by g ^(-1) ( and often h/g is witten instead of hg ^ (-1))

Examples:

A set may be a group under one operation, but not another. For example Z is an abelian group under addition (identity is 0 and every integer g has inverse -g); On the other hand, Z is not a group under multiplication (integer 2 has no inverse in the integers).

The set of real Numbers R is not a group under multiplication (0 has multiplicative inverse). The set of nonzero real number, however, is an abelian group under multiplication with identity 1.


Let N > 1 be an integer. The set {0, ..., N - 1} with respect to addition modulo N (i.e. where a + b = [a + b mod N]) is an abelian group of order N.

Closure is obvious: associativity and commutativity follow them from the fact that the integers satisfy these properties; the identity is 0; and, since a + (N - a) = 0 mod N, it follows that the inverse of any element a is [(N - a) mod N]

We denote this group by Z_w. (We will also sometimes use Z_w to denote the set {0, ..., N - 1} without regard to any particullar froup operation.)

### Group Exponentiation

Often useful to describe the group operation applied m times to a fixed element g

When using additive notation, we write

mg = m * g  = g + ...(m times)... + g

-> note that here m is an integer and g is a group element
-> the notation "behaves as it should", e.g. if g ∈ G and m, m' ∈ Z, then (mg) + (m'g) = (m + m')g, m (m'g) = (mm')g, and 1 * g = g

when using multiplicative notion, we write

g^m = g...(m times)...g

-> fimilar rules of exponentiation hold: ![alt text](image-1.png)

When using additive notation, we define
- 0 * g = 0
-> note that the left 0 is an integer while right 0 is the identity of the group

- (-m) * g = m * (-g)
-> Here, -g is the inverse of g and (-m)g = -(mg)

When using multiplicative notation, we define

![alt text](image-2.png)
#### Corollary 9.15
Let G be a finite group with m = |G|, the order of the group. Then for any element g ∈ G, it holds that g^m = 1

Let G be a finite group with m = |G| > 1. Then for any g ∈ G and any integer x, we have g ^ x = g ^ [x mod m]

Written additively, Corollary 9.15 says that if g is an element in a group of order m, then x * g = [x mod m] * g.

As an example, consider the group Z_15 of order m = 15 and g = 11. 

152 * 11 = [152 mod 15] * 11 = 2 * 11 = 11 + 11 = 22 = 7 mod 15

#### Corollary 9.17

A useful corollary for cryptographic applications:

Let G be a finite group with m = |G| > 1. Let e > 0 be an integer, and define the function f_e: G -> G by f_e(g) = g ^ e. If gcd(e,,m) = 1, then f_e is a permuutation (i.e., a bijection). Moreover,, if d = e ^ (-1) mod m then f_d is the inverse of f_e.

The set Z_N = {0, ..., N - 1} is a group under addition modulo N

Next, we define a group with respect to multiplication modulo N

-> we have to eliminate all elements that are not invertible 
-> 0 has no multiplicative inverse and needs to be eliminated
-> Nonzero element might also not be invertible

the invertible elements b ∈ {1, ..., N - 1} satisfy gcd(b, N) = 1

Hence, the set 

![alt text](image-3.png)

consists of the integers that are relatively prime to N

Let N > 1 be an integer. Then ![alt text](image-4.png) is an abelian group under multiplication modulo N.

The group ![alt text](image-5.png)

define ϕ(N) = |![alt text](image-5.png)| (Euler phi function); what is the value of ϕ(N) (order of ![alt text](image-5.png))?

First case: N = p is prime

-> All elements in {1, ..., p-1} are relatively prime to p, hence ![alt text](image-6.png)

Second case: N = pq, where p and q are distinct primes

-> if a ∈ {1, ..., N - 1} is not relatively prime to N, then either p | a or q | a
-> There are q - 1 elements divisible by p: p, 2p, ..., (q-1)p
-> There are p - 1 elements divisible by q: q, 2q, ..., (p-1)q
-> Thus, the remaining elements (neither divisible by p nor q) are

(N - 1) - (q - 1) - (p - 1) = pq - p - q + 1 = (p - 1)(q - 1)

-> ϕ(N) = (p - 1)(q - 1)

The general result:

![alt text](image-7.png)

Take N = 15 = 5 * 3. Then Z*_15 ={1,2,4,7,8,11,13,14} and |Z *_15| = 8 = 4 * 2 = ϕ(15). The inverse of 8 in Z *_15 is 2, since 8 * 2 = 16 = 1 mod 15

The following two results follown from Theorem 9.14 and Corollary 9.17:

![alt text](image-8.png)

![alt text](image-9.png)

# Primes, Factoring, and RSA 

One fundamental problem from number theory that is conjectured to be hard: integer factorization or simply factoring:

- Given a composite integer N, find p, q > 1 such that N = pq

The problem can solved in exponential time ![alt text](image-10.png) via trial division:

- Check if p divides N for p  = 2, ..., ![alt text](image-11.png)
- sqrt(N) many division, each taking polygon(N) = |N|^c time for some constant c
- While the largest factor can be as N / 2, the smallest factor can be at most ![alt text](image-12.png)

As of today, no polynomial - time (classical) algorithm for factoring exists
-> Shor's algorithm solves factoring in polynomail-time on a quantum computer

The weak factoring experimatn w-Factor_A(n):
1. Choose two uniform n-bit integers x1, x2.
2. Compute N = x1 * x2.
3. A is given N, and outputs x1', x2' > 1.
4. The output of the experiment is defined to be 1 if x1' * x2' = N, and 0 otherwise.

Given that factoring as assumed to be hard, does this imply that Pr[w-Factor_A (n) = 1] for any PPT A?
-> No

With probability 3/4, N will be even (occurs when either x1 or x2 is even); in this case, A can output x'1 = 2 and x'2 = N / 2

Factoring is hard for numbers that have only large factors
-> we need to refine the experiment such that x1 and x2 are n-bit primes rather than integers
-> for this, we need to efficiently generate primes, which is the next topic

The distribution of primes

The prime number theorem gives a fairly precise bound on the fraction of primes

For any n > 1, the factoring of n-bit integers that are prime is at least 1/3^n.

if we set t = 3n^2, the probability that Algorithm 3.21 never chooses a prime ()

## 284