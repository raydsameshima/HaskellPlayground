{- ABC025B.hs

Given
  N (= A+B)
of the sum of two positive integers, find the minimum value of the sum of
the digits of A plus the sum of the digits of B.

-}

-- import Data.Vector 

main :: IO ()
main = do
  n <- readLn
  print $ g n

f :: Int -> [(Int,Int)]
f n = [(x, n-x) | x <- [1..((n+1) `div` 2)]]

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
g = minimum . map (uncurry sod2) . f
