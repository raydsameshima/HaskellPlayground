{- ABC095B.hs 

Given
  N X
  m1
  ...
  mN
of ints, print the maximum number of doughnuts 
we can make under the following condition:

  For each of the N kinds, make at least one.

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Control.Monad (replicateM)

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,x] <- readInts
  ms    <- replicateM n readInt
  print $ f n x ms

sumMin :: [Int] -> (Int, Int)
sumMin = (,) <$> sum <*> minimum

f :: Int -> Int -> [Int] -> Int
f n x ms = n + (x - sms) `div` minms
  where
    (sms, minms) = sumMin ms
