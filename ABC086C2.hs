{- ABC086C2.hs -}

import Control.Monad 
  ( replicateM ) 
import qualified Data.ByteString.Char8 as B
  ( readInt, words, getLine )
import Data.Maybe
  ( fromJust )

type Trio = (Int, Int, Int)

main :: IO ()
main = do
  n    <- readLn :: IO Int
  txys <- replicateM n readTrio :: IO [Trio]
  putStrLn $ if possiblePath txys
               then "Yes"
               else "No"

readTrio :: IO Trio
readTrio = do
--  [x,y,z] <- map read . words <$> getLine
  [x,y,z] <- map (fst . fromJust . B.readInt) . B.words <$> B.getLine
  return (x,y,z)
 
norm
  :: Trio -> Int
norm (_, x, y) = abs x + abs y

isNeighbour
  :: Trio  -> Bool
isNeighbour p@(t,x,y) -- (0,0,0)
  = even (x + y - t) && norm p <= t

diffPath
  :: [Trio] -> [Trio]
diffPath []        = []
diffPath pp@(p:ps) = p : zipWith diff ps pp
  where
    diff (s,a,b) (t,x,y) = (s-t, a-x, b-y)

possiblePath
  :: [Trio] -> Bool
possiblePath = all isNeighbour . diffPath  
