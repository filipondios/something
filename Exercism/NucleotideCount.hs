import Data.Map (Map)
import qualified Data.Map as Map
import Data.Maybe(fromMaybe)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show)

nucleotideCounts' :: String -> Either String (Map Nucleotide Int) -> Either String (Map Nucleotide Int)
nucleotideCounts' [] nucMap = nucMap
nucleotideCounts' (x:xs) eitherMap = 
  case eitherMap of
  (Left err) -> Left err
  (Right nucMap) -> case x of 
    'A' -> nucleotideCounts' xs (Right (Map.insert A countA nucMap))
    'C' -> nucleotideCounts' xs (Right (Map.insert C countC nucMap))
    'G' -> nucleotideCounts' xs (Right (Map.insert G countG nucMap))
    'T' -> nucleotideCounts' xs (Right (Map.insert T countT nucMap))
    _ -> Left "error"
    where 
      countA = fromMaybe 0 (Map.lookup A nucMap) + 1
      countC = fromMaybe 0 (Map.lookup C nucMap) + 1
      countG = fromMaybe 0 (Map.lookup G nucMap) + 1
      countT = fromMaybe 0 (Map.lookup T nucMap) + 1

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs = nucleotideCounts' xs (Right Map.empty)
