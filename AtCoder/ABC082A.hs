{- ABC082.hs

https://atcoder.jp/contests/abc082/tasks/abc082_a

Given two integers
  a b
print the rounded number of the average
  (a+b)/2

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [a,b] <- readInts
  print $ (a+b+1) `div` 2

kiriage 
  :: Int -> Int 
kiriage n 
  | odd  n = (n+1) `div` 2
  | even n = n     `div` 2
