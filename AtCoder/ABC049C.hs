{- ABC049.hs -}

import qualified Data.ByteString.Char8 as C

main :: IO ()
main = do
  s <- C.getLine
  let r = C.reverse s
  let b = isIn $ C.unpack r
  if b then putStrLn "YES"
       else putStrLn "NO"

isIn
  :: String -> Bool
isIn s = isIn' s False
  where
    isIn' ""                               b = b 
    isIn' ('r':'e':'m':'a':'e':'r':'d':ss) _ = isIn' ss True 
    isIn'         ('m':'a':'e':'r':'d':ss) _ = isIn' ss True 
    isIn'     ('r':'e':'s':'a':'r':'e':ss) _ = isIn' ss True
    isIn'         ('e':'s':'a':'r':'e':ss) _ = isIn' ss True
    isIn' _                                _ = False
