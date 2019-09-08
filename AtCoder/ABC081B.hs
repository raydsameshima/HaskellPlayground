{- ABC081B.hs

Given
  N
  A1 A2 .. AN
of integers, find the maximum possible number of the following operation
  X -> X `div` 2
when X is even.

*Main> let as = [8,12,40]
*Main> and $ map even as
True
*Main> and $ map even $ map (`div` 2) as
True
*Main> and $ map even $ map (`div` 2) $ map (`div` 2) as
False
-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  _  <- getLine 
  as <- readInts
  print $ minimum $ map f as 

f :: Int -> Int
f = g 0
 
g acc n
  | even n = g (acc+1) (n `div` 2)
  | odd  n = acc


