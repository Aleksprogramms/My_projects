======================================================================
Belous
Übungsblatt 05
🟡🔴🟢🟢🟡🟡 8/10, bestanden

Die .lhs Datei hat nicht kompiliert, da kein Code darin enthalten war. 
Codezeilen müssen explizit mit > gekennzeichnet sein. 
Für diese Abgabe hab ich die > eingefügt, da die Datei danach kompiliert, werte ich diese Mal die Programmieraufgaben noch. 
Für zukünftige Abgaben führt eine nicht kompilierende Datei zum nicht-bestehen aller Programmieraufgaben auf diesem Blatt.  
======================================================================

(----Aufgabe 1----) 🟡
[JFM] Art der Reduktion/Konversion angeben (beta, delta, ...)

1. And True True
-> (λa b. a b False) True True
-> (λb. True b False) True
-> True True False
-> (λx y. x) True False
-> True

True AND True -> True

2. And True False
-> (λa b. a b False) True False
-> (λb. True b False) False
-> True False False
-> (λx y. x) False False
-> False

True AND False -> False

3. And False True
-> (λa b. a b False) False True
-> (λb. False b False) True
-> False True False
-> (λx y. y) True False
-> False

False AND True -> False

4. And False False
-> (λa b. a b False) False False
-> (λb. False b False) False
-> False False False
-> (λx y. y) False False
-> False

False AND False -> False

[JFM] Aufgabenteil 2 fehlt

(----Aufgabe 2----) 🔴

Y = λ x. (λ y. x (y y))(λ y. x (y y))
f = λ g. λ n. if (= n 0) 1 (* n (g (- n 1)))
Y f 2
Y f 2 = λ x. (λ y. x (y y))(λ y. x (y y)) f 2 
       ^                                 ^
[JFM] Hier fehlen Klammern, der richtig eigesetzte Ausdruck wäre hier:
[JFM] (λ x. (λ y. x (y y))(λ y. x (y y))) f 2
[JFM] Die folgende β-Reduktion ist trotzdem richtig

    -> (λ y. f (y y)) (λ y. f (y y)) 2 
        ^^^^^^^^^^^^   ^^^^^^^^^^^^  ^
        Ausdruck       Argument 1    Argument 2

[JFM] Hier wurde allerdings der falsche Ausdruck ausgewertet
[JFM] Oben steht der linke Ausdruck (markiert) mit zwei Argumenten
[JFM] Danach müsste stehen:
[JFM] (f ((λ y. f (y y)) (λ y. f (y y)))) 2 

    ->  (λ y. f (y y))f(2 2) 
    -> (λ y. f (y y))(λ g. if (= 2 0) 1 (* 2 (g (- 2 1))))

    [JFM] Hier ist nicht die komplette Definition für f eingesetzt worden und (2 2) verschwindet

    ->  (λ y. f (y y))(λ g. * 2 (g (1))) 
    -> (λ y. f (y y)) 2 -> f (2 2)
    ->  λ g. if (= 2 0) 1 (* 2 (g (- 2 1))) 
    -> λ g. * 2 (g (1)) 
    -> * 2 1 -> 2
2! = 1 * 2 

(----Aufgabe 3----) 🟢

> middle :: [a] -> a
> middle mid  
>    | even len =  mid !! (middleIndex - 1)
>    | otherwise  = mid !! middleIndex
>    where
>    len = length mid
>    middleIndex = length mid `div` 2 

(----Aufgabe 4----) 🟢

> allEqual :: [Integer] -> Bool
> allEqual []  = True 
> allEqual (x:xs) = all (== x) xs
 
(----Aufgabe 5----) 🟡

> gaps :: Double -> [Double] -> [(Double, Double)]
> gaps delta xs   
>    | length xs < 2 = []
>    | delta < abs (head xs - head (tail xs)) = (head xs, head (tail xs)): gaps delta (tail xs)
>    | otherwise = gaps delta (tail xs)

Die Fallunterscheidung für leere, einelementige und mehrelementige Listen geht etwas eleganter mit pattern matching, die Funktion tut aber das was sie soll.
    
(----Aufgabe 6----) 🟡

Gruppe I: (F g) h
1. f g h -> (f g) h     🗸
3. f g $ h -> (f g) h   🗸

Gruppe II: (λd. f g (h d))
2. f  g . h  -> (λ a b c d. a b (c d)) f g h -> (λb c d. f b (c d)) g h -> (c d. f g (c d)) h -> (λd. f g (h d))     🗸

Gruppe III: (λd. f ((g h) d))
4. f . g h -> (λa b c d. a ((b c) d)) f g h -> (λb c d. f ((b c) d)) g h -> (λc d. f ((e c) d)) h -> (λd . f ((g h) d))  🗸

Gruppe IV: (λd. f (g (h d)))
5. f . g . h -> (λa b c d. a (b (c d))) f g h -> (λb c d. f (b(c d))) g h -> (λc d. f (g (c d))) h ->(λd. f(g (h d))) 🗸

Gruppe V: f (g h)
6. f . g $ h -› (f . g) h -> (λa b c. a (b c)) f g h -> (λb c. f (b c) ) g h -> (λc. f (g c)) h -> f (g h)  🗸
7. f $ g  h -> f (g h)                                                                                      🗸
9. f $ g $ h -> (f (g h)) -> f (g h)                                                                        🗸

Gruppe VI: f (λg. g (h g))
8. f $ g . h -> f (g . h) -> f ((λa b c. a (b c)) g h) -> f ((λb c. g (b c)) h) -> f (λc. g (h c))

[JFM] Richtig, --8 steht alleine, aber der Ausdruck ist f (λd. g (h d))
[JFM] Daserste Vorkommen von g ist frei. 