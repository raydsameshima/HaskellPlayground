{-
ABC083B.hs

*Main> let n = 113
*Main> let s = show n :: String
*Main> map Data.Char.digitToInt s
[1,1,3]
*Main> sum it
5
-}

import Data.Char (digitToInt)

main :: IO ()
main = do
  [n,a,b] <- map read . words <$> getLine 
  print $ f n a b

f :: Int -> Int -> Int -> Int
f n a b = sum [ m | m <- [1..n]
                  , a   <= g m
                  , g m <= b]
  where
    g = sumDigits'

sumDigits, sumDigits' 
  :: Int -> Int
sumDigits = sum . map digitToInt . show -- 2 ms, 892 KB

{-
from 
https://qiita.com/hsjoihs/items/25a08b426196ab2b9bb0#5問目-abc083b-some-sums

95 ms
1020 KB
-}

sumDigits' k = sum [read [c] | c <- show k]

                  
