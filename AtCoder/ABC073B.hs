{- ABC073B.hs -}

import Control.Monad
  ( replicateM )

type Pair = (Int, Int)

main :: IO ()
main = do
  n  <- readLn
  lr <- replicateM n readPair
  print $ counter n lr

readPair :: IO Pair
readPair = do
  [l,r] <- map read . words <$> getLine
  return (l,r)

counter 
  :: Int -> [Pair] -> Int
counter n lr = n + sum (map (uncurry $ flip (-)) lr)
