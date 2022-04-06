filterFizzBuzz' : List Int -> List Int -> List Int
filterFizzBuzz' aux xxs with (id xxs)
  filterFizzBuzz' aux@_     _ | [] = aux
  filterFizzBuzz' aux@_ xxs@_ | (x::xs) =
    if (x `mod` 3 == 0) || (x `mod` 5 == 0)
      then x :: (filterFizzBuzz' aux xxs | xs)
      else       filterFizzBuzz' aux xxs | xs

filterFizzBuzz : List Int -> List Int
filterFizzBuzz = filterFizzBuzz' []

main : IO ()
main = putStrLn . show $ filterFizzBuzz [1..20]