{- ABC102B.hs

Given
  N (>= 2)
  A1 .. AN
of integers, find the maximum absolute difference of two elements.

Since both B.head and B.last are O(1), we can simply sort as and take head and last.

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe 
  ( fromJust )

main = do
  _  <- getLine
  as <- map (fst . fromJust . C.readInt) . C.words <$> C.getLine 
  print $ uncurry (-) $ maxMin as

maxMin :: [Int] -> (Int, Int)
maxMin = (,) <$> maximum <*> minimum
