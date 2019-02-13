{- ABC071B.hs

-}

import qualified Data.ByteString.Char8 as B

main :: IO ()
main = do
  s <- B.getLine
  putStrLn . toString . none' $ s

none'
  :: B.ByteString -> Maybe Char
none' x 
  = if B.null fx then Nothing
                 else Just $ B.head fx
  where
    fx = B.dropWhile (`B.elem` x) $ B.pack ['a' .. 'z']

toString
  :: Maybe Char -> String
toString (Just c) = [c]
toString Nothing  = "None"
