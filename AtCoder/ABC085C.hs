{- ABC085C.hs
-}

import qualified Data.ByteString.Char8 as C
import           Data.Maybe ( fromJust, isNothing )

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,y] <- getParms
  putStrLn $ f n y

type Mai = Int
type Yen = Int
type Pochi = (Int,Int,Int) -- #s of 10000,5000,1000 bills

minPochi :: Yen -> Pochi
minPochi y = (a,b,c)
  where
    (a,r) = y `quotRem` 10000
    (b,s) = r `quotRem` 5000
    c     = s `quot` 1000

canPay :: Mai -> Yen -> Maybe Pochi
canPay n y = h i
  where
    i@(a,b,c) = minPochi y

    h :: Pochi -> Maybe Pochi
    h p@(a,b,c)
      | n == m = Just p
      | n - m > 3 && b > 0 = h (a, b-1, c+5)
      | n - m > 0 && a > 0 = h (a-1,b+2,c)
      | otherwise = Nothing
      where
        m = a+b+c

f n y
  | isNothing p = "-1 -1 -1"
  | otherwise   = show a ++ " " ++ show b ++ " " ++ show c
  where
    p = canPay n y
    (a,b,c) = fromJust p



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
