{- ABC083B.hs

*Main Turtle> quotRem 1234 10
(123,4)
*Main Turtle> quotRem (fst it) 10
(12,3)
*Main Turtle> quotRem (fst it) 10
(1,2)
*Main Turtle> quotRem (fst it) 10
(0,1)

-}

main :: IO ()
main = do
  [n,a,b] <- map read . words <$> getLine 
  print $ f n a b

f :: Int -> Int -> Int -> Int
f n a b = sum [ m | m <- [1..n]
                  , a   <= g m
                  , g m <= b ]
  where
    g = sum . int2lst

int2lst
  :: Int -> [Int]
int2lst n
  | q == 0 = [r]
  | otherwise = r: int2lst q
  where
    (q,r) = quotRem n 10
