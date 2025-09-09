---
title: Programming 3
subtitle: (Wintersemester 2024/25)
author: TT-Prof. Dr. Emanuele D'Osualdo
institute: Universität Konstanz
date: 04 November 2024

---

Recap
=====

There is a correspondence between Types and Sets

  * `⟦Integer⟧  = ℤ`
  * `⟦ A -> B ⟧ = functions from ⟦A⟧ to ⟦B⟧`

Haskell expressions have a type and a semantics:

  * they denote elements of their type
  * `⟦4+1 :: Integer⟧ = 5 (∈ ℤ) `
  * `⟦(\x->x)::Integer -> Integer⟧ = identity function on ℤ`

Haskell expressions also have an operational semantics:

    (\x->e1) e2  ~~>  e1[ e2 / x ]    (e1 with x substituted with e2)

Example:

    (\x->x+1) 4  ~~>  4+1

Haskell has a bunch of primitive operations like `+` so we also have
special reductions for them:

    (\x->x+1) 4  ~~>  4+1  ~~>  5

Values are the expressions that do not reduce further:

  * `4+1` is not a value
  * `5` is a value
  * `(\x->x+1)` ?
    >! bla

When we type an expression in `ghci`, it reduces it until it reaches a value
(if ever) and prints it.

Since Haskell functions denote *partial* functions, they might never return
in which case we write `⊥` as the meaning of it (e.g. `f 0 = ⊥`).
More generally, `⊥` is a possible result at every type.
  

Built-ins
---------

Haskell has a bunch of predefined values.

For example `False` and `True` are the only two values of type `Bool`.
We can check that on `ghci`:

    ghci> False
    False
    ghci> :t False
    False :: Bool
    ghci> :t True
    True :: Bool
    ghci> :i Bool
    type Bool :: *
    data Bool = False | True
          -- Defined in ‘GHC.Types’
    ...


We will parse that better in a minute.

An interesting thing: even `Bool` is *defined* in Haskell!
The built-in types are defined in the [`Prelude`][prelude] module,
which is included by default.

For example `&&` (logical AND) is defined!
We can inspect its source code [here][and-src]

Haskell notation allows for two ways of applying a function with two arguments:

~~~~~~~~~~~~~~~~~~~~ haskell
fun x y     -- prefix
x `fun` y   -- infix
~~~~~~~~~~~~~~~~~~~~

For functions with "symbol" names like `&&` the two forms are:

~~~~~~~~~~~~~~~~~~~~ haskell
x && y    -- infix (default!)
(&&) x y  -- prefix
~~~~~~~~~~~~~~~~~~~~

So to refer to a function with a symbolic name you need to use the prefix form:

    ghci> :t (&&)
    (&&) :: Bool -> Bool -> Bool

You can define your own infix operators, but not now ;)

[prelude]: https://hackage.haskell.org/package/base-4.20.0.1/docs/Prelude.html
           "The Haskell Prelude Documentation"
[and-src]: https://hackage.haskell.org/package/ghc-prim-0.11.0/docs/src/GHC.Classes.html#%26%26


Currying
--------

Wait a minute, the docs say `(&&)` has type

    (&&) :: Bool -> (Bool -> Bool)

but you may have expected

    (&&) :: (Bool, Bool) -> Bool

for a function with two arguments...
That would work as well, but is not idiomatic.

In Haskell you use *currying*.
A function of two arguments has type `twoarg :: a -> b -> c`.
But we learned that the type of a function is `a -> b` so what is going on
with the two arrows?
The type `twoarg :: a -> b -> c` is in fact just omitting parenthesis!
It is equivalent to

    twoarg :: a -> (b -> c)

which says:

- `twoarg` is a function
- it takes an argument of type `a`
- it returns a function which:
    * takes an argument of type `b`
    * and returns a value of type `c`

(here `a`, `b` and `c` are just placeholders for types of your choice)

How do we return a function? We can use lambdas `(\y->...)`!

So in Haskell the three definitions below are equivalent:

~~~~~~~~~~~~~~~~~~~~ haskell
twoarg :: a -> (b -> c)
twoarg = \x -> (\y -> body)
twoarg x = (\y -> body)
twoarg x y = body
~~~~~~~~~~~~~~~~~~~~

Example:

> plus :: Integer -> Integer -> Integer
> plus x y = x + y
> -- Equivalent to:
> -- plus = \x -> (\y -> x+y)
> 
> succ = plus 1    -- same as `\y -> 1+y`

The way we defined `succ` is by *partially applying* `plus` to only its first
argument. The result is a function of one argument:

    ghci> :t plus 1
    plus 1 :: Integer -> Integer

We'll use this trick often later.


Polymorphism
------------

Haskell's type system is much more powerful than what we discussed so far.
We will look into it more closely later, but here's a bit of info
so you can understand `ghci`'s behaviour.

    ghci> :t 42
    42 :: Num a => a

Ok, what was that? We expected `Integer`...

    ghci> :i Num
    type Num :: * -> Constraint
    class Num a where
      (+) :: a -> a -> a
      (-) :: a -> a -> a
      (*) :: a -> a -> a
      negate :: a -> a
      abs :: a -> a
      signum :: a -> a
      fromInteger :: Integer -> a
    ...
    instance Num Double -- Defined in ‘GHC.Float’
    ...
    instance Num Integer -- Defined in ‘GHC.Num’

Ok, so `Num` is a "typeclass": a constraint on types.

A type `a` that satisfies `Num a` will have a function `(+) :: a -> a -> a` defined for it (and all the other listed there).

The type

    42 :: Num a => a

means `42` can have type `a` for any choice of `a` that satisfies `Num a`.

We can check that `Integer` is a fine choice for `a`:

    instance Num Integer -- Defined in ‘GHC.Num’

The Prelude defined how to interpret the functions of `Num` on `Integer` for us.

What's cool about `42 :: Num a => a` is that we can use `42` and interpret it in
many different ways depending on context:

    x :: Double
    x = 42   --- here a = Double


You can explicitly specify the type of an expression:

    ghci> 42 :: Integer
    ghci> :t 42 :: Integer

The expression `42 :: Integer` is therefore of type `Integer`, and no longer of any numeric type.

Caution: We can do less with `Integer`:

    ghci> 42 / 7
    ghci> (42 :: Integer) / 7

Why is that?









    ghci> :t 42 / 7
    42 / 7 :: Fractional a => a

We now get a `Fractional` constraint instead of `Num`.

    ghci> :i Num
    class Num a where
      (+) :: a -> a -> a
      (-) :: a -> a -> a
      (*) :: a -> a -> a
      negate :: a -> a
      abs :: a -> a
      signum :: a -> a
      fromInteger :: Integer -> a
    [...]

    ghci> :i Fractional
    class Num a => Fractional a where
      (/) :: a -> a -> a
      recip :: a -> a
      fromRational :: Rational -> a
            -- Defined in `GHC.Real'
    instance Fractional Float -- Defined in `GHC.Float'
    instance Fractional Double -- Defined in `GHC.Float'

The division `/` works with `Float` but not with `Integer`!

    ghci> (42 :: Float) / 7


Definitions
-----------

Let us look into how to define things.
This is the main tool to do anything in Haskell!

Top-level basic definitions

~~~~~~~~~~~~~~~~~~~~ haskell
x :: type  -- optional
x = expr
~~~~~~~~~~~~~~~~~~~~


What if we want to define a function, say `Integer -> Integer`?
Easy:

~~~~~~~~~~~~~~~~~~~~ haskell
incr :: Integer -> Integer
incr = \x->(x+1)
~~~~~~~~~~~~~~~~~~~~

We have syntactic sugar for this:

~~~~~~~~~~~~~~~~~~~~ haskell
incr x = x+1
~~~~~~~~~~~~~~~~~~~~

And it extends to multiple arguments:

~~~~~~~~~~~~~~~~~~~~ haskell
plus :: Integer -> Integer -> Integer
plus x y = x + y
-- plus = \x -> \y -> (x + y)
~~~~~~~~~~~~~~~~~~~~

You can also introduce definitions locally with `let`:

~~~~~~~~~~~~~~~~~~~~ haskell
f x = let one = 1 in x + one
~~~~~~~~~~~~~~~~~~~~

or with the more idiomatic `where`:

~~~~~~~~~~~~~~~~~~~~ haskell
f x = x + two - one
  where
    one = 1
    two = one + one
~~~~~~~~~~~~~~~~~~~~

 > Be careful: indentation is meaningful!
 > It determines the scope of definitions.


You can use all of these in `ghci` but be careful with "shadowing":

    ghci> x = 0
    ghci> x = 1

This should really *not* be thougth of as an assignment!
It is two, *separate*, definitions for `x`, the second one "shadows" the first,
i.e. it makes it completely obsolete.

What about

    ghci> x = 0
    ghci> x = x + 1

Didn't we say Haskell does not mutate variables?
In fact it doesn't!

    ghci > x
    ^CInterrupted. -- I had to press ctrl+C to terminate evaluation

The above example loops because the first definition

Pattern-matching
----------------

In some examples we already saw that we can define functions by "cases":

> -- compute \sum_{i=0}^n i
> sumUntil :: Integer -> Integer
> sumUntil 0 = 0
> sumUntil n = n + sumUntil (n-1)

How does this work?

Haskell allows multiple "definition equations" for the same symbol.
The first that "matches" and invocation will apply:

> bogus True  = 0
> bogus True  = 1
> bogus False = 2

would always give us `0` if we call `bogus True`.

In fact `ghc` is smart enough to notice it and it complains about it:

    pk3-03.lhs:363:3: warning: [-Woverlapping-patterns]
        Pattern match is redundant
        In an equation for ‘bogus’: bogus True = ...
        |
    363 | > bogus True  = 1
        |   ^^^^^^^^^^^^^^^

More generally Haskell has a `case` construct, think of it as an `if` on steroids:

    case exp of
      pattern1 -> exp1
      pattern2 -> exp2
      ...

For example

> choose :: Bool -> Integer
> choose x =
>   case x of
>     True  -> 42
>     False -> 0

In general you can use patterns: special expressions with free variables.
Basic patterns for now:

 - A constant like `0` is a pattern that only matches that constant.
 - A variable like `x` is a pattern that matches any value and will bind `x`
to that value.

Haskell processes the cases of a `case` expression in order, and continue
with the *first* case that matches the pattern, *ignoring the rest*.

We'll talk more about pattern matching in the next lectures.

Now we can understand the meaning of our `sumUntil` definition:

~~~~~~~~~~~~~~~~~~~~ haskell
sumUntil =
  \m ->        -- takes an argument
    case m of  -- does case analysis on it
      0 -> 0   -- if it matches 0 return 0
      n ->     -- if it did not match 0 but matches n (which it will always do)
        n + sumUntil (n-1) -- then continue with the recursive call
~~~~~~~~~~~~~~~~~~~~

Non-exhaustive patterns
-----------------------

Consider the following definition:

> wat :: Integer -> Integer
> wat x =
>   case x of
>     0 -> 42
>     1 -> 0

What does `wat` do? It matches its argument against the first pattern,
if it matches it continues with the corresponding expression,
otherwise it tries to match the next pattern.
So:

    ghci> wat 0
    42
    ghci> wat 1
    0

Ok but there are many more cases of `Integer` than just `0` or `1`...

    ghci> wat 2
    *** Exception: pk3-03.lhs:(381,5)-(383,12): Non-exhaustive patterns in case

Ok, this is interesting.
As we remarked before, Haskell functions denote *partial* functions,
that is, they can be undefined on some inputs.
There are two ways in which this can happen:

1. The function enters an infinite loop
2. The function does not cover a case

(There's a third option which we will discuss next time)

The first way causes the interpreter to compute forever,
leaving us wondering if it is just taking ages or actually diverging.

The second way causes the interpreter to hit a brick wall:
there is no way to meaningfully reduce further but we do not have a value.
In this case the interpreter throws an exception like what happened with `wat 2`.

Note that these are *not* like the exceptions you find in other languages like
C++, Java or Python: Haskell's exceptions **cannot be caught/handled**.
This is because they **simply should never happen** and are just a mechanism
to signal something is wrong when testing partially written programs.
As such, they are an *antipattern*.

::: IMPORTANT ::::::
Ideally, all your programs should **always terminate and without exceptions.**
(That is, they denote *total* functions!)
::::::::::::::::::::


Types a la carte
----------------

You might ask:

  > Ok so if we cannot throw exceptions,
  > what is the appropriate Haskell way
  > of signaling to the caller
  > that there is a problem with the input?

Good question.
The basic idea is similar to what is used in other languages
that do not have exceptions, like C:
let the return value be some special value that means "error".
In C you would adopt a convention where `NULL` (i.e. the constant `0`)
is returned when no meaningful result can be computed;
hopefully, the caller might know this is a possibility and will check
whether the result is `NULL` to handle failures.
(In Java you might use `null`, in Python `None`).

The C approach has two terrible downsides:

- What if 0 is also a valid return value?
  How do we distinguish 0 as the result of successful execution vs 0 as `NULL`?
- What if the caller forgets that the function might fail
  and leave the failure unhandled?

In Haskell such situation should be avoided at all costs.

Imagine we want to turn `wat` into a respectable total function.
What we want is to return a special value if the input is not in `{0,1}`
that signals that no result was meaningful.
What we need is to change the type of `wat`
to `Integer -> MaybeInt` where the type `MaybeInt` should
contain all the integers but also a new `NoInt` value.

Algebraic Data Types are Haskell's way of introducing new custom types.
We start from the basics and then construct our new `MaybeInt` type.

Algebraic Data Types
--------------------

As we mentioned, `Bool` is a *defined* type in Haskell.
Its definition is:

~~~~~~~~~~~~~~~~~~~~ haskell
data Bool = False | True
~~~~~~~~~~~~~~~~~~~~

This is a very important construct of Haskell:
`data` definitions is how Haskell allows you to define new data structures.

The simple declaration above introduces three things:

1. A new type of name `Bool`
2. A new value `False :: Bool`
3. A new value `True :: Bool`

Moreover, as `Bool` is entirely defined by this declaration,
it contains no other values than `False` and `True`.

In a new data type you can introduce any number of new values:

    data TypeName = Value1 | Value2 | ... | ValueN

The only restriction is that the new type name and
these new values need to start with a *capital letter*
(to distinguish them from type variables and variables).
The new values are called *constructors*.

This simple kind of data declaration is analogous to creating "Enums" in other
languages.

Now one can use these new values as patterns.
For example, the definition of the logical AND operator
`(&&) :: Bool -> Bool -> Bool` from the `Prelude` looks like this:

    False && b = False
    True  && b = b

which is interpreted as:

    (&&) =
      \x ->
      \y ->
        case x of
            False -> False
            True  -> y

Ok, but pretty boring.
We can do more interesting stuff:
constructors can take arguments!

> data Person = Person String Integer

Let's unpack that; we just defined:

* A new type name `Person`
* A new constructor `Person` that takes two arguments:
    - a `String` (which we interpret as the name of the person)
    - an `Integer` (which we interpret as the age of the person)

First thing to note: we can reuse the same name for types and for constructors.
This is usually unambiguous but can sometimes lead to confusion.
Whenever we are looking at a type, `Person` is the type,
when we are looking at expressions `Person` is the constructor that
constructs a value of type `Person` if given a `String` and an `Integer`.

I am calling the `String` and `Integer` the *arguments* of the constructor
`Person` on purpose: `Person` is really typed as a function!

    ghci> :t Person
    Person :: String -> Integer -> Person

in the expression `(Person :: String -> Integer -> Person)`,
the first occurrence of `Person` is a value, the second occurrence is a type.

The way you should think of these constructors that take arguments is
as an *uninterpreted function* (as they are defined in formal logic).
An uninterpreted function is just a symbol that is used as a function
but is not associated with any particular definition.

In Haskell, constructors are like uninterpreted function in the same sense:
they are not defined as some other expression, they just "are".
This means they cannot be further reduced, which means that they are values.
In particular, a constructor applied to values of the appropriate types
is itself a value.

Let's put that to the test. If we ask `ghci` to evaluate `Person "Alice" 35`,
since it is a value, it should just return `Person "Alice" 35`:

    ghci > Person "Alice" 35

    <interactive>:20:1: error:
        • No instance for (Show Person) arising from a use of ‘print’
        • In a stmt of an interactive GHCi command: print it

Well...that did not go very well, did it!
But the error is actually telling us what is happening:
`ghci` does not know how to "print" the value.
This is because to print something it needs to first be transformed into a string.
In Haskell --- and this should not surprise you by now --- every type that
can be transformed into a string is a member of the `Show` typeclass.

    ghci > :i Show
    type Show :: * -> Constraint
    class Show a where
      show :: a -> String
    ...
    instance Show Bool -- Defined in ‘GHC.Show’
    instance Show Integer -- Defined in ‘GHC.Show’
    ...

The `show` function describes what is the appropriate string representation
for the type `a`.
Many instances for the built-in types are already defined by the `Prelude`,
but `Person` is our custom type, so we'd need to define how `show` is defined
for it.
Luckily, Haskell has a way to derive the obvious definition when the type is
simple enough:

>   deriving (Show) -- this is attached to the previous `data` definition

::: NOTE ::::::::
You may wonder what kind of degenerate type cannot be represented as a string.
Well, first the idea is that the string should really be valid Haskell,
not just anything like `show x = "whatevs"`.
A simple type that does not have a meaningful representation is function types:

    ghci > :t wat
    wat :: Integer -> Integer
    ghci > wat

    <interactive>:28:1: error:
        • No instance for (Show (Integer -> Integer))
            arising from a use of ‘print’
            (maybe you haven't applied a function to enough arguments?)
        • In a stmt of an interactive GHCi command: print it

Indeed Haskell is a compiled language, and the compiled code would not
keep a copy of the original Haskell definitions of functions,
so they are not available at runtime for printing.
:::::::::::::::::

Ok, enough with that, let's try again:

    ghci > Person "Alice" 35
    Person "Alice" 35

Success!

Ok we can pack a name and an age into a single value of type `Person` by
using the `Person` constructor. Neat.
But how would we extract the name/age information from an arbitrary value
of type `Person`?

> name (Person n a) = n
> age  (Person n a) = a

You guessed it: pattern matching!
Patterns can be terms constructed from variables and constructor applications:

> fiveyo :: Person -> Bool
> fiveyo (Person n 5) = True
> fiveyo p            = False

The function `fiveyo` returns `True` if the person's age is `5` and `False` otherwise.
(We could also have defined it as `fiveyo p = name p == 5`).

This pattern

    data TypeName = TypeName FieldType1 FieldType2 ... FieldTypeN
    field_i (TypeName f_1 ... f_n) = f_i

is the Haskell way of representing "Records" or "Structs".
(There is even dedicated syntactic sugar for it, but we won't discuss it here.)

One cool thing about this approach is that the type is actually able
to make a difference between records that have fields with the same types.
For example, we could want to represent a "car" by storing its model and price.

> data Car = Car String Integer

If we represented both `Person` and `Car` as simply "pairs of strings and integers" (e.g. `(String, Integer)`),
we would not be able to know if a pair represented a car or a person.

Now to a more general construction: we can add as many constructors to a type
as we want, each with their arguments!
This allows us to finally give an answer to the question of how to represent failure with a `MaybeInt` type:

> data MaybeInt = NoInt | SomeInt Integer
>   deriving (Show)

What this does is:

- Defines a new type `MaybeInt`
- Defines two new constructors of values in `MaybeInt`:
    * `NoInt :: MaybeInt`
    * `SomeInt :: Integer -> MaybeInt`

This way, if we want to signal failure we can return `NoInt`,
and if we successfully computed `n :: Integer` we can return `SomeInt n`:

> wat' :: Integer -> MaybeInt
> wat' x =
>   case x of
>     0 -> SomeInt 42
>     1 -> SomeInt 0
>     n -> NoInt

Now if we want to consume the result of `wat` then we can use pattern matching
to understand if the computation was successful:

> dewat :: Integer -> String
> dewat x =
>   let res = wat' x
>    in case res of
>         SomeInt n -> "Success!"
>         NoInt     -> "Failure :("

Note how in this pattern you can think of a constructor as a "tag" marking
some payload data.


The delights of data declarations do not stop here, however!
Types can be recursive!

> data ListOfInt = Nil | Cons Integer ListOfInt
>   deriving (Show)

The `ListOfInt` type includes two constructors:

- `Nil :: ListOfInt` representing an empty list
- `Cons :: Integer -> ListOfInt -> ListOfInt` that takes
    * the first integer in the list
    * and the rest of the list
    * and returns a list

Note that we are using the type `ListOfInt` in its own definition (-> recursion).

So the list containing `1,3,5` would be represented as

~~~~~~~~~~~~~~~~~~~~ haskell
Cons 1 (Cons 3 (Cons 5 Nil))
~~~~~~~~~~~~~~~~~~~~

Let's break it down:

~~~~~~~~~~~~~~~~~~~~ haskell
let lst0 :: ListOfInt = Nil         -- empty list
    lst1 :: ListOfInt = Cons 5 lst0 -- 5
    lst2 :: ListOfInt = Cons 3 lst1 -- 3,5
    lst3 :: ListOfInt = Cons 1 lst2 -- 3,5
in lst3
~~~~~~~~~~~~~~~~~~~~

The list is represented as nested applications of
the uninterpreted function `Cons`.

Then we can pattern match on a list by doing case analysis:
either a list is empty, or it has a first element and a rest of the list.

For example, let's write a function `firstInt` that extracts the first element
of a list of integers.
We could start with

    firstInt (Cons n rest) = n

but we immediately notice we are missing a case for the `Nil` case.
This function cannot return anything meaningful on the empty list,
so we should return a `MaybeInt` instead of an `Integer`:

> firstInt :: ListOfInt -> MaybeInt
> firstInt Nil           = NoInt
> firstInt (Cons n rest) = SomeInt n

