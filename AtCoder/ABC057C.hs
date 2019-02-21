{- ABC057C.hs

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Data.List (reverse)

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

main :: IO ()
main = do
  n <- cReadLn
  print $ f n

f = length . show . snd . minPair

factors n = filter (n `divides`) $ factors' n

factors' :: Int -> [Int]
factors' n = [n', n'-1 .. 1]
  where
    n' = floor . sqrt . fromIntegral $ n

divides :: Int -> Int -> Bool
x `divides` y = rem x y == 0

minPair :: Int -> (Int, Int) -- (smaller, larger)
minPair n = (a,b)
  where
    (a,b) = if null (factors n)
              then (1,n)
              else (p,q)
    (p:_) = factors n
    q     = n `div` p
