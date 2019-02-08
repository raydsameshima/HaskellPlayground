{- ABC095B.hs 

Given
  N X
  m1
  ...
  mN
print the maximum number of doughnuts we can make under the following condition:
  For each of the N kinds, make at least one.

-}

import Control.Monad (replicateM)

main :: IO ()
main = do
  [n,x] <- map read . words <$> getLine 
  ms    <- replicateM n readLn 
  print $ f n x ms

f :: Int -> Int -> [Int] -> Int
f n x ms = n + (x - sum ms) `div` (minimum ms)
