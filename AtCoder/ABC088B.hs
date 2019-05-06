{- ABC88B.hs

Given
  N
  a1 .. aN
Alice takes a1, then Bob takes a2 and so on so forth.
Find Alice's score minus Bob's score.
-}

import Data.List ( sortBy )
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  _  <- getLine
  as <- readInts 
  print . point . alisAndBob . sort' $ as

sort' 
  :: Ord a => [a] -> [a]
sort' = sortBy (flip compare)

alisAndBob 
  :: Ord a => [a] -> ([a],[a])
alisAndBob ns = helper ns ([],[])
  where
    helper :: Ord a => [a] -> ([a],[a]) -> ([a],[a])
    helper []       ab         = ab
    helper [a]      ab@(as,bs) = (a:as, bs)
    helper (a:b:cs) ab@(as,bs) = helper cs (a:as, b:bs)

point
  :: ([Int],[Int]) -> Int
point (as,bs) = sum as - sum bs


