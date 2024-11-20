import Data.List(sortBy)


solve :: String -> Int
solve xs = length consonants 
  where
    consonants = sortBy (flip compare) [e | e <- xs, e `notElem` "aeiou"]
