{-
======================================================================
Belous
Übungsblatt 03
8/10, bestanden
======================================================================
Zum Format der Abgabe:
Bitte bearbeite zumindest textlastige Übungsblätter in einer .lhs Datei. 
Dort können die Antworten als unmarkierte Kommentarzeilen drinstehen. 
Die Idee ist nicht, dass eure Lösung am Ende als Ausgabe eures Codes dargestellt werden. Es geht darum,
dass Antworten und Programmcode gut lesbar in einer Datei zusammengefasst sind.

Aufgabe 1 🟡
Aufgabe 2 🔴
Aufgabe 3 🟡
Aufgabe 4 🟢
-}

fib' :: Integer -> Integer
fib' n = f n 0 1

f :: Integer -> Integer -> Integer -> Integer
f 0 x y = x
f n x y = f (n - 1) y (x + y)

fib :: Integer -> Integer
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

between :: Integer -> Integer -> Integer -> Bool
between a b c = (min a b) < c && c < (max a b)


fibu :: Integer -> String
fibu n 
    | n `mod` 3 == 0 && n `mod` 5 == 0 = "fizzbuzz"
    | n `mod` 3 == 0                    = "fizz"
    | n `mod` 5 == 0                    = "buzz"
    | otherwise                         = show n  

main :: IO ()
main = do
    putStrLn "(----Aufgabe 1----)"
    print $ fib 3
    putStrLn "Punkt 1"
    putStrLn "fib(3-1) + fib(3-2)"
    putStrLn "fib(2) + fib(1)"
    putStrLn "fib(2-2) + fib(2-1) + fib(1)"
    putStrLn "fib(0) + fib(1) + fib(1)"
    putStrLn "0 + fib(1) + fib(1)"
    putStrLn "0 + 1 + fib(1)"
    putStrLn "0 + 1 + 1"
    putStrLn "2"
    putStrLn "Punkt 2"

-- [JFM] Hier passieren mehrere Schritte auf einmal. Richtig wäre zum Beispiel:
--       fib (3-1) + fib (3-2) -> fib 2 + fib (3-2) -> fib 2 + fib 1
-- [JFM] Wichtig sind auch Leerzeichen:
--       fib(2) ist nicht das gleiche wie fib 2 oder fib (2)

    print $ fib' 5
    putStrLn "fib' = f (5) 0 1"
    putStrLn "f(5 - 1) 1 (0 + 1)"
    putStrLn "f(4) 1 1"
    putStrLn "f(4 - 1) 1 (1 + 1)"
    putStrLn "f(3) 1 2"
    putStrLn "f(3 - 1) 2 (1 + 2)"
    putStrLn "f(2) 2 3"
    putStrLn "f(2 - 1) 3 (2 + 3)"
    putStrLn "f(1) 3 5"
    putStrLn "f(0) 5 (5 + 3)"
    putStrLn "f(0) 5 8"
    putStrLn "=> Antwort - 5"
-- [JFM] Hier noch kurz Gedanken machen, welche Variante besser ist


    putStrLn "(----Aufgabe 2----)"
    putStrLn "x (lambda x. x y)"
    putStrLn "(lambda x. x y), x - g, y - f"

-- [JFM] Vorsicht bei der Notation, bei mehereren Vorkommen von Variablennamen kann das zuordnen schwierig werden.

    putStrLn "x (lambda x. x y), x - f"   -- was ist mit dem y?
    putStrLn "-----------------------"
    putStrLn "(lambda x. x y)"
    putStrLn "(lambda x. x y), x - g, y - f"
    putStrLn "-----------------------"
    putStrLn "(lambda x. y)"  -- falscher Ausdruck, es fehlt ein x hinten
    putStrLn "(lambda x. y) x, x - f, y - f"  -- jetzt richtiger Ausdruck, stimmt
    putStrLn "-----------------------"
    putStrLn "(lambda x. (lambda y. * x z) y) y"
    putStrLn "(lambda y. * x z) x - f, z - f"
    putStrLn "(lambda x. (lambda y. *  x z) y) x - g, y - g, z - f"
    putStrLn "(lambda x. (lambda y. * x z) y) y x - g, y - g, y - f"   
    putStrLn "-----------------------"
    putStrLn "(lambda x. x x)(lambda y. + y z)"
    putStrLn "(lambda x. x x), x - g"
    putStrLn "(lambda y. + y z), y - g , z - f"
    putStrLn "(lambda x. x x)(lambda y. + y z), x - g, y - g, z - f"
    putStrLn "-----------------------"
    putStrLn "(lambda x z. y (lambda x. x y) (lambda y. x y)))"
    putStrLn "(lambda x. x x), x - g"
    putStrLn "(lambda y. + y z), y - g , z - f"
    putStrLn "(lambda x. x x)(lambda y. + y z), x - g, y - g, z - f"
    putStrLn "(lambda x z. y (lambda x. x y) (lambda y. x y))), x - g, y - g, z - f"

-- [JFM] Was du bei den Ausdrücken 4,5,6 tuest, verstehe ich leider nicht. 
--       Die Aufgabe ist nicht die Reduktion der Ausdrücke)
--       Wenn du Teilausdrücke seperat betrachtest, ist das nicht richtig, da Variable in inneren Ausdrücken von äußeren Abstraktionen gebunden werden können. 
--       Lamdaausdrücke müssen immer als Gesamted betrachtet werden

    putStrLn "(----Aufgabe 3----)"
    putStrLn "(lambda x. x 3) (/ 9) -> (/ 9 3) -> 3"
    putStrLn "(lambda a b. b a) 7 (+ 1) -> (+ 1 7) -> 8"
    putStrLn "(lambda a b c. a (b c)) (+ 1) (lambda x. x) 7 ->  ( + 1 ((lambda x. x) 7)) -> (+ 1 7) -> 8"
    putStrLn "(lambda f x y. f y x) / 7 49 -> (/ 49 7) -> 7"

-- [JFM] Die Reduktionen sind prinzipiell richtig, aber pass auf immer *jeden* Schritt und die Art der Reduktion anzugeben


    putStrLn "(----Aufgabe 4----)"
    putStrLn "5 2 4"
    print $ between 5 2 4
    putStrLn "(- 5) 5 8"
    print $ between (- 5) 5 8
    putStrLn "additional test - 4 2 4"
    print $ between 4 2 4
    putStrLn "3"
    print $ fibu 3
    putStrLn "5"
    print $ fibu 5
    putStrLn "15"
    print $ fibu 15
    putStrLn "124" -- 124, denn 123 wird fizz sein
    print $ fibu 124
    putStrLn "(-1)"
    print $ fibu (-1)

    