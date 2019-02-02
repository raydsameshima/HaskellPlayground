{- ABC082B.hs 

Given strings
  s
  t
determine whether
  s < t
for the lex order.

-}

import Data.List
  ( sort, sortBy )

main :: IO ()
main = do
  s <- getLine
  t <- getLine
  putStrLn $ if s `isLargerThan` t 
               then "Yes"
               else "No"

isLargerThan
  :: String -> String -> Bool
isLargerThan s t
  | s' < t'   = True
  | otherwise = False
  where
    s' = toLeft  s
    t' = toRight t

    toLeft  = sort
    toRight = sortBy (flip compare)
