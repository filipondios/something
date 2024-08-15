import Data.Char (isLower, isLetter, isSpace)
import Data.List (dropWhileEnd)

-- Checks if a string is a question 
isQuestion :: String -> Bool 
isQuestion [] = False
isQuestion [x] = x == '?'  
isQuestion (x:xs) = isQuestion xs

-- Cheks if a String contains at least 
-- one letter character
containsLetters :: String -> Bool
containsLetters = any isLetter

-- Checks if all of the string chars 
-- are capital letters
isAllCapitals :: String -> Bool
isAllCapitals = not . any isLower

-- isBlankChar :: Char -> Bool 
-- isBlankChar xs = xs == ' ' || xs == '\n' || xs == '\r' || xs == '\t'

-- Checks if all the characters are spaces
-- or just a empty list
-- isSilence :: String -> Bool
-- isSilence xs = xs == ""
-- isSilence xs = null xs || all isBlankChar xs

-- Remove white spaces at the beggining
-- and at the end
trim :: String -> String
trim xs = dropWhile isSpace (dropWhileEnd isSpace xs)
-- trim = f . f
--   where f = reverse . dropWhile isSpace

-- What would Bob response?
responseFor :: String -> String
responseFor xs 
  | capitals && question = "Calm down, I know what I'm doing!"
  | question  = "Sure."
  | capitals  = "Whoa, chill out!"
  | silence   = "Fine. Be that way!" 
  | otherwise = "Whatever."
  where
    trimmed = trim xs
    question = isQuestion trimmed
    capitals = isAllCapitals trimmed && containsLetters trimmed
    silence = trimmed == ""
