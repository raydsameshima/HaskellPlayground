{- ABC085B.hs
Given
  n
  d1
  ...
  dn
of integers ([1 .. 100]), print the maximum length of 
a strictly descending sequence.
-}

import Data.List (nub, sort)
import Control.Monad (replicateM)

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  n  <- readInt
  ds <- replicateM n readInt
  print $ mochi ds

mochi
  :: [Int] -> Int
mochi = length . nub 
