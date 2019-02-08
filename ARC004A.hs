{- ARC004A.hs

-}

import Control.Monad
  ( replicateM )

main :: IO ()
main = do
  n   <- readLn
  xys <- replicateM n readPair
  print $ farest xys

type Pair = (Int, Int)

readPair
  :: IO Pair
readPair = do
  [x,y] <- map read . words <$> getLine
  return (x,y)

farest
  :: [Pair] -> Double
farest ps = maximum [ norm x y | x <- ps, y <- ps] 

norm 
  :: Pair -> Pair -> Double
norm (x1,x2) (y1,y2) = sqrt . fromIntegral $ (y1-x1)^2 + (y2-x2)^2

