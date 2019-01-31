{- ABC064A.hs 

For integer inputs
  r g b
read them as a three-digit integer, and determine wether it is a multiple of 4 or not.
Print
  YES
if it is, otherwise
  NO
.

-}

main :: IO ()
main = do
  [_,g,b] <- map read . words <$> getLine
  let n = 10*g + b 
  putStrLn $ if m4 n then "YES" else "NO" 

m4 :: Int -> Bool
m4 n = n `mod` 4 == 0
