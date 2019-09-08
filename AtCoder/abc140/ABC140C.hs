{- C

For inputs
  n
  b1 b2 .. b(n-1)
print the maximum of the sum of as.

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  _n <- readInt
  bs <- readInts
  print $ f bs

f :: [Int] -> Int
f bb@(b:bs) = h b bb

h acc []  = acc
h acc [b] = acc + b
h acc (b:bs@(c:cs)) = h acc' bs
  where acc' = min b c + acc




