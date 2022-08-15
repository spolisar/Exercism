module CollatzConjecture (collatz) where


collatz :: Integer -> Maybe Integer
collatz x = collatzHelp x 0 where collatzHelp n i | n <= 0 = Nothing
                                                  | n==1 = Just i
                                                  | odd n = collatzHelp (3*n + 1) (i+1)
                                                  | otherwise = collatzHelp (n `div` 2) (i+1) 