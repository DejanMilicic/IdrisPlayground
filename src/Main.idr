module Main

import Data.Vect
import Data.Nat.Exponentiation

-- https://bmwant.github.io/idris-is-awesome.github.io/docs/basic.html

vzipWith : (a -> b -> c) ->
           Vect n a -> Vect n b -> Vect n c

average : Double -> Double -> Double

x : Int
x = 2
