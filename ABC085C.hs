{-
ABC085C.hs
-}

otoshidama'
  :: Int -> Int -> [(Int,Int,Int)]
otoshidama' n y
  = [(a,b,c) | a <- [0 .. y `quot` 10000]
             , b <- [0 .. (y-10000*a) `quot` 5000]
             , c <- [0 .. (y-10000*a-5000*b) `quot` 1000]
             , a+b+c == n
             , a*10000 + b*5000 + c*1000 == y
             ]

otoshidama 
  :: Int -> Int -> IO ()
otoshidama n y
  | null o    = putStrLn "-1 -1 -1"
  | otherwise = putStrLn $ show a ++ " " ++ show b ++ " " ++ show c
  where
    o = otoshidama' n y
    (a,b,c) = head o

main :: IO ()
main = do
  [n,y] <- map read . words <$> getLine
  otoshidama n y



