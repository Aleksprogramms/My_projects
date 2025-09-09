

# Sol 2

# Ex1

(a) 

Pr[M = m | C = c] = Pr[M = m]

if we assume that k != 0^n, that means by using OTP, that we can not get Enc_k(m) = m

Than Pr[M = m | C = c] = 0 != 1/2^n = Pr[M = m]

(b)

Pr[Enc_K(m) = c] = Pr[Enc_K(m') = c]

Again k != 0^n, than Equaison Pr[Enc_K(m) = c] = 0, where m = c  

Thus, Pr[Enc_K(m) = c] = 0 != 1/2^n - 1 = Pr[Enc_K(m') = c]

# Ex2

Enc_k(m) = [m + k mod 3]

(a) The message space is M = {0,1}, and Gen chooses a uniform key from the key space K = {0,1}

Pr[M = 0| C = 2] = 0 != 1/2 = Pr[M = m]

(b) The message space is M = {0, 1, 2}, and Gen chooses a uniform key from the key space K = {0, 1, 2}.

Shannon's Theoreme :)))))

(c) The message space is M = {0, 1}, and Gen chooses a uniform key from the key space K = {0, 1, 2}.

Pr[Enc_K(m) = c] = Pr[c = m + k mod 3] 
                 = Pr[k = c - m  mod 3] 
                 = 1/3

So it's perfectly secret

# Ex 3

0x012345 

0xFFEEDD

key = FECB98

# Ex 5

(a) We consider the condition, that m1 !=  m2, but c1 = c2

Dec must be deterministic, so that Dec(k,c) = m (for the same key), but it can not be so, because we said that m1 != m2 

Pr[M1 = m1 ∧ M2 = m2 | C1 = c1 ∧ C2 = c2] = 0 != Pr[M1 = m1 ∧ M2 = m2]

(b) ... can not write big formulas here:(