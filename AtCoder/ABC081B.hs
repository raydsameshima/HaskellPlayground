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
  print $ counter as

counter
  :: [Int] -> Int
counter ns = helper ns 0
  where
    helper :: [Int] -> Int -> Int
    helper ms k
      | all even ms = helper ms' (k+1)
      | otherwise   = k
      where
        ms' = map (`div` 2) ms
