{- ABC042B.hs -}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Control.Monad ( replicateM )
import qualified Data.List as L ( sort )


getParm :: IO [Int]
getParm = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,_] <- getParm
  ss    <- replicateM n C.getLine
  C.putStrLn $ minimumCombination ss 

minimumCombination 
 :: [C.ByteString] -> C.ByteString
minimumCombination = C.concat . L.sort
