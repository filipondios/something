import Text.XHtml (content)
-- Day 5: Doesn't He Have Intern-Elves For This? ---

{- Santa needs help figuring out which strings in his text file are naughty 
 - or nice. 
 -
 - A nice string is one with all of the following properties:
 -
 -    It contains at least three vowels (aeiou only), like aei, `xazegov`, or
 -    `aeiouaeiouaeiou`. 
 -  
 -    It contains at least one letter that appears twice in a row, like `xx`, 
 -    `abcdde` (dd), or `aabbccdd` (aa, bb, cc, or dd). 
 -
 -    It does not contain the strings ab, cd, pq, or xy, even if they are part 
 -    of one of the other requirements. 
 -
 - For example:
 -
 - `ugknbfddgicrmopn` is nice because it has at least three vowels 
 - (u...i...o...), a double letter (...dd...), and none of the disallowed 
 - substrings.
 -
 - `aaa` is nice because it has at least three vowels and a double letter, 
 - even though the letters used by different rules overlap.
 -
 - `jchzalrnumimnmhp` is naughty because it has no double letter. 
 - `haegwjzuvuyypxyu` is naughty because it contains the string xy. 
 - `dvszwmarrgswjxmb` is naughty because it contains only one vowel. -}


isVowel :: Char -> Bool 
-- isVowel c = c `elem` "aeiou" 
isVowel c 
  | c == 'a' ||  c == 'e' || c == 'i' || c == 'o' || c == 'u' = True
  | otherwise = False


isForbiden :: String -> Bool 
isForbiden xs 
  | xs == "ab" || xs == "cd" || xs == "pq" || xs == "xy" = True
  | otherwise = False


isNice' :: [Char] -> Char -> Bool -> String -> Bool 
-- Check if there were at least 3 vowels and 2 repeated chars
isNice' vowels _ repChars [] = repChars && length vowels >= 3
-- Just a normal iteration
isNice' vowels lastChar repChars (x:xs) 
  | isForbiden [lastChar, x] = False
  | otherwise = isNice' vowels' x repChars' xs
  where
    repChars' = repChars || lastChar == x
    vowels'  = if isVowel x then x:vowels else vowels


isNice :: String -> Bool 
isNice = isNice' [] '-' False


howManyAreNice :: [String] -> Int
howManyAreNice = foldl (\sum element-> if isNice element then sum + 1 else sum) 0


main :: IO ()
main = do 
  let filePath = "./Day5.input"
  content <- readFile filePath
  let linesOfContent = lines content
  print $ howManyAreNice linesOfContent
  
