{- ABC081C.hs 

Given
  n k
  a1 .. an
print the minimum number of the following procedure:
Given n-balls, choose some balls and change the labels to make their kinds is smaller than k.

-}

import qualified Data.ByteString.Char8 as C
import qualified Data.Vector.Unboxed as U
import Data.List ( group, sort, length, sortOn )
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,k] <- readInts
  as    <- readInts
  print $ f n k as

f :: Int -> Int -> [Int] -> Int
f n k as = g as'' (l-k) 0
  where
    as'  = group $ sort as
    l    = length as'
    as'' = map length $ sortOn length as'

g :: [Int] -> Int -> Int -> Int
g _      k x 
  | k <= 0   = x
g (b:bs) k x = g bs (k-1) (x+b) 
