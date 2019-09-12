{- ARC096C.hs -}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  as <- readInts
  print $ f as

f :: [Int] -> Int
f as@[a,b,c,x,y]
  | 2*c < a + b = min (2*c*min x y + g a b x y)
                      (2*c*max x y)
  | otherwise   = a*x + b*y
  where
    g a b x y
      | x < y     = (y-x)*b
      | otherwise = (x-y)*a

f' :: [Int] -> Int
f' as@[a,b,c,x,y]
  | 2*c < a + b = 2*c*min x y + min (g a b x y)
                                    (2*c*abs (x-y))
  | otherwise   = a*x + b*y
  where
    g a b x y
      | x < y     = (y-x)*b
      | otherwise = (x-y)*a

-- https://atcoder.jp/contests/arc096/submissions/2397049
h :: [Int] -> Int
h as@[a,b,c,x,y]
  = minimum [bAB, bC, bAC, bBC]
  where
    bAB = a*x + b*y
    bC  = 2*c*(max x y)
    bAC = 2*c*x + b*(max 0 (y-x))
    bBC = a*(max 0 (x-y)) + 2*c*y
  

