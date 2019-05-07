{- ABC074C.hs

-}

import Data.Ratio
import Data.List 
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  as <- readInts
  let (sw,s) = select as
  putStrLn $ show sw ++ " " ++ show s

type SW = Int -- SugarWater
type S  = Int -- Sugar

ratio :: (SW, S) -> Maybe (Ratio Int)
ratio (a,b) = if a == 0 
                then Nothing 
                else Just (b % a) 

combinations :: [Int] -> [(SW,S)]
combinations [a,b,c,d,_e,f] 
  = [(w + s,s)
      | let fa = f `div` (100*a)
      , na <- [0 .. fa]
      , let fb = (f-100*a*na) `div` (100*b)
      , nb <- [0 .. fb]
      , let w = 100*(a*na + b*nb)
      , let fc = (f-w) `div` c
      , nc <- [0 .. fc]
      , let fd = (f-w-c*nc) `div` d
      , nd <- [0 .. fd]
      , let s = c*nc + d*nd
      , na + nb > 0
--      , nc + nd > 0
      ]

select :: [Int] -> (SW,S)
select as@[a,b,c,d,e,f] = h e ls l
  where
    (l:ls) = combinations as

    h :: Int -> [(SW,S)] -> (SW,S) -> (SW,S)
    h _ []     best     = best
    h e (m:ms) best
      | rmax < ratio best = h e ms m
      | rmax == rm      = m
      | rmax <  rm      = h e ms best
      | ratio best < rm
          && rm < rmax  = h e ms m
      | otherwise       = h e ms best
      where
        rm = ratio m
        rmax = ratio (e+100, e)
