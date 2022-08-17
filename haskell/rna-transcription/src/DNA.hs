module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA xs = traverse transc xs where transc 'G' = Right 'C'
                                    transc 'C' = Right 'G'
                                    transc 'T' = Right 'A'
                                    transc 'A' = Right 'U'
                                    transc x = Left x


--why does this work?
-- Nothing and Left values short circuit traverse
-- why and how?
-- Left also short circuits mapM
-- Nothing and Left values may commonly short circuit functions
-- Seems to be an error handling method built into these functions
-- Probably for the best that this happens, but could be communicated more clearly

-- toRNA xs = mapM transc xs where transc 'G' = Right 'C'
--                                 transc 'C' = Right 'G'
--                                 transc 'T' = Right 'A'
--                                 transc 'A' = Right 'U'
--                                 transc x = Left x
