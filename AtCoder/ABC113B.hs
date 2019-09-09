{- ABC113B.hs

For given
  N
  T A
  H1 H2 .. HN
find the index i and Hi satisfying
  A
  T-Hi*0.006
as close as possible.
(Assume the solution is unique.)

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe
  ( fromJust )
import Data.List
  ( findIndex, minimumBy )

main = do
  _ <- getLine
  [t,a] <- getParm
  hs    <- getParm  
  print . findIndex4Minimum $ map (f t a . toEnum) hs


getParm :: IO [Int]
getParm = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

f :: Int -> Int -> Int -> Double
f t a h = abs( (t'-h'*0.006) - a' )
  where
    t' = fromIntegral t -- toEnum t
    h' = fromIntegral h -- toEnum h
    a' = fromIntegral a -- toEnum a

findIndex4Minimum :: [Double] -> Int
findIndex4Minimum ws = snd . minimumBy c . zip ws $ [1..]
  where
    c x y = compare (fst x) (fst y)


