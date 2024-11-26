
isAscOrder :: [Int] -> Bool
isAscOrder [] = True
isAscOrder [x] = True
isAscOrder (x:y:xs) = x <= y && isAscOrder (y:xs)
