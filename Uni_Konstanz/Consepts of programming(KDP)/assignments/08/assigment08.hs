{-======================================================================
Belous
Übungsblatt 08
🟢🟢🟢 10/10, bestanden
======================================================================-}
{-----(Aufgabe 1) 🟢-----}
data LExpr = Var String -- Variable
               | App LExpr LExpr -- Funktionsapplikation
               | Lam String LExpr -- Lambda-Abstraktion
               deriving (Eq, Show)

expr :: LExpr
expr = Lam "x" (Lam "z" (App (App (Var "y") 
       (Lam "x" (App (Var "x") (Var "y")))) 
       (Lam "y" (App (Var "x") (Var "y")))))

free :: LExpr -> [String]
free (Var x)     = [x]                           
free (App e e')  = free e ++ free e'             
free (Lam x e)   = filter (/= x) $ free e        
                              

bound :: LExpr -> [String]
bound (Var _)     = []                             
bound (App e e')  = bound e ++ bound e'            
bound (Lam x e)   = if x `elem` free e             
                    then x : bound e               
                    else bound e                   


{-----(Aufgabe 2) 🟢-----}
data BinTree a = Empty
                      | Node (BinTree a) a (BinTree a)
                       deriving (Eq, Show)

tfold :: (b -> a -> b -> b) -> b -> BinTree a -> b
tfold f z = go
  where
    go Empty        = z
    go (Node l x r) = f (go l) x (go r)

telem :: Integer -> BinTree Integer -> Bool
telem x = tfold (\l v r -> l || (v == x) || r) False

-- tmin: Finds the minimum value in the tree
tmin :: BinTree Integer -> Maybe Integer
tmin = tfold combine Nothing
  where
    combine l v r = Just $ minimum (catMaybes [l, Just v, r])
    catMaybes = foldr (\x acc -> case x of
                                   Just y -> y : acc
                                   Nothing -> acc) []

{-----(Aufgabe 3) 🟢-----}

sampleText = "bla bla bla bla blabla bla blablabla bla bla bla bla blabla "

leftTextAlign :: Int -> String -> String
leftTextAlign width text = unlines $ fitWords width (words text)

fitWords :: Int -> [String] -> [String]
fitWords width = go [] 0
  where
    go currentLine currentLength [] = [unwords currentLine] -- Добавляем последнюю строку
    go currentLine currentLength (word:words)
        | currentLength + length word + length currentLine <= width
            = go (currentLine ++ [word]) (currentLength + length word) words
        | otherwise
            = unwords currentLine : go [word] (length word) words

distributeSpaces :: [String] -> Int -> String
distributeSpaces words extraSpaces =
    let gaps = length words - 1                         
    in if gaps == 0                                     
       then unwords words
       else let (baseSpaces, remainder) = extraSpaces `divMod` gaps
                spaces = replicate gaps (replicate baseSpaces ' ')
                extra = replicate remainder " " ++ repeat "" -- Добавляем дополнительные пробелы
            in concat $ zipWith (++) words (spaces ++ extra)

blockTextAlign :: Int -> String -> String
blockTextAlign width text = unlines $ map justifyLine $ init lines ++ [lastLine]
  where
    wordsList = words text
    lines = fitWords width wordsList
    lastLine = last lines
    justifyLine line =
        let extraSpaces = width - length (concat (words line)) -- Пробелы, которые нужно распределить
        in distributeSpaces (words line) extraSpaces

                          

main :: IO ()
main = do
     putStrLn "(----Aufgabe 1----)"
     print $ free expr  -- ["y", "y"]
     print $ bound expr -- ["x", "x", "y"]

     putStrLn "(----Aufgabe 3----)"
     putStrLn "Left-aligned:"
     putStr $ leftTextAlign 30 sampleText

     putStrLn "\nBlock-aligned:"
     putStr $ blockTextAlign 30 sampleText