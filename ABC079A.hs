{-
ABC079.hs 

*Main Data.Char> any (>2) $ map length $ group $ map digitToInt "1118"
True
-}

import Data.Char (digitToInt)
import Data.List (group)

main :: IO ()
main = do
  n <- getLine
  putStrLn $ if yoi n then "Yes" else "No"

yoi :: String -> Bool
yoi = any (>2) . map length . group . map digitToInt
