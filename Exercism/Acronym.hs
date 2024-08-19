import Data.Char (toUpper, isUpper)

-- Is a char a delimiter? Meaning that the next character can be a 
-- the beggining of a word.
isDelimiter :: Char -> Bool 
isDelimiter x = 
  case x of 
    ' ' -> True
    '-' -> True
    '_' -> True
    _ -> False 

-- As first parameter, takes a String to analyze.
-- The second parameter is the previous character
abbreviate':: String -> Char -> String
abbreviate' [] _ = []
abbreviate' (x:xs) prevChar
  | isDelimiter x = abbreviate' xs x
  | isDelimiter prevChar = toUpper x : abbreviate' xs x
  | isUpper prevChar = abbreviate' xs x
  | isUpper x = x : abbreviate' xs x
  | otherwise = abbreviate' xs x
  

abbreviate :: String -> String
abbreviate xs = abbreviate' xs ' '
