import Data.Char(isUpper)

-- Break camel case from a String 
-- Example: "abcDef" = "abc Def"
breakCamelCase :: String -> String
breakCamelCase [] = []
breakCamelCase (x:xs) 
  | isUpper x = ' ' : x : breakCamelCase xs
  | otherwise = x : breakCamelCase xs
