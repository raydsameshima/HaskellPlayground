{- ABC074C.hs

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

import Data.Ratio
import Data.List (maximumBy)

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  as <- getParms
  let (w,s) = maxWS as
  putStrLn $ show w ++ " " ++ show s

type SW = Int -- SugarWater
type S  = Int -- Sugar

percentage :: (SW, S) -> Ratio Int
percentage (a,b) = b % a 

total :: (SW,S) -> Int
total = fst

combinations' :: [Int] -> [(SW,S)]
combinations' [a,b,c,d,_e,f] 
  = [(100*a*na + 100*b*nb + c*nc + d*nd, c*nc + d*nd)
      | let fa = f `div` (100*a)
      , na <- [0 .. fa]
      , let fb = (f-100*a*na) `div` (100*b)
      , nb <- [0 .. fb]
      , let fc = (f-100*(a*na + b*nb)) `div` c
      , nc <- [0 .. fc]
      , let fd = (f-100*(a*na + b*nb)-c*nc) `div` d
      , nd <- [0 .. fd]
      ]

combinations :: [Int] -> [(SW,S)]
combinations as@[a,b,c,d,e,f]
  = filter (\ws -> (percentage ws <= percentage (e+100,e) && total ws <= f)) $ tail $ combinations' as 

maxWS = maximumBy c . combinations
  where
    c :: (SW,S) -> (SW,S) -> Ordering
    a `c` b = compare (percentage a) (percentage b)
