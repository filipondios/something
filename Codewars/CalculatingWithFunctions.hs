
plus, minus, times, dividedBy :: ((Int -> Int) -> Int) -> Int -> Int
plus  f x = f $ (+) x
minus f x = f $ (-) x
times f x = f $ (*) x
dividedBy f x = f $ div x

zero,one,two,three,four,five,six,seven,eight,nine :: (Int -> Int) -> Int
zero  f = f 0
one   f = f 1
two   f = f 2  
three f = f 3
four  f = f 4
five  f = f 5
six   f = f 6
seven f = f 7
eight f = f 8
nine  f = f 9
