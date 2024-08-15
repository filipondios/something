-- Creates a pair collection from two 
-- lists
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys 

-- Reverses a list
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse xs ++ [x]

-- Creates a new list given 
-- a parameter
repeat' :: a -> [a]
repeat' x = x : repeat x

-- Gets the tail of a list
tail' :: [a] -> [a]
tail' (x:xs) = xs

-- Gets the first element of 
-- a list
head' :: [a] -> a 
head' (x:xs) = x

-- Takes 'n' elements from a list,
-- forming a new list
take' :: Int -> [a] -> [a]
take' 0 _ = []
take' 1 (x:xs) = [x]
take' _ [x] = [x]
take' n (x:xs) = if n >= length (x:xs)
  then x:xs
  else x : take' (n-1) (tail' xs)

-- Checks if all elements of a list 
-- meet one condition
all' :: (a -> Bool) -> [a] -> Bool
all' _ [] = True
all' f (x:xs) = f x && all' f xs

-- Checks if a element is in a list
elem' :: (Eq a) => a -> [a] -> Bool
elem' e [] = False
elem' e [x] = e == x
elem' e (x:xs) 
  | e == x = True
  | otherwise = elem' e xs

-- Literally quickSort
quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort smallerOrEqual ++ [x] ++ quickSort larger
  where
    smallerOrEqual = [e | e <- xs, e <= x]
    larger = [e | e <- xs, e > x]

-- Litterally the factorial
factorial :: Int -> Int
factorial 0 = 1 
factorial n = n * factorial (n-1)

-- Fibonacci 
fibonnacci :: Int -> Int
fibonnacci 0 = 0
fibonnacci 1 = 1
fibonnacci x = fibonnacci (x-1) + fibonnacci (x-2)

-- List length
length' :: [a] -> Int
length' [] = 0
length' (_:xs) = 1 + length' xs 

-- List element sum 
sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' [x] = x -- opt
sum' (x:xs) = x + sum' xs

-- List concatenation 
concat' :: [a] -> [a] -> [a]
concat' [] x = x -- used by the fn
concat' x [] = x
concat' (x:xs) y = x : concat' xs y

-- List maximum
maximum' :: (Ord a) => [a] -> a 
maximum' [x] = x
maximum' (x:xs) = maximum'' xs x 
  where 
    maximum'' [x] e = max x e
    maximum'' (x:xs) e = if x > e then 
      maximum'' xs x 
    else 
      maximum'' xs e

-- Filtrar una lista 
filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
-- filter' f xs = [e | e <- xs, f e]
filter' f (x:xs) 
  | f x = x : filter' f xs 
  | otherwise = filter' f xs

-- Eliminar n elementos de una lista 
drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' _ [] = []
drop' n (_:xs) = drop' (n-1) xs

-- Mapear una funcion 
map' :: (a -> b) -> [a] -> [b]
-- map' f xs = [f e | e <- xs]
map' f (x:xs) = f x : map' f xs
