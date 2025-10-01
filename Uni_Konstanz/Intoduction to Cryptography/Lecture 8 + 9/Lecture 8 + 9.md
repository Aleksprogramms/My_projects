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
