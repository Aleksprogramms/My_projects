{-======================================================================
Belous
Übungsblatt 12
🟢🟢🟢🟡 10/10, bestanden
======================================================================-}
--  {-----(Aufgabe 1) 🟢-----}
--
--  x::8
--  ------ \ x::8
--     7       g::3
--   --------------- @
--               6     x::2
--              ------------ @
--  f::1              5
--  --------------------- @   
--             4
--           ---- \ f::1, x::2, g::3
--             0
--  
--  0 = 1 -> 2 -> 3 -> 4          % 7 = 8 -> 8
--  1 = 5 -> 4                    % 3 = 8
--  6 = 2 -> 5                    % 6 = 8
--  7 = 3 -> 6                    % 8 = 2 -> 5
--  3 = 8
--  8 = 2 -> 5
--  
--  0 = (5 -> 4) -> 2 -> (2 -> 5) -> 4
--  
--  forall a b c. (a -> b) -> c -> (c -> a) -> b
--  
--  {-----(Aufgabe 2) 🟢-----}
--  
--  1. (λf x y. f y x) (λx. x)
--   
--      f::3  y::5
--    ------------- @
--          8         x::4
--         ---------------- @
--                 7                            x::6
--               ----- \ f::3, x::4, y::5     ------- \ x::6
--                 1                             2
--               ------------------------------------ @
--                                0
--  
--  1 = 3 -> 4 -> 5 -> 7          % 1 = 2 -> 0
--  8 = 4 -> 7                    % 0 = 4 -> 5 -> 7
--  3 = 5 -> 8                    % 2 = 3
--  2 = 6 -> 6                    % 2 = 5 -> 8
--  0 = 4 -> 5 -> 7               % 5 = 6
--  5 = 6                         % 8 = 6
--  6 = 4 -> 7                    % 6 = 4 -> 7
--  
--  0 = 4 -> (4 -> 7) -> 7
--  
--  forall a b. a -> (a -> b) -> b
--  
--  2.
--  
--             x::1
--            ------ \ y::5
--   map::3      4
--  --------------- @ 
--           2
--         ----- \ x::1
--           0
--  
--  
--  0 = 1 -> 2                    % 3 = (6 -> 7) -> [6] -> [7]
--  3 = 4 -> 2                    % 4 = 6 -> 7
--  4 = 5 -> 1                    % 2 = [6] -> [7]
--  2 = [6] -> [7]                % 6 = 5
--  6 = 5                         % 7 = 1
--  7 = 1
--  
--  0 = 1 -> ([5] -> [1])
--  
--  forall a b. a -> [b] -> [a]
--  
--  3.
--  
--    map::5   x::1
--   --------------- @
--           3         map::4
--          ------------------ @
--                   2
--                 ----- \ x::1
--                   0
--   
--  0 = 1 -> 2                    % 5 = (8 -> 9) -> [8] -> [9]
--  3 = 4 -> 2                    % 1 = 8 -> 9
--  5 = 1 -> 3                    % 3 = [8] -> [9]
--  4 = (6 -> 7) -> [6] -> [7]    % 4 = [8] (Typfehler!)
--  1 = 8 -> 9                    % 2 = [9]
--  
--  
--  4.
--  
--                    flip::8    f::1
--                   ----------------- @
--   ○::6    f::1            7             x::2
--  -------------- @        --------------------@
--         4                          5
--        ------------------------------ @
--                       3
--                     ----- \ f::1, x::2 
--                       0
--  
--  0 = 1 -> 2 -> 3               % 6 = (9 -> 10) -> (11 -> 9) -> 11 -> 10
--  4 = 5 -> 3                    % 1 = 9 -> 10
--  6 = 1 -> 4                    % 4 = (11 -> 9) -> 11 -> 10
--  7 = 2 -> 5                    % 5 = 11 -> 9
--  8 = 1 -> 7                    % 3 = 11 -> 10
--  1 = 9 -> 10                   % 8 = (12 -> 13 -> 14) -> 13 -> 12 -> 14 
--  5 = 11 -> 9                   % 1 = 12 -> 13 -> 14 
--  3 = 11 -> 10                  % 9 = 12
--  9 = 12                        % 10 = 13 -> 14
--  10 = 13 -> 14                 % 7 = 13 -> 12 -> 14
--  2 = 13                        % 2 = 13
--  11 = 12                       % 5 = 12 -> 14
--  12 = 14                       % 11 = 12
--                                % 9 = 14
--                                % 12 = 14
--  
--  0 = (14 -> 13 -> 14) -> 13 -> 14 -> 13 -> 14
--  
--  forall a b. (a -> b -> a) -> b -> a -> b -> a
--  
--  
--  5. 
--  
--    map::6    f::1
--   ---------------- @
--            5            x::2
--          -------------------- @
--   f::1            4
--  ------------------- @
--           3
--         ----- \ f::1, x::2
--           0
--  
--  0 = 1 -> 2 -> 3                % 6 = (7 -> 8) -> [7] -> [8]
--  1 = 4 -> 3                     % 1 = 7 -> 8
--  5 = 2 -> 4                     % 5 = [7] -> [8]
--  6 = 1 -> 5                     % 4 = 7
--  4 = 7                          % 3 = 8
--  3 = 8                          % 2 = [7]
--  2 = [7]                        % 4 = [8]
--  7 = [8]                        % 7 = [8]
--  
--  0 = ([8] -> 8) -> [[8]] -> 8
--  
--  forall a. ([a] -> a) -> [[a]] -> a
--  
--  {-----(Aufgabe 3) 🟢-----}
--  
--  
--  1) ○ map map 
--  
--     ○::3   map::4
--    --------------- @
--           2           map::1
--          -------------------- @
--                   0
--  
--  
--  2 = 1 -> 0                     % 3 = (5 -> 6) -> (7 -> 5) -> 7 -> 6
--  3 = 4 -> 2                     % 4 = 5 -> 6
--  4 = 5 -> 6                     % 2 = (7 -> 5) -> 7 -> 6
--  1 = 7 -> 5                     % 1 = 7 -> 5
--  0 = 7 -> 6                     % 0 = 7 -> 6
--  5 = 8 -> 9                     % 4 = (8 -> 9) -> [8] -> [9]
--  6 = [8] -> [9]                 % 5 = 8 -> 9
--  7 = 10 -> 11                   % 6 = [8] -> [9]
--  8 = [10]                       % 1 = (10 -> 11) -> [10] -> [11]
--  9 = [11]                       % 7 = 10 -> 11
--                                 % 5 = [10] -> [11]
--                                 % 8 = [10]
--                                 % 9 = [11]
--  
--  0 = (10 -> 11) -> [[10]] -> [[11]]
--  
--  forall a b. (a -> b) -> [[a]] -> [[b]]
--  
--  
--    2) twice map
--  
--    twice :: 1    map::2
--    ---------------------- @
--               0
--  
--  
--  
--    
--  
--  1 = 2 -> 0                      % 1 = (3 -> 3) -> 3 -> 3 
--  2 = 3 -> 3                      % 2 = 3 -> 3
--  0 = 3 -> 3                      % 0 = 3 -> 3
--                                  % 2 = (4 -> 5) -> [4] -> [5]
--                                  % 3 = 4 -> 5
--                                  % 3 = [4] -> [5]
--                                  % 4 = [4] (Typfehler)
--  
--  
--   Schluss: ○ map map und twice map sind somit nicht identisch 
--  
--  
--  {-----(Aufgabe 4) 🟡-----}

--[JFM] Gelb, weil
--      1. Logikfehler in Funktion buildHuffTree
--      2. Im Idealfall sollten die frequencies nicht im Baum selber gespeichert sein
--         So sind die Bäume nicht mit der Codierung und Decodierung vom letzten Blatt kompatibel. 
--         Auch wenn das nicht der effizienteste Ansatz wäre, würde ich vorschlagen noch eine Funktion hinzuzufügen,
--         die den hier resultierenden HuffTree in den "alten" HuffTree der letzten Übung übersetzt. 

data Bit = L | R
  deriving (Eq, Show)

data HuffTree = Leaf Char Int | Node Int HuffTree HuffTree
  deriving (Eq, Show)

frequency :: String -> [(Char, Int)]
frequency [] = []
frequency (x:xs) = (x, count x xs + 1) : frequency (remove x xs)
  where
    count c [] = 0
    count c (y:ys) = (if c == y then 1 else 0) + count c ys

    remove _ [] = []
    remove c (y:ys) = if c == y then remove c ys else y : remove c ys

leavesFromFreq :: [(Char, Int)] -> [HuffTree]
leavesFromFreq [] = []
leavesFromFreq ((char, freq):xs) = Leaf char freq : leavesFromFreq xs

combineTrees :: HuffTree -> HuffTree -> HuffTree
combineTrees left right = Node (freq left + freq right) left right
  where
    freq (Leaf _ f) = f
    freq (Node f _ _) = f

insertTree :: HuffTree -> [HuffTree] -> [HuffTree]
insertTree tree [] = [tree]
insertTree tree (x:xs)
  | freq tree <= freq x = tree : x : xs
  | otherwise = x : insertTree tree xs
  where
    freq (Leaf _ f) = f
    freq (Node f _ _) = f

buildHuffTree :: [HuffTree] -> HuffTree
buildHuffTree [tree] = tree
buildHuffTree (x:y:xs) = buildHuffTree (insertTree (combineTrees x y) xs)

--[JFM] Bevor die Bäume x,y combined werden, muss einmal initial die Liste der Leafs sortiert werden. 
--      Sonst ist nicht sichergestellt, dass x und y die Leafs mit der niedrigsten frequency sind, was
--      sie ja sein müssen, da diese potentiell die am tiefsten liegenden Leafs sind. 

codeOf :: String -> HuffTree
codeOf text = buildHuffTree (leavesFromFreq (frequency text))

-- codeOf "battat"  
-- Node 6 (Node 3 (Leaf 'b' 1) (Leaf 'a' 2)) (Leaf 't' 3)
-- codeOf "okokokokkkkoj"
-- Node 13 (Leaf 'j' 1) (Node 12 (Leaf 'o' 5) (Leaf 'k' 7))

main :: IO ()
main = do
    print $ codeOf "battat" 
    print $ codeOf "okokokokkkkoj"