{- ABC025A.hs

Given
  N (= A+B)
of the sum of two positive integers, find the minimum value of the sum of
the digits of A plus the sum of the digits of B.

-}

import qualified Data.Vector.Unboxed as V
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

main :: IO ()
main = do
  n <- readInt
  print $ g n

f :: Int -> V.Vector (Int,Int)
f n = V.fromList [(x, n-x) | x <- [1..((n+1) `div` 2)]]

sod
  :: Int -> Int
sod n
  | q == 0 = r 
  | otherwise = r + sod q
  where
    (q,r) = quotRem n 10

sod2
  :: Int -> Int -> Int
sod2 x y = sod x + sod y

g :: Int -> Int
g = V.minimum . V.map (uncurry sod2) . f
