{- ABC053B.hs 

Given
  s
of string, find a pattern starts from 'A', and ends 'Z'.

*Main> let s = "QWERTYASDFZXCV"
*Main> dropWhile (/='A') s
"ASDFZXCV"
*Main> dropWhile (/='Z') (reverse it)
"ZFDSA"
*Main> length it
5
-}

import qualified Data.ByteString.Char8 as C

main :: IO ()
main = do
  s <- C.getLine
  print $ a2z s

a2z :: C.ByteString -> Int
a2z = C.length . C.dropWhile (/='Z') . C.reverse . C.dropWhile (/='A') 

