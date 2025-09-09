{- Lists:

  [] = empty list
  x : ls = list where `x` is first element, and `ls` is rest of the list
  3 : [] = list of one element [3]
  [1,5,6] list of three elements
          equivalent to `1:(5:(6:[]))`

  [E] is the *Type* of a list
      with elements of type `E`


You can try out Haskell expressions using the `ghci` interpreter.
If you run `ghci`


-}

-- Length of a list


len :: [a] -> Int -- The type. Can be inferred!
len ls =
  case ls of
    [] -> 0
    (x:rest) -> 1 + len rest

{- Concise syntax:

  len [] = 0
  len (x:ls) = 1 + len ls

-}

-- Append (concatenate) two lists
-- appnd :: [a] -> [a] -> [a]
appnd []     ys = ys
appnd (x:xs) ys = x : appnd xs ys

-- Haskell defines `appnd` for us already
-- and uses the notation `++` for it:
-- xs ++ ys == appnd xs ys

-- Quick Sort one-to-one from the slides of "Concepts of Programming".
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort (x:xs) = quicksort (filter (<x) xs) ++ [x] ++ quicksort (filter (>=x) xs)

fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)
-- Note:
-- The type (Eq a, Num a) => a -> a, which Haskell derives based on our definition
-- is too general, since it also allows floating point numbers for which
-- the factorial function is not defined.
-- This is easily fixed by providing an explicit type annotation as we did.

-- This should get your head spinning:
ones = 1 : ones
{- 
Haskell defines the function

  take :: Int -> [a] -> [a]

`take n ls` returns the first `n` elements of `ls`:
`take 2 [4,5,6] == [4,5]`.
-}

-- Now try `take 3 ones`...
-- ... the power of being lazy!


-- GHCi cheat sheet
-- :h gives you help
-- :l filename loads the file
-- :r loads the file after a change
-- :q get me out of here, I'm a student!
