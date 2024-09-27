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


moveToDirection :: House -> Char -> House
moveToDirection (x,y) c = case c of 
  '^' -> (x, y+1)
  'v' -> (x, y-1)
  '<' -> (x-1, y)
  '>' -> (x+1, y)
  _ -> (x,y)


-- iterateHouses' will receive a string full of directions, and the actual 
-- coordinate (house) where we are delivering a present. The approach will be 
-- to store in a set (a unique element collection) all the visited houses (so 
-- we wont store duplicates).
iterateHouses' :: String -> House -> Set House -> Set House
iterateHouses' [] _ visitedHouses = visitedHouses
iterateHouses' (x:xs) house visitedHouses =
    iterateHouses' xs newHouse $ Set.insert newHouse visitedHouses
    where newHouse = moveToDirection house x


iterateHouses :: String -> Int 
iterateHouses [x] = 2
iterateHouses xs = Set.size $ iterateHouses' xs (0,0) Set.empty


partOne :: IO ()
partOne = do 
  let filePath = "./Day3.input"
  content <- readFile filePath
  print $ iterateHouses content


--- Part Two ---

{- The next year, to speed up the process, Santa creates a robot version of 
 - himself, Robo-Santa, to deliver presents with him. 
 -
 - Santa and Robo-Santa start at the same location (delivering two presents to
 - the same starting house), then take turns moving based on instructions from
 - the elf, who is eggnoggedly reading from the same script as the previous
 - year. 
 -
 - This year, how many houses receive at least one present? 
 -
 - For example:
 -  
 -    ^v delivers presents to 3 houses, because Santa goes north, and then
 -    Robo-Santa goes south.
 - 
 -    ^>v< now delivers presents to 3 houses, and Santa and Robo-Santa end 
 -    up back where they started.
 -  
 -    ^v^v^v^v^v now delivers presents to 11 houses, with Santa going one
 -    direction and Robo-Santa going the other.
-}

-- 
-- Same as the original funcion but with two sets and houses being passed as
-- arguments. Not very extendible but it does the job. If we had 'n' people 
-- giving presents, we better have a list of houses and a list of Sets of houses.
--
iterateHousesWithRobo' :: String -> House -> House -> Set House -> Set House -> Set House
iterateHousesWithRobo' [] _ _ santaHouses roboHouses = Set.union santaHouses roboHouses

iterateHousesWithRobo' [x] santaHouse _ santaHouses roboHouses = 
  Set.union roboHouses $ Set.insert (moveToDirection santaHouse x) santaHouses

iterateHousesWithRobo' (a:b:xs) santaHouse roboHouse santaHouses roboHouses =
  iterateHousesWithRobo' xs newSantaHouse newRoboHouse newSantaHouses newRoboHouses
  where 
    newSantaHouse = moveToDirection santaHouse a 
    newRoboHouse  = moveToDirection roboHouse b
    newSantaHouses = Set.insert newSantaHouse santaHouses
    newRoboHouses  = Set.insert newRoboHouse roboHouses  


iterateHousesWithRobo :: String -> Int 
iterateHousesWithRobo [x,y] = 3
iterateHousesWithRobo xs = 
  Set.size $ 
    Set.insert (0,0) $ 
      iterateHousesWithRobo' xs (0,0) (0,0) Set.empty Set.empty


partTwo :: IO ()
partTwo = do 
  let filePath = "./Day3.input"
  content <- readFile filePath
  print $ iterateHousesWithRobo content
