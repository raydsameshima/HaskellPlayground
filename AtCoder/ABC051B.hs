{- ABC051B.hs -}

main :: IO ()
main = do
  [k, s] <- map read . words <$> getLine
  print $ numbers k s

numbers
  :: Int -> Int -> Int
numbers k = length . numbers' k 

numbers' :: Int -> Int -> [(Int,Int,Int)]
numbers' k s 
  = [ (x,y,z) | x <- [0..k]
              , y <- [0..k]
              , let z = s - x - y
              , 0 <= z && z <= k
              ]
                      
