{- AGC027A.hs 

Given
  n x
  a1 .. an
of integers, let us spread x candies in n kids, where i-th kid is happy
when receives ai candies.
Find the maximum possible number of happy kids.

If 
  sum [a1 .. an] < x
holds, then we can provide all the kids but one with perfect satisfaction.
-}


import Data.List ( sort )

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,x] <- readInts
  as    <- readInts
  print $ f n x as

f :: Int -> Int -> [Int] -> Int
f n x as
  | t < x     = n-1
  | k <= n    = k   
  | otherwise = 0
  where
    t :: Int
    t = sum as 
    
    lengthUpto :: Int -> [Int] -> Int
    lengthUpto x = length . takeWhile (<= x) 

    k = lengthUpto x sums
    
    sums :: [Int]
    sums = scanl1 (+) as'
    
    as' :: [Int]
    as' = sort as
