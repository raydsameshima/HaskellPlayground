{- ABC068B.hs

Given a positive integer
  n
(1 <= n <= 100), find the number that can be divisible by 2 for the most number of times in
  [1 .. n]
.

-}

main :: IO ()
main = do
  n <- readLn 
--  print $ 2 ^ (floor $ logBase 2 n)
  print . f $ n

f :: Int -> Int
f n = head . filter (<= n) $ [2^i | i<-[6,5 .. 0]]

