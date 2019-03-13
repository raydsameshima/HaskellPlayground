{- AGC011A.hs -}

import qualified Data.ByteString.Char8 as C
import Data.Maybe 
import Control.Monad
import Data.List

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,c,k] <- getParms -- passengers, maximum num in a bus, and limit time
  ts <- sort <$> replicateM n cReadLn -- i-th passenger's arrival time
  print $ f c k ts

f :: Int -> Int -> [Int] -> Int
f c k ts = solver c k ([],ds) 0
  where
    ds = g k ts
    solver _ _ (_,[]) n = n
    solver c k (_,ts) n = solver c k (ps,qs) (n+1)
      where ps = passengersInABus c ts
            qs = drop (length ps) ts

type Dt = (Int, Int)

g :: Int -> [Int] -> [Dt]
g k ts = zip ts (map (+k) ts)

overWrap 
  :: Dt -> Dt -> Maybe Dt
overWrap (ai,af) (bi,bf)
  | af <  bi = Nothing
  | bi <= af = Just (bi,af)

passengersInABus 
  :: Int -> [Dt] -> [Maybe Dt]
passengersInABus c tt@(t:ts) = filter isJust . map (overWrap t) . take c $ tt


