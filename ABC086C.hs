{- ABC086C.hs -}

import Control.Monad 
  ( replicateM ) 

type Pts = [Int]

isNeighbour
  :: Pts  -> Bool
isNeighbour [t,x,y]
  = (ax + ay <= t) && (ax + ay - t) `mod` 2 == 0
  where
    ax = abs x
    ay = abs y

diffPath
  :: [Pts] -> [Pts]
diffPath []        = []
diffPath pp@(p:ps) = p : zipWith (zipWith (-)) ps pp

possiblePath
  :: [Pts] -> Bool
possiblePath = and . map isNeighbour . diffPath  

main :: IO ()
main = do
  n    <- readLn
  txys <- replicateM n $ map read . words <$> getLine
  putStrLn $ if possiblePath txys
               then "Yes"
               else "No"
