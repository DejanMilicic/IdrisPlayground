module IndexVector

import Data.Vect

ndx : (Fin 3) -- Bounded naturl number [0 .. n)
ndx = 2

v : Vect 3 Nat -- vector od 3 elements of Nat type (natural number, zero or greater)
v = [0,1,5]

el : Nat
el = index ndx v

el2 : Nat
el2 = index ndx [11, 22, 33]