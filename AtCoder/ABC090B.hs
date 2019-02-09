{- ABC090B.hs

-}

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  print $ numOfPlndrm a b

numOfPlndrm
  :: Int -> Int -> Int
numOfPlndrm a b = length . filter id . map isP $ [a .. b]

isP 
  :: Int -> Bool
isP n = n == revInt n

revInt
  :: Int -> Int
revInt = read . reverse . show
