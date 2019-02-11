{- AGC027A.hs 

Given
  n x
  a1 .. an
of integers, let us spread x candies in n kids, where i-th kid is happy
when receives ai candies.
Find the maximum possible number of happy kids.

-}

import Control.Monad (replicateM )
import Data.List (minimum, scanl', sort, sortBy)
import qualified Data.Vector.Unboxed as U

main :: IO ()
main = do
  [n,x] <- map read . words <$> getLine 
  as    <- map read . words <$> getLine
  print $ f n x as

f :: Int -> Int -> [Int] -> Int
f n x as
  | x < minas = 0
  | x <= sas  = U.length $ U.takeWhile (<= x) $ U.scanl1 (+) as'
  | x < 2*sas = U.length $ U.takeWhile (<= (2*sas - x)) $ U.scanl1 (+) sa
  | otherwise = 0
  where
    minas = U.minimum $ U.fromList as
    sas = sum as
    as' = U.fromList $ sort as
    sa  = U.reverse as' 
