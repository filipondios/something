
isOrthogonal :: [Int] -> [Int] -> Bool
isOrthogonal xs ys = sum (zipWith (*) xs ys) == 0
