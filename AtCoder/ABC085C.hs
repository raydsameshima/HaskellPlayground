{- ABC085C.hs
-}

import qualified Data.ByteString.Char8 as C
import           Data.Maybe ( fromJust )
import qualified Data.Vector.Unboxed as U

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,y] <- getParms
  putStrLn $ otsdm n y

type Yen = Int
type Mai = Int
type Pochi = (Int,Int,Int) -- #s of 10000,5000,1000 bills

otsdm'
  :: Mai -> Yen -> [Pochi]
otsdm' n y
  = [(a,b,n-a-b) 
      | let a0 = y `quot` 10000
      , a <- [0 .. a0]
      , let b0 = (y - 10000*a) `quot` 5000
      , b <- [0 .. b0]
      ]

gok
  :: Pochi -> Yen
gok (a,b,c) = 10000*a +5000*b + 1000*c 

otsdm
  :: Mai -> Yen -> String
otsdm n y
  | null os   = "-1 -1 -1"
  | otherwise = show a ++ " " ++ show b ++ " " ++ show c
  where
    os = filter (\o -> y == gok o) $ otsdm' n y
    (a,b,c) = head os

  
