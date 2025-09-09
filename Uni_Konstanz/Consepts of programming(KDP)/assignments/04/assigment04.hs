{-======================================================================
Belous
Übungsblatt 04
🔴🔴🟢🟢 5/10, bestanden

Aufgaben 1,2 kann ich leider nicht werten.
Auf dem Übungsblatt stand explizit, dass nurnoch .hs oder .lhs Abgaben angenommen werden.

Hier trotzdem ein Kommentar zu den Aufgaben:
- Aufgabe 1 stimmt
- Alpha-Konversion ist nicht dazu gedacht, Ausdrücke einfacher auszuwertern, sonder sie korrekt auszuwerten. 
  Die entsprechenden Argumentationen ob oder ob nicht nötig, muss also nochmal überarbeitet werden.
======================================================================-}

crossSum :: Integer -> Integer -> Integer
crossSum basis zahl 
    | zahl < basis = zahl
    | otherwise = (zahl `mod` basis) + crossSum basis (zahl `div` basis)

nat_pow :: Double -> Integer -> Double
nat_pow x 0 = 1
nat_pow x k
  | even k    = nat_pow (x * x) (k `div` 2)
  | otherwise = x * nat_pow (x * x) (k `div` 2)

pow :: Double -> Integer -> Double
pow x k
  | k == 0    = 1
  | k > 0     = nat_pow x k
  | otherwise = 1 / nat_pow x (-k)

main :: IO ()
main = do
    putStrLn "(----Aufgabe 3----)"
    print $ crossSum 10 123
    print $ crossSum 2 42
    print $ crossSum 16 1000
    putStrLn "(----Aufgabe 4----)"
    print $ nat_pow 2.0 0
    print $ nat_pow 4.0 4
    print $ nat_pow 6.0 5
    print $ pow 4.0 (-2)
    print $ pow 6.0 (-5)