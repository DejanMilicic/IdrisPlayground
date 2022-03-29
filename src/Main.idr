module Main

import Data.Vect
import Data.Nat.Exponentiation

-- https://bmwant.github.io/idris-is-awesome.github.io/docs/basic.html

vzipWith : (a -> b -> c) ->
           Vect n a -> Vect n b -> Vect n c

----

data BinChar : Char -> Type where
  O : BinChar '0'
  I : BinChar '1'

data Every : (a -> Type) -> List a -> Type where
  Nil : {P : a -> Type} -> Every P []
  (::) : {P : a -> Type} -> P x -> Every P xs -> Every P (x :: xs)
  
fromBinChars : Every BinChar xs -> Nat -> Nat
fromBinChars [] _ = 0
fromBinChars (_ :: ys) Z = 1 
fromBinChars (O :: ys) (S k) = fromBinChars ys k
fromBinChars (I :: ys) (S k) = lpow 2 k + fromBinChars ys k

b : (s : String) -> {auto p : Every BinChar (unpack s)} -> Nat
b {p} s = fromBinChars p (length s) 

-----

average : Double -> Double -> Double

x : Int
x = 2




