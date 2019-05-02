{- ABC068B.hs

Given a positive integer
  n
(1 <= n <= 100<128), find the number that can be divisible by 2 
for the most number of times in
  [1 .. n]

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

main :: IO ()
main = do
  n <- readInt
  print $ f n

f :: Int -> Int
f n = head . filter (<= n) $ [2^i | i<-[6,5 .. 0]]
