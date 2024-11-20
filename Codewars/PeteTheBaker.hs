import Data.List (find)
type Ingredient = String
type Amount     = Int
type Recipe     = [(Ingredient, Amount)]
type Storage    = [(Ingredient, Amount)]


findInStorage :: (Ingredient, Amount) -> Storage -> Int
findInStorage (name, amount) (x:xs) 
  | null (x:xs) = 0  
  | itName == name = itAmount `div` amount
  | otherwise = findInStorage (name, amount) xs
  where
    (itName, itAmount) = x


cakes :: Recipe -> Storage -> Int
cakes recipe storage = 
  foldr (min . (`findInStorage` storage)) (maxBound :: Int) recipe
