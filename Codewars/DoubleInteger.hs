
doubleInteger :: Num a => a -> a
doubleInteger = (*) 2

addOrEven :: [Integer] -> String
addOrEven xs = 
  case sum xs `mod` 2 of
    0 -> "even"
    _ -> "odd"
