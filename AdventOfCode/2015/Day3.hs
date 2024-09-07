import Data.Set(Set)
import qualified Data.Set as Set

--- Day 3: Perfectly Spherical Houses in a Vacuum ---

{- Santa is delivering presents to an infinite two-dimensional grid of houses.
 - 
 - He begins by delivering a present to the house at his starting location, 
 - and then an elf at the North Pole calls him via radio and tells him where
 - to move next. Moves are always exactly one house to the north (^), south (v),
 - east (>), or west (<). After each move, he delivers another present to 
 - the house at his new location.
 -
 - However, the elf back at the north pole has had a little too much eggnog,
 - and so his directions are a little off, and Santa ends up visiting some 
 - houses more than once. How many houses receive at least one present? 
 -
 - For example:
 -    
 -    > delivers presents to 2 houses: one at the starting location, and one 
 -    to the east. 
 -
 -    ^>v< delivers presents to 4 houses in a square, including twice to the
 -    house at his starting/ending location. 
 -
 -    ^v^v^v^v^v delivers a bunch of presents to some very lucky children at 
 -    only 2 houses. -}


type House = (Int, Int) -- We only need a house's coordinates 


-- iterateHouses' will receive a string full of directions, and the actual 
-- coordinate (house) where we are delivering a present. The approach will be 
-- to store in a set (a unique element collection) all the visited houses (so 
-- we wont store duplicates).
iterateHouses' :: String -> House -> Set House -> Set House
iterateHouses' [] _ visitedHouses = visitedHouses
iterateHouses' (x:xs) house visitedHouses =
    iterateHouses' xs newHouse $ Set.insert newHouse visitedHouses
    where 
      (hx, hy) = house 
      newHouse = case x of 
        '^' -> (hx, hy+1)
        'v' -> (hx, hy-1)
        '<' -> (hx-1, hy)
        '>' -> (hx+1, hy)
        _ -> (hx, hy)


iterateHouses :: String -> Int 
iterateHouses [x] = 2
iterateHouses xs = Set.size $ iterateHouses' xs (0,0) Set.empty


main :: IO ()
main = do 
  let filePath = "./Day3.input"
  content <- readFile filePath
  print $ iterateHouses content
