{- ABC047B.hs

-}

import Control.Monad (replicateM)
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [w,h,n] <- readInts
  xya     <- replicateM n readInts
  print $ uncurry area $ f w h xya

type Range = (Int,Int)

initialize
  :: Int -> Int -> (Range, Range)
initialize w h = ((0, w), (0, h))

cut :: (Range, Range) -> [Int] -> (Range, Range) 
cut (xx@(xi,xf),yy@(yi,yf)) [x,y,a]
  | a == 1 = ((max x xi, xf), yy)
  | a == 2 = ((xi, min x xf), yy)
  | a == 3 = (xx, (max y yi, yf))
  | a == 4 = (xx, (yi, min y yf))

f :: Int -> Int -> [[Int]] -> (Range, Range)
f w h = foldl cut (initialize w h) 

area :: Range -> Range -> Int
area (xi,xf) (yi,yf) 
  | xi < xf && yi < yf = (xf-xi)*(yf-yi)
  | otherwise          = 0
