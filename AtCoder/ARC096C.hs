{- ARC096C.hs
-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [a,b,c,x,y] <- getParms
  print $ f' a b c x y

f :: Int -> Int -> Int -> Int -> Int -> Int
f a b c x y
  | 2*c < a + b = min (2*c*min x y + g a b x y)
                      (2*c*max x y)
  | otherwise   = a*x + b*y
  where
    g a b x y
      | x < y     = (y-x)*b
      | otherwise = (x-y)*a

f' :: Int -> Int -> Int -> Int -> Int -> Int
f' a b c x y
  | 2*c < a + b = 2*c*min x y + min (g a b x y)
                                    (2*c*abs (x-y))
  | otherwise   = a*x + b*y
  where
    g a b x y
      | x < y     = (y-x)*b
      | otherwise = (x-y)*a


