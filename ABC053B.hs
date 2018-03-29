{- 
ABC053B.hs 

*Main> let s = "QWERTYASDFZXCV"
*Main> dropWhile (/='A') s
"ASDFZXCV"
*Main> dropWhile (/='Z') (reverse it)
"ZFDSA"
*Main> length it
5
-}

main :: IO ()
main = do
  s <- getLine
  print $ a2z s

a2z
  :: String -> Int
a2z = length . dropWhile (/='Z') . reverse . dropWhile (/='A') 

