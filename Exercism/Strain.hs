
--  Returns a new collection containing those elements where
--  the predicate is false
discard :: (a -> Bool) -> [a] -> [a]
discard p xs = [ e | e <- xs, not $ p e ]

--  Returns a new collection containing those elements where
--  the predicate is true
keep :: (a -> Bool) -> [a] -> [a]
keep p xs = [ e | e <- xs, p e ]
