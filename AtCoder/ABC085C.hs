{- ABC085C.hs
-}

main :: IO ()
main = do
  [n,y] <- map read . words <$> getLine
  otsdm n y

otsdm'
  :: Int -> Int -> [(Int,Int,Int)]
otsdm' n y
  = [(a,b,c) | let a0 = y `quot` 10000
             , a <- [0 .. a0]
             , let b0 = (y - 10000*a) `quot` 5000
             , b <- [0 .. b0]
             , let c = n-a-b
             , a*10000 + b*5000 + c*1000 == y
             ]

otsdm
  :: Int -> Int -> IO ()
otsdm n y
  | null o    = putStrLn "-1 -1 -1"
  | otherwise = putStrLn $ show a ++ " " ++ show b ++ " " ++ show c
  where
    o = otsdm' n y
    (a,b,c) = head o


