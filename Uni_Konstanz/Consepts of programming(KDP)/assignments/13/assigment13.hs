{-======================================================================
Belous
Übungsblatt 13
🟡🟢🟡 10/10, bestanden
======================================================================
-}
{-----(Aufgabe 1) 🟡-----}
--[JFM] Sieht gut aus, aber warum sind die Funktionen auskommentiert?

-- Trennt eine Liste von Either-Werten in zwei separate Listen:
-- Eine Liste mit den Left-Werten
-- Eine Liste mit den Right-Werten

-- foo :: [Either a b] -> ([a], [b])
-- foo xs = ([x | Left x <- xs], [x | Right x <- xs])

-- Wendet die erste Funktion auf das dritte Argument an.  
-- Anschließend wird die zweite Funktion auf das dritte Argument und das zuvor erhaltene Ergebnis angewendet.  
-- Beispiel: bar (+1) (+) x  
-- Addiert x mit dem um 1 erhöhten Wert von x

-- bar :: (a -> b) -> (a -> b -> c) -> a -> c
-- bar f g x = g x (f x)

-- Wendet das erste Argument (eine Funktion) auf das zweite Argument an.  
-- Die zweite Komponente des Ergebnisses wird zu einer Liste hinzugefügt.  
-- Diese Liste besteht aus den zweiten Komponenten der Ergebnisse rekursiver Anwendungen des ersten Arguments auf die erste Komponente des vorherigen Ergebnisses.


-- unendliche Liste
-- Beispiel: take 10 $ baz (\x -> (2*x, 2*x)) 1 erzeugt die Liste der ersten 10 Zweierpotenzen ([2,4,8,16,32,64,128,256,512,1024])

-- baz :: (a -> (a,b)) -> a -> [b]
-- baz f x = (snd (f x)):(baz f (fst (f x))) 

{-----(Aufgabe 2) 🟢-----}
--                               f:1  x:5
--                              ---------@
--      cons:9  x:5     go:3        10
--    ------------@   ---------------@
--       7                  8
--      ----------------------@
--           6
--         -----\ x::5
--           go:3        go:4
--          ------------------let
--                 2
--               ----\ f::1
--                 0
-- 
-- 
-- 0 = 1 -> 2
-- 4 = 2
-- 
-- 3 = 5 -> 6        3 = 10 -> 8
-- 7 = 8 -> 6        10 = 5
-- 9 = 5 -> 7        8 = 6
-- 10 = 5            1 = 5 -> 10
-- 8 = 6             9 = 11 -> [11] -> [11]
-- 1 = 5 -> 10       11 = 5
-- 11 = 5            7 = [11] -> [11]
-- 6 = [11]          8 = [11]
-- 6 = [11]
-- 
-- da 1 = 5 -> 5 
-- 0 = 1 -> 5 -> [5]
-- => 0 = (5 -> 5) -> 5 -> [5]
-- 
-- 
-- iterate :: forall a. (a -> a) -> a -> [a]


{-----(Aufgabe 3) 🟡-----}
--[JFM] Bei der Aufgabe grundsätzlich auf die Präzendez von Operatoren achten. 
--[JFM] Die Juxtaposition hat eine höhere Präzendenz als .
--[JFM] Am Ende wollen wir zeigen fmap (g ○ h) xs = ((fmap g) ○ (fmap h)) xs
--[JFM] Die Ausdrücke 
--      ((fmap g) ○ (fmap h)) xs 
--      und 
--      (fmap g) ○ (fmap h) xs = (fmap g) ○ ((fmap h) xs) 
--      sind verschieden


-- 1. 
-- fmap _ [] = []                 | fm1
-- fmap g (x:xs) = gx : fmap g s  | fm2
-- 
-- 
--                     fm1   fm1        fm1                 def ○ 
-- IA: fmap (g ○ h)  [] = [] = fmap g [] = fmap g (fmap h []) = (fmap g) ○ (fmap h) [] 
-- 
-- IV: Gelte fmap (g ○ h) xs = (fmap g) ○ (fmap h) xs
-- 
-- IS: xs -> (x:xs)
-- 
-- fmap (g ○ h) (x:xs)
--  
-- fm2         = ((g ○ h) x) : fmap (g ○ h) xs
-- IV          = ((g ○ h) x) : ((fmap g) ○ (fmap h) xs)
-- def ○ (2x)  = (g (h x)) : fmap g (fmap h xs)
-- fm2         = fmap g ((h x) : (fmap h xs))
-- fm2         = fmap g (fmap h (x:xs))
-- def ○       = (fmap g) ○ (fmap h) (x:xs)
-- 
-- 2. 
-- data BinTree a = Empty
--                 | Node (BinTree a) a (BinTree a)
--                 deriving (Eq, Show)
-- 
-- testTree :: BinTree Integer
-- testTree = (Node (Node Empty 3 Empty) 5 (Node (Node Empty 1 Empty) 4 Empty))
-- instance Functor BinTree where 
--       fmap _ Empty = Empty 
--       fmap f (Node l x r) = Node (fmap f l) (f x) (fmap f r) 
-- 
-- 
-- 
-- IA: fmap id Empty = Empty = id Empty
-- 
-- IV: Gelte fmap id b = id b für die Unterbäume l und r
-- 
-- IS: l,r -> Node l x r
-- 
-- fmap id (Node l x r)
-- 
-- fm2         = Node (fmap id l) (id x) (fmap id r)
-- IV (2x)     = Node (id l) (id x) (id r)
-- def id (3x) = Node l x r
-- def id      = id (Node l x r)