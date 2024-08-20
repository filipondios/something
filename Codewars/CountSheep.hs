
countSheep :: [Bool] -> Int
countSheep = foldl (\x y->if y then x+1 else x) 0   
