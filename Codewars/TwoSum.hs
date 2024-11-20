import Data.List (find, findIndex)

findSum :: Int -> Int -> [Int] -> Maybe Int
findSum n r = findIndex (\e -> e + n == r) 

twoSum' :: [Int] -> Int -> Int -> (Int, Int)
twoSum' (x:xs) i res 
  | null (x:xs) = (maxBound :: Int, maxBound :: Int)
  | otherwise = 
    case findSum x res xs of
      Just fi -> (i, i+fi+1)
      Nothing -> twoSum' xs (i+1) res


twoSum :: [Int] -> Int -> (Int,Int)
twoSum xs = twoSum' xs 0 
