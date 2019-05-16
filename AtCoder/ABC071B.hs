{- ABC071B.hs
Given
  s
of a string, find the "smallest" lowercase that does not occur in s.
-}

import qualified Data.ByteString.Char8 as B

main :: IO ()
main = do
  s <- B.getLine
  putStrLn . toString . none' $ s

none'
  :: B.ByteString -> Maybe Char
none' x 
  | B.null fx = Nothing
  | otherwise = Just $ B.head fx
  where
    fx = B.dropWhile (`B.elem` x) $ B.pack ['a' .. 'z']

toString
  :: Maybe Char -> String
toString (Just c) = [c]
toString Nothing  = "None"
