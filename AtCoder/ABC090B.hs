{- ABC090B.hs

-}

import qualified Data.ByteString.Char8 as C

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  print $ numOfPlndrm a b

numOfPlndrm
  :: Int -> Int -> Int
numOfPlndrm a b = length $ filter isP [a .. b]

isP 
  :: Int -> Bool
isP n = c == C.reverse c
  where
    c = C.pack $ show n
