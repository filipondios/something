import Data.Char (toLower)

isVowel :: Char -> Bool 
isVowel c = 
  case cl of
    'a' -> True
    'e' -> True
    'i' -> True 
    'o' -> True
    'u' -> True
    _ -> False
    where cl = toLower c


disemvowel' :: String -> String -> String
disemvowel' [] _ = []
disemvowel' (x:xs) acc 
  | isVowel x = disemvowel xs
  | otherwise = x : disemvowel xs


disemvowel :: String -> String
disemvowel [] = []
disemvowel xs = disemvowel' xs [] 
