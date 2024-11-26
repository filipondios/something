-- 135024    -> 304152
-- [0] = 1      [0] = 3
-- [1] = 3      [1] = 0 
-- [2] = 5      [2] = 4 
-- [3] = 0      [3] = 1 
-- [4] = 2      [4] = 5 
-- [5] = 4      [5] = 2
--
-- [0][1][2][3][4][5] -> [1][3][5][0][2][4]
--  1  3  5  0  2  4      3  0  4  1  5  2 
--


encrypt :: String -> Int -> String
encrypt xs n 
  | n <= 0 = xs
  | otherwise = 
    encrypt ([e | (e,i) <- xsi, odd i] ++ [e | (e,i) <- xsi, even i]) (n-1)
      where xsi = zip xs [0,1..]


intercalate :: (String, String) -> String
intercalate ([], ys) = ys
intercalate (xs, []) = xs
intercalate (x:xs, y:ys) = y : x : intercalate (xs, ys) 


decrypt' :: String -> Int -> Int -> String
decrypt' xs n splt 
 | n <= 0 = xs
 | otherwise = decrypt' (intercalate (splitAt splt xs)) (n-1) splt 


decrypt :: String -> Int -> String
decrypt xs n = decrypt' xs n (length xs `div` 2) 
