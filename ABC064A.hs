{- ABC064A.hs -}

main :: IO ()
main = do
  [_,g,b] <- map read . words <$> getLine
  let n = 10*g + b 
  putStrLn $ if evenEven n then "YES" else "NO" 

evenEven
  :: Int -> Bool
evenEven n = even n && even (n `div` 2)
