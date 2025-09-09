{-======================================================================
Belous
Übungsblatt 07
🟢🟢🟢🟢 10/10, bestanden
======================================================================-}
{-----(Aufgabe 1) 🟢-----}
{--               eq2           eq1           eq2            
1. (a ◁ b) ◁ c ≡ (b ▷ a) ◁ c ≡ b ▷ (a ◁ c) ≡ (a ◁ c) ◁ b         🗸

                                     fl1     eq2     fl1                    fl2
2. IA: xs = [] -> y ▷ foldl (◁) z [] ≡ y ▷ z ≡ z ◁ y ≡ foldl (◁) (z ◁ y) [] ≡ foldl (◁) z (y:[])     🗸
   IH/IV: y ▷ foldl (◁) z xs ≡ foldl (◁) z (y:xs)
   IS: x:xs
       y ▷ foldl (◁) z (x:xs)
 fl2  ≡ y ▷ foldl (◁) (z ◁ x) xs
 IV   ≡ foldl (◁) (z ◁ x) (y:xs)
 fl2  ≡ foldl (◁) ((z ◁ x) ◁ y) xs
 1.   ≡ foldl (◁) ((z ◁ y) ◁ x) xs
 fl2  ≡ foldl (◁) (z ◁ y) (x:xs)
 fl2  ≡ foldl (◁) z (y:(x:xs))      🗸

        
                                fr1 fl1
3. IA: xs = [] -> foldr (▷) z [] ≡ z ≡ foldl (◁) z []   🗸
   IH/IV: foldr (▷) z xs ≡ foldl (◁) z xs
   IS: x:xs
      ≡ foldr (▷) z (x:xs)
 fr2  ≡ x ▷ foldr (▷) z xs
 IV   ≡ x ▷ foldl (◁) z xs
 2.   ≡ foldl (◁) z (x:xs)      🗸
--}

{-----(Aufgabe 2) 🟢-----}
splitWords :: String -> [String]
splitWords [] = []
splitWords str = filter (not . null) (split str)
  where
    split [] = []
    split s  = let (word, rest) = break (`elem` " \t\n") s
               in word : split (dropWhile (`elem` " \t\n") rest)


{-----(Aufgabe 3) 🟢-----}
substring :: String -> String -> Bool
substring [] _ = True
substring _ [] = False
substring x y@(z:zs) | (length y < length x) = False
                     | (and (zipWith (==) x y)) = True
                     | otherwise = substring x zs


{-----(Aufgabe 4) 🟢-----}
diagl :: Int -> [[a]] -> [a]
diagl 0 _ = []
diagl _ [] = []
diagl k x@(y:ys) | (k <= length y) = (x !! 0 !! (k-1)):(diagl (k-1) ys)
                    | otherwise = diagl (length y) (drop (k-length y) x)

diag :: [[a]] -> [a]
diag [] = []
diag x@(y:ys) = concat [diagl n x | n <- [1..(length y + length ys)]] 

main :: IO ()
main = do
    putStrLn "(----Aufgabe 2----)"
    print $ splitWords " Dies ist eine \t Zeichenkette mit vielen\nLeerzeichen."

    putStrLn "(----Aufgabe 3----)"
    print $ substring "ob" "foobar"
    print $ substring "or" "foobar"

    putStrLn "(----Aufgabe 4----)"
    print $ diag [[11,12,13],[21,22,23]]
    print $ diag ["abdg","cehk","filn","jmop"]

    -- print $ take 4 $ map (take 4) [ [1..] | _ <- [1..] ] Prozess ist sehr lang
    -- print $ take 10 $ diag [ [1..] | _ <- [1..] ] Prozess ist sehr lang

    --[JFM] Nicht nur sehr lang, sondern unendlich. length auf einer unendlichen Liste terminiert nicht.

m1 = [[i*5 .. (i+1)*5-1] | i <- [0..4]]