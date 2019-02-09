{- ABC090B.hs

-}

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  print $ numOfPlndrm a b

numOfPlndrm
  :: Int -> Int -> Int
numOfPlndrm a b = length [x | x <- [a .. b], isP x]

isP :: Int -> Bool
isP n = c == reverse c
  where
    c = show n
