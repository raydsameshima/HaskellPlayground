{- ABC063B.hs -}

import Data.List
  ( nub )

main :: IO ()
main = do
  s <- getLine
  putStrLn $ if noDuplicate s 
               then "yes"
               else "no"

noDuplicate
  :: String -> Bool
noDuplicate ss
  = let n = length . nub $ ss 
        m = length ss
    in n==m
