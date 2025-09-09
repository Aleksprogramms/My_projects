


> xxx :: Integer -> Integer
> xxx 0 = 1
> xxx n = 2 * xxx (n-1)

> foo :: Integer -> Integer -> Integer
> foo m 0 = m
> foo m n = foo n (m `mod` n)

> bar :: Integer -> Bool
> bar 1 = False
> bar n = [ x | x <- [2..n-1], n `mod` x == 0 ] == []



