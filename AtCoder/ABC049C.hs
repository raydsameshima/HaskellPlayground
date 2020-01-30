{- ABC049.hs -}

import qualified Data.ByteString.Char8 as C

main :: IO ()
main = do
  s <- C.getLine
  let r = C.reverse s
  if isIn' r
    then putStrLn "YES"
    else putStrLn "NO"

rDream, rDreamer, rErase, rEraser :: C.ByteString
rDream   = C.reverse . C.pack $ "dream"
rDreamer = C.reverse . C.pack $ "dreamer"
rErase   = C.reverse . C.pack $ "erase"
rEraser  = C.reverse . C.pack $ "eraser"

isIn' :: C.ByteString -> Bool
isIn' s
  | C.null s = True
  | rDreamer `C.isPrefixOf` s = helper rDreamer s
  | rDream   `C.isPrefixOf` s = helper rDream   s
  | rEraser  `C.isPrefixOf` s = helper rEraser  s
  | rErase   `C.isPrefixOf` s = helper rErase   s
  | otherwise = False
  where
    helper rS = isIn' . C.drop (C.length rS) 
