{-
ABC087B.hs

Given inputs
  a 
  b
  c
  x
print the number of ways to select coins to pay x yen, 
where a,b,c are the numbers of 500 yen, 100 yen, and 50 yen coins.

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

main :: IO ()
main = do
  a <- readInt
  b <- readInt 
  c <- readInt 
  x <- readInt 
  print $ selection' a b c x

selection, selection'
  :: Int -> Int -> Int -> Int -> Int
selection a b c x
  = length [(s,t,u) | s<-[0..a], t<-[0..b], u<-[0..c]
                    , 500*s + 100*t + 50*u == x]

selection' a b c x = sum [ g b c (x-500*s) | s <- [0 .. a]]

g :: Int -> Int -> Int -> Int
g b c x = sum [h c (x-100*t) | t <- [0 .. b]]

h :: Int -> Int -> Int
h c x 
  | x >= 0 && 50* c >= x = 1
  | otherwise            = 0
