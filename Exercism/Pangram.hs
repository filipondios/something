import Data.Char (toLower)

isPangram :: String -> Bool
isPangram text = 
  (length [ c | c <- chars, c `elem` map toLower text]) == length chars
  where chars = ['a'..'z']
