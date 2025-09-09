{-======================================================================
Belous
Übungsblatt 10
🟡🟢🟢 10/10, bestanden
+1 Bonuspunkt
======================================================================
-}
{-----(Aufgabe 1) 🟡-----}

data Bit = L | R deriving (Eq, Show)

data HuffTree = Leaf Char | Node HuffTree HuffTree deriving (Eq, Show)

toTree :: String -> HuffTree
toTree str = buildTree (map Leaf (removeDuplicates str))
  where
    removeDuplicates [] = []
    removeDuplicates (x:xs) = x : removeDuplicates (filter (/= x) xs)

    buildTree [x] = x
    buildTree (x:y:xs) = buildTree (Node x y : xs)

huffEncode :: HuffTree -> String -> [Bit]
huffEncode tree = concatMap (encodeChar tree)
  where
    encodeChar (Leaf c) ch | c == ch = []
                           | otherwise = error "Character not in tree"
    encodeChar (Node l r) ch
      | ch `elem` chars l = L : encodeChar l ch
      | ch `elem` chars r = R : encodeChar r ch
      | otherwise = error "Character not in tree"
    
    chars (Leaf c) = [c]
    chars (Node l r) = chars l ++ chars r

--[JFM] Hier leidet die Effizienz, da für jeden besuchten Knoten der komplette Baum erneut durchlaufen wird. 
--      Das fällt besonders ins Gewicht, da hier die bäume ausschließlich maximal linksschwer sind. 

huffDecode :: HuffTree -> [Bit] -> String
huffDecode tree = decodeBits tree
  where
    decodeBits _ [] = []
    decodeBits (Leaf c) bits = c : decodeBits tree bits
    decodeBits (Node l r) (L:bits) = decodeBits l bits
    decodeBits (Node l r) (R:bits) = decodeBits r bits

--[JFM] Beim Decodieren geht der letzte char verloren. 
--      Im ersten Fall von decodeBits muss ein Leaf erreicht sein (da der Bitstring leer ist), 
--      der char darin muss noch mit zurückgegeben werden

{-----(Aufgabe 2) 🟢 (+1 Bonus)-----}

data LExpr = Var String | Lam String LExpr | App LExpr LExpr deriving (Eq)

instance Show LExpr where
  showsPrec _ (Var x) = showString x
  showsPrec d (Lam x e) = showParen (d > 0) $
    showString "\\" . showString x . showRest e
    where
      showRest (Lam y e') = showString " " . showString y . showRest e'
      showRest e' = showString " -> " . showsPrec 0 e'
  showsPrec d (App e1 e2) = showParen (d > 10) $
    showsPrec 10 e1 . showString " " . showsPrec 11 e2

--[JFM] Warum Präzedenzen 0, 10 und 11?
--[JFM] Klar, da relevant ist wie Präzedenzen relativ zueinander sind, führt das zur richtigen Lösung,
--      aber im Lamdakalül gibt es nur diese drei Konstruktoren, es gibt also keinen Grund Präzendenzen 1-9 frei zu lassen


{-----(Aufgabe 3) 🟢-----}

newVar :: String -> [String] -> String
newVar old blacklist = head $ filter (`notElem` (old : blacklist)) candidates
  where
    candidates = [old ++ [c] | c <- ['a'..'z']] ++ [old ++ show n | n <- [1..]]

--[JFM] Die Benennung der Variablen ist etwas inkonsistent. 
--      Auf "a" folgt "ab" ... "az", soweit so gut, aber dann kommt "a1", "a2" ...
--      Warum nicht gleich ["a1",..], oder wenigstens nach az dann "az1"?

subst :: LExpr -> String -> LExpr -> LExpr
subst m x (Var y)
  | x == y = m
  | otherwise = Var y
subst m x (Lam y e)
  | x == y = Lam y e
  | y `elem` freeVars m =
      let y' = newVar y (freeVars e ++ freeVars m)
      in Lam y' (subst m x (alphaConvert y y' e))
  | otherwise = Lam y (subst m x e)
subst m x (App e1 e2) = App (subst m x e1) (subst m x e2)

alphaConvert :: String -> String -> LExpr -> LExpr
alphaConvert old new (Var y)
  | y == old = Var new
  | otherwise = Var y
alphaConvert old new (Lam y e)
  | y == old = Lam new (alphaConvert old new e)
  | otherwise = Lam y (alphaConvert old new e)
alphaConvert old new (App e1 e2) = App (alphaConvert old new e1) (alphaConvert old new e2)

freeVars :: LExpr -> [String]
freeVars (Var x) = [x]
freeVars (Lam x e) = filter (/= x) (freeVars e)
freeVars (App e1 e2) = freeVars e1 ++ freeVars e2


main :: IO ()
main = do
     putStrLn "(----Aufgabe 2----)"
     print $ App (App (Var "f") (App (Var "g") (Var "x"))) (Var "x") -- f (g x) x
     print $ App (Lam "x" (App (Var "x") (Var "x"))) (Var "y") -- (\x -> x x) y
     print $ App (Lam "x" (Lam "y" (Var "x"))) (Var "z") -- (\x y -> x) z

     
     