{- ABC086C.hs -}

import Control.Monad 
  ( replicateM ) 

type Trio = (Int, Int, Int)

main :: IO ()
main = do
  n    <- readLn :: IO Int
  txys <- replicateM n readTrio
  putStrLn $ if possiblePath txys
               then "Yes"
               else "No"

readTrio :: IO Trio
readTrio = do
  [x,y,z] <- map read . words <$> getLine
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
