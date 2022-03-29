||| Show length of the input string
module StrLen

main : IO ()
main = do
  putStr "Enter a string: "
  x <- getLine
  putStrLn ("Length is " ++ show (length x))