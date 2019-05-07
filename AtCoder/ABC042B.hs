{- ABC042B.hs -}

import qualified Data.List as L 
import qualified Data.ByteString.Char8 as C
import Control.Monad ( replicateM )
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,_] <- readInts
  ss    <- replicateM n C.getLine
  C.putStrLn $ minimumCombination ss 

minimumCombination 
 :: [C.ByteString] -> C.ByteString
minimumCombination = C.concat . L.sort
