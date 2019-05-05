{- ABC090B.hs

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [a,b] <- readInts 
  print $ numOfPlndrm a b

numOfPlndrm
  :: Int -> Int -> Int
numOfPlndrm a b = length [x | x <- [a .. b], isP x]

isP :: Int -> Bool
isP n = c == reverse c
  where
    c = show n
