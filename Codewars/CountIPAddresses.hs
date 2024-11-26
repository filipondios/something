import Data.List.Split
import Data.Word(Word32)
import Data.Bits(shiftL, (.|.))

type IPv4 = String
type IPv4b = Word32


parseIP :: IPv4 -> IPv4b
parseIP ip = 
  foldr (\(i,is) ip -> ip .|. (is `shiftL` (i*8))) 0 $
  zip [3,2,1,0] $
  map read $
  splitOn "." ip


{-
 - This should be the correct solution for the problem but the tests that 
 - run at the "attempt" button try to calculate the IPs between two IPs 'a'
 - and 'b' where 'a' > 'b', expecting a negative result.
 -
 - This is not correct, since the number (count) of IPs in a range logically
 - cannot be less than 0, and it should result in 0.
 -
 - ipsBetween :: IPv4 -> IPv4 -> Int 
 - ipsBetween start end 
 -  | rangeStart >= rangeEnd = 0 
 -  | otherwise = fromIntegral $ rangeEnd - rangeStart 
 -    where 
 -      rangeStart = parseIP start 
 -      rangeEnd   = parseIP end
-}

ipsBetween :: IPv4 -> IPv4 -> Int
ipsBetween start end = rangeEnd - rangeStart
  where
    rangeStart = fromIntegral (parseIP start) :: Int
    rangeEnd   = fromIntegral (parseIP end)   :: Int
