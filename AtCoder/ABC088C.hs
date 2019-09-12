{- ABC088C.hs -}

import Data.List ( transpose )
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  c1 <- readInts
  c2 <- readInts
  c3 <- readInts
  putStrLn $ if f c1 c2 c3 
               then "Yes"
               else "No"

f :: [Int] -> [Int] -> [Int] -> Bool
f c1 c2 c3 = let c = [c1,c2,c3] in
  yoko c && tate c

yoko, tate 
  :: [[Int]] -> Bool
yoko [c1@[c11,c12,c13], c2@[c21,c22,c23], c3@[c31,c32,c33]]
  = all (==c11-c21) (zipWith (-) c1 c2) &&
    all (==c21-c31) (zipWith (-) c2 c3) &&
    all (==c31-c11) (zipWith (-) c3 c1) 

tate = yoko . transpose
