--- Day 2: I Was Told There Would Be No Math ---

{- The elves are running low on wrapping paper, and so they need to submit an
 - order for more. They have a list of the dimensions (length l, width w, and 
 - height h) of each present, and only want to order exactly as much as they 
 - need. 
 -
 - Fortunately, every present is a box (a perfect right rectangular prism), 
 - which makes calculating the required wrapping paper for each gift a little
 - easier: find the surface area of the box, which is 2*l*w + 2*w*h + 2*h*l.
 - The elves also need a little extra paper for each present: the area of the 
 - smallest side. 
 -
 - For example:
 -
 - A present with dimensions 2x3x4 requires 2*6 + 2*12 + 2*8 = 52 square 
 - feet of wrapping paper plus 6 square feet of slack, for a total of 58 
 - square feet.
 -
 - A present with dimensions 1x1x10 requires 2*1 + 2*10 + 2*10 = 42 
 - square feet of wrapping paper plus 1 square foot of slack, for a total
 - of 43 square feet. 
 -
 - All numbers in the elves' list are in feet. How many total square feet of 
 - wrapping paper should they order? -}


-- Returns a tuple (NextDimensions, NexrDimension) from a String.
-- For example, if the parameter is "123456x136", the output 
-- will be ("136","123456")
parseNextDimension :: String -> (String, String)
parseNextDimension [] = ([], [])
parseNextDimension (x:xs) 
  | x == 'x'  = (xs, [])
  | otherwise = (ret, x : nextDim)
  where (ret, nextDim) = parseNextDimension xs


-- Creates a String list with all the dimensions from a dimensions input. 
-- For example, if the input is "123x456x789", the output will be 
-- ["789","456","123"] (which is the input in reverse order).
parseDimensions' :: String -> [String] -> [String]
parseDimensions' [] acc = acc
parseDimensions' xs acc = parseDimensions' rest (dim:acc)
  where (rest,dim) = parseNextDimension xs


-- Calculates how many total square feet of wrapping papper requires a given 
-- String that describes the dimensions of a gift. As described before, 
-- if we had a gift with dimensions (l,w,h), the total of wrapping papper will 
-- be (2*l*w) + (2*w*h) + (2*h*l) plus the minumum of l*w, w*h and h*l.
parseDimensions :: String -> Int 
parseDimensions xs = (2*lw) + (2*wh) + (2*hl) + minimum measures
  where 
    dimensions = reverse $ parseDimensions' xs []
    dimensionsInt = map (\x -> read x :: Int) dimensions
    (l:w:h:nothing) = dimensionsInt
    (lw, wh, hl) = (l*w, w*h, h*l)
    measures = [lw, wh, hl]

-- Given a list of dimensions, returns the total amount of wrapping paper  
-- needed to cover all the dimensions in the list.
sumAllDimensions :: [String] -> Int 
sumAllDimensions [x] = parseDimensions x 
sumAllDimensions (x:xs) = parseDimensions x + sumAllDimensions xs


main :: IO ()
main = do
    let filePath = "./Day2.input"
    content <- readFile filePath
    let linesOfFile = lines content
    print $ sumAllDimensions linesOfFile
