{- ABC086B -1 21

For the input
  a b
consider the concatenation of them.
If this concatenation is a square number, then print
  Yes
otherwise
  No
.

-}

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  putStrLn . isSquare' $ concatenate a b

isSquare 
  :: Int -> Bool
isSquare = helper 1
  where
    helper :: Int -> Int -> Bool
    helper 1 1 = True
    helper x y
      | x^2 <  y  = helper (x+1) y
      | x^2 == y  = True
      | otherwise = False

isSquare' 
  :: Int -> String
isSquare' n
  | isSquare n = "Yes"
  | otherwise  = "No"

concatenate
  :: Int -> Int -> Int
concatenate a b = read $ (show a) ++ (show b)
