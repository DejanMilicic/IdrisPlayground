||| Show sum of the numbers from input
module NumbersSum

import Data.String

sumNums : List (Maybe Integer) -> Maybe Integer
sumNums [] = Just 0
sumNums (x :: xs) = case (x, sumNums xs) of
                      (Just num1, Just num2) => Just(num1 + num2)
                      (_, _) => Nothing
main : IO ()
main = do
  putStr "Enter numbers separated by a space: "
  x <- getLine
  case sumNums (map parseInteger (words x)) of
    Just sum => putStrLn ("Sum is " ++ show sum)
    Nothing => putStrLn "Invalid input"