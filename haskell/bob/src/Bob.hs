module Bob (responseFor) where
import Data.Char (isAlpha, isUpper, isSpace)


responseFor :: String -> String
responseFor xs | all isSpace xs = "Fine. Be that way!"
    | isYell xs && isQuestion xs = "Calm down, I know what I'm doing!"
    | isQuestion xs = "Sure."
    | isYell xs = "Whoa, chill out!"
    | otherwise = "Whatever."
    where isYell ys = let filtered = filter isAlpha ys in not (null filtered) && all isUpper filtered
          isQuestion ys = '?' == head (dropWhile isSpace (reverse ys))