
-- Add items from a list to another list without repeating
-- elements in the second list
noRepetition :: (Eq a) => [a] -> [a] -> [a]
noRepetition [] list = list
noRepetition (x:xs) list 
  | x `notElem` list = noRepetition xs (x:list) 
  | otherwise = noRepetition xs list

-- Generate a list of multiples of a number until a limit
genMultiplesList :: Integer -> Integer -> [Integer]
genMultiplesList 0 _ = []
genMultiplesList n limit = [ e | e <- [n..limit-1], (e `mod` n) == 0]

-- main
-- For all items in a list, take each value and find all the multiples of that
-- value that are less than the level number.
-- Combine the sets of numbers.
-- Remove any duplicates.
-- Calculate the sum of all the numbers that are left.
sumOfMultiples :: [Integer] -> Integer -> Integer
sumOfMultiples factors limit = sum (noRepetition multiplesRepList [])
  where 
    -- List of all multiples of each element (with repetition)
    multiplesRepList = [ e | f <- factors, e <- genMultiplesList f limit ]
