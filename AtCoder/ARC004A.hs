{- ARC004A.hs

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Control.Monad ( replicateM )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  n   <- readInt
  xys <- replicateM n readPair
  print $ farest xys

type Pair = (Int, Int)

readPair
  :: IO Pair
readPair = do
  [x,y] <- readInts
  return (x,y)

farest
  :: [Pair] -> Double
farest ps = maximum [ norm x y | x <- ps, y <- ps] 

norm 
  :: Pair -> Pair -> Double
norm (x1,x2) (y1,y2) = sqrt . fromIntegral $ (y1-x1)^2 + (y2-x2)^2

