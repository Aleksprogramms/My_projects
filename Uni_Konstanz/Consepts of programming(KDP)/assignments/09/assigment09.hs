{-======================================================================
Belous
Übungsblatt 09
🟡🟡🟢🔴 8/10, bestanden
======================================================================-}
{-----(Aufgabe 1) 🟡-----}

-- foldr mit go
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f z xs = go xs
  where
    go []     = z
    go (y:ys) = f y (go ys)

-- foldl mit go
foldl' :: (b -> a -> b) -> b -> [a] -> b
foldl' f z xs = go z xs
  where
    go acc []     = acc
    go acc (y:ys) = go (f acc y) ys

--[JFM] Korrekt; in Zeilen 10 und 17 kann jeweils noch eine eta-Konversion gemacht werden

-- mix mit go
mix :: (a -> b) -> (a -> b) -> [a] -> [b]
mix f g = go 1
        where 
          go _ [] = []
          go i (x:xs) | odd i = (f x):(go (i+1) xs)
                      | even i = (g x):(go (i+1) xs)

--[JFM] Die Idee zur Untescheidung der Aufrufe ist nicht schlecht, widerspricht aber etwas dem Sinn der Aufgabe,
--      da möglichst Argumente nicht weiter mitgeben werden sollen. 
--      Aus diese Art wird ein weizteres nicht-statisches Argument eingeführt, auf das nicht da go-Ideom angewendet werden kann. 


{-----(Aufgabe 2) 🟡-----}

data LExpr
  = Var String
  | App LExpr LExpr
  | Lam String LExpr
  deriving (Eq, Show)

lfold :: (String -> a) -> (a -> a -> a) -> (String -> a -> a) -> LExpr -> a
lfold var app lam expr =
  case expr of
    Var s     -> var s
    App e1 e2 -> app (lfold var app lam e1) (lfold var app lam e2)
    Lam s e   -> lam s (lfold var app lam e)

numApps :: LExpr -> Int
numApps = lfold (const 0) (\x y -> 1 + x + y) (const id)

free :: LExpr -> [String]
free = lfold (\s -> [s]) (++) (\s e -> filter (/= s) e)

bound :: LExpr -> [String]
bound = lfold (const []) (++) (\s e -> s : e)

--[JFM] Diese Implementation von bound sammelt die Abstaktionen, nicht die Vorkommen gebundener Variablen
--      Einfaches Beispiel: 
lamtest = Lam "x" (Var "f")
-- hat keine gebundenen Variablen

{-----(Aufgabe 3) 🟢-----}


class Eq a => POrd a where 
      pcompare :: a -> a -> Maybe Ordering 
      (~<), (~>), (~<=), (~>=) :: a -> a -> Bool

      pcompare x y | x == y = Just EQ
                   | x ~<= y = Just LT
                   | x ~>= y = Just GT     --[JFM] mit der Definition | y ~<= x = Just GT hier, kann die minCompDef kleiner gemacht werden
                   | otherwise = Nothing

      x ~< y = pcompare x y == Just LT
      x ~> y = pcompare x y == Just GT
      x ~<= y = (pcompare x y /= Just GT) && (pcompare x y /= Nothing)
      x ~>= y = (pcompare x y /= Just LT) && (pcompare x y /= Nothing)

      mins, maxs :: [a] -> [a]
     
      mins [] = []
      mins xs = map fst (filter snd (zip xs [[y | y <- xs, y ~< x] == [] | x <- xs]))
     
      maxs [] = []
      maxs xs = map fst (filter snd (zip xs [[y | y <- xs, y ~> x] == [] | x <- xs]))
     
-- 2)

-- Funktionen ~<= und ~>= bilden die Minimal Complete Definition in der obigen Implementation

substring :: Eq a => [a] -> [a] -> Bool
substring [] _ = True
substring _ [] = False
substring p@(x:xs) (y:ys) = x == y && prefix xs ys || substring p ys
   where
      prefix [] _ = True
      prefix _ [] = False
      prefix (a:as) (b:bs) = a == b && prefix as bs

instance Eq a => POrd [a] where

    x ~<= y = substring x y
    x ~>= y = substring y x

{-----(Aufgabe 4) 🔴-----}

data BinTree a = Empty | Node a (BinTree a) (BinTree a)
  deriving (Eq, Show)

splitleftmost :: BinTree a -> Maybe (a, BinTree a)
splitleftmost tree = go tree Nothing
  where
    go Empty acc = acc
    go (Node v l r) _ = go l (Just (v, Node v l r))

--[JFM] leftmost element wird gefunden, Restbaum wird nicht richtig zurückgeben (leftmost soll entfernt werden, Knoten verschwinden, ...)