{-======================================================================
Belous
Übungsblatt 06
🟢🟢🟢🟢🟢 10/10, bestanden
======================================================================-}
{-----(Aufgabe 1) 🟢-----}
{--(λx. (λy x. x y (x y y)) x +) 14   𝛼 ->   (λx. (λy z. z y (z y y)) x +) 14 
                                                           |             |______________
                                                           |𝛽                           |𝛽_________
                                                           |                                       |
                                              (λy z. z y (z y y)) 14 +                   (λx. (λz. z x (z x x)) +) 14 
                                                           |𝛽            __________________________|𝛽____________
                                                           |            |                                        |
                                                        (λz. z 14 (z 14 14)) +                         (λx. + x (+ x x)) 14  
                                                                       |________________________________________|
                                                                                                 |𝛽
                                                                                          + 14 (+ 14 14)
                                                                                                 |𝛿   
                                                                                             + 14 28
                                                                                                 |𝛿 
                                                                                                 42  
8 Ausdrücke (modulo alpha-Konversion) 
[JFM] Korrekt
[JFM] alpha-Konversion ist nur für den rechten Zweig notwendig
-}
{-----(Aufgabe 2) 🟢-----}
insSort :: (a -> a -> Bool) -> [a] -> [a]
insSort _ [] = []
insSort p (x:xs) = insert p x (insSort p xs)

insert :: (a -> a -> Bool) -> a -> [a] -> [a]
insert _ x [] = [x]
insert p x (y:ys) | p x y = x:y:ys
                  | otherwise = y:(insert p x ys)

{-----(Aufgabe 3) 🟢-----}
{--(1)--}
e :: Int -> [Char]
e = flip take ['a'..]
{--(2)--}
f :: [Int] -> [Int]
f = map (+1) . reverse
{--(3)--}
g :: [Double] -> [Double]
g = map $ negate . sqrt
{--(4)--}
h :: (a -> Bool) -> [a] -> Int
h p = length . filter p

{-----(Aufgabe 4) 🟢-----}

collatz :: Integer -> Integer -> Integer
collatz 1 c = c
collatz x c | even x = collatz (x `div` 2) (c + 1)
            | odd x = collatz (3 * x + 1) (c + 1)

maxList :: [(Integer,Integer)] -> (Integer,Integer)
maxList [x] = x
maxList (x:rest@(y:ys)) | ((fst x) > (fst y)) = maxList (x:ys)
                        | otherwise = maxList rest 

maxCollatz :: Integer -> (Integer,Integer)
maxCollatz x = maxList [(collatz n 0, n) | n <- [1..x]]

{-----(Aufgabe 5) 🟢-----}
spur :: [[Integer]] -> Integer
spur a = sum [(a !! n) !! n | n <- [0..((length a) - 1)]]

main :: IO ()
main = do
    putStrLn "(----Aufgabe 2----)"
    print $ insert (<) 3 [1,2,5,7,9]
    print $  insSort (>) [7,9,1,2,1,5]
    putStrLn "(----Aufgabe 4----)"
    print $ maxCollatz 50
    putStrLn "(----Aufgabe 5----)"
    print $ spur [[4,1],[2,5]]

