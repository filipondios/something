
-- Determine the RNA complement of a given DNA sequence.
toRNA' :: String -> Either Char String -> Either Char String
toRNA' [] acc = acc 
toRNA' (x:xs) eitherAcc = 
  case eitherAcc of 
    (Left err) -> Left err
    (Right acc) -> case x of 
      'G' -> toRNA' xs (Right (acc ++ "C")) 
      'C' -> toRNA' xs (Right (acc ++ "G"))
      'T' -> toRNA' xs (Right (acc ++ "A"))
      'A' -> toRNA' xs (Right (acc ++ "U"))
      c -> Left c

toRNA :: String -> Either Char String
toRNA xs = toRNA' xs (Right "")
