{- ABC082B.hs -}

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
