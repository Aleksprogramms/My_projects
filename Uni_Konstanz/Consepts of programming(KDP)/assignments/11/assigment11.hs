{-======================================================================
Belous
Übungsblatt 11
🟢🟢🟡🟢 10/10, bestanden
======================================================================-}
{-----(Aufgabe 1) 🟢-----}

-- Erreichbare Methoden

-- aus der Klasse Foo:

-- O f(S x, O y) (Java): f[String, Object]
-- S g(S x, Bar y) (Java) : g[String, Bar]

-- aus der Klasse Bar:

-- I f(S x, Foo y) (Java) : f[String, Foo]

-- O f(Bar x, Foo y) (Java) : f[Bar, Foo]
  
-- S f(O x, Bar y) (Java) : f[Object, Bar]
  
  

-- Anwendbare Methoden

-- aus der Klasse Foo:

-- O f(S x, O y) : f[String, Object]

-- aus der Klasse Bar:

-- I f(S x, Foo y) : f[String, Foo]
-- S f(O x, Bar y) : f[Object, Bar]


-- Spezifischste Methode

-- aus der Klasse Bar:

-- I f(S x, Foo y) : f[String, Foo]
-- S f(0 x, Bar y) : f[Object, Bar]

{-----(Aufgabe 2) 🟡-----}

-- 1

-- (\z x. (\x. x) z) x ALPHA ->
-- (\z s. (\x. x) z) x BETA ->
-- \x. (\x. x) x                 [JFM] Hier ist WHNF schon erreicht
-- BETA ->
-- \x. x
-- WHNF \x. x

-- 2
-- (\x y. x 3) (+ 4) (+ 6 7) BETA ->
-- \y. (+ 4) 3 BETA ->
-- (+ 4) 3 DELTA ->
-- WHNF 7                                 🗸

-- 3
-- (\x y. y x) (+ 6 7) (+ ((\x. x) 4)) BETA ->
-- (+ 4) (+ 6 7) DELTA ->
-- + 4 13 DELTA ->
-- WHNF 17                               🗸

-- 4
-- (\g x. (\f. x f) g) (\f. g f) ((\g h. f h g) (h f)) BETA ->
-- (λx. (λf. x f) (λf. g f)) ((λg h. f h g) (h f)) ALPHA->BETA->
-- λz. ((λg h. f h g) (h f)) z) (λf. g f) BETA -> 
-- ((λg h. f h g) (h f)) (λf. g f) ALPHA -> 
-- (λg r. f r g) (h f) (λf. g f) BETA -> 
-- (λr. f r (h f)) (λf. g f) BETA ->
-- f (λf. g f) (h f) 
-- WHNF f (λf. g f) (h f)                🗸


{-----(Aufgabe 3) 🟢-----}
data LExpr
  = Var String         
  | Lam String LExpr   
  | App LExpr LExpr    

lazy :: LExpr -> LExpr
lazy (Var x) = Var x
lazy (Lam x body) = Lam x body
lazy (App e1 e2) =
  case lazy e1 of
    Lam x body -> lazy (subst body x e2)
    e1' -> App e1' e2

subst :: LExpr -> String -> LExpr -> LExpr
subst (Var x) y e | x == y = e
                  | otherwise = Var x
subst (Lam x body) y e
  | x == y = Lam x body
  | otherwise = Lam x (subst body y e)
subst (App e1 e2) y e = App (subst e1 y e) (subst e2 y e)

{-----(Aufgabe 4) 🟢-----}

-- 1 
-- F = λx m. : m (x (+ m 1))    🗸

-- 2
-- Y F 3
-- -> (λf.(λx.f (x x)) (λx.f (x x))) (λy m. : m (y (+ m 1))) 3
-- -> (λx.(λy m. : m (y (+ m 1))) (x x)) (λx.(λy m. : m (y (+ m 1))) (x x)) 3
-- -> (λy m. : m (y (+ m 1))) ((λx.(λy m. : m (y (+ m 1))) (x x)) (λx.(λy m. : m (y (+ m 1))) (x x))) 3
-- -> (λm. : m (((λx.(λy m. : m (y (+ m 1))) (x x)) (λx.(λy m. : m (y (+ m 1))) (x x))) (+ m 1))) 3
-- -> : 3 (((λx.(λy m. : m (y (+ m 1))) (x x)) (λx.(λy m. : m (y (+ m 1))) (x x))) (+ m 1))

--[JFM] Korrekt
--[JFM] F muss nicht immer voll ausgeschrieben werden, nur wenn es ausgewertet werden soll reicht.
--      Das macht Ausdrücke kürzer und übersichtlicher. 