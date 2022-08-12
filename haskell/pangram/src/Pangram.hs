module Pangram (isPangram) where
import Data.Char


isPangram :: String -> Bool
isPangram "" = False
isPangram text = foldl1 (&&) [elem c (map toLower text) | c <- ['a'..'z']]

-- Interesting community solution found on exercism
-- isPangram text = null (['a' .. 'z'] \\ (map toLower text))
