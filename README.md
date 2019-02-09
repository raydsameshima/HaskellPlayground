# HaskellPlayground
Experiments of Haskell programming.

AtCoder.
See 
[A good reference in Japanse](https://qiita.com/drken/items/fd4e5e3630d0f5859067#5-%E9%81%8E%E5%8E%BB%E5%95%8F%E7%B2%BE%E9%81%B8-10-%E5%95%8F)

# IO
## fixed number of inputs
For the following type of inputs

```
a
b c
```

use

```hs
main = do
  a     <- readLn
  [b,c] <- map read . words <$> getLine
  ...
```

## non-fixed number of inputs
If the input is 

```hs
n   -- the total number of the follwoing data
d1  -- 1 st data
...
dn  -- n th data
```

use

```hs
import Control.Monad (replicateM)

main = do
  n  <- readLn
  ds <- replicateM n readLn
```

## Data.ByteString.Char8
See the discussion in 
[Data.Text vs Data.ByteString.Char8](https://stackoverflow.com/questions/8916107/data-text-vs-data-bytestring-char8)

Instead of using

```hs
main = do
  as <- map read . words <$> getLine
  ...

```

we may use Data.ByteString.Char8:

```hs
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

getParm :: IO [Int]
getParm = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main = do
  as <- getParm
  ...

```

# Usefull links
## Category Theory for Programmers
[Category Theory for Programmers: The Preface](https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/)

# 10 types of problems
See, again
[A good reference in Japanse](https://qiita.com/drken/items/fd4e5e3630d0f5859067#5-%E9%81%8E%E5%8E%BB%E5%95%8F%E7%B2%BE%E9%81%B8-10-%E5%95%8F)


## ABC 086 A - Product
[abc086_a](https://atcoder.jp/contests/abc086/tasks/abc086_a)

Mod, or rem.
For non-negative integers, use rem.
(see [https://twitter.com/mod_poppo/status/1092144670526791680](https://twitter.com/mod_poppo/status/1092144670526791680))

### Related problems
[abc064_a](https://atcoder.jp/contests/abc064/tasks/abc064_a)
[abc088_a](https://atcoder.jp/contests/abc088/tasks/abc088_a)
[abc082_a](https://atcoder.jp/contests/abc082/tasks/abc082_a)

### Note
As a common technique, e.g., if we want to calculate the round up the mean of a,b::Int,

```hs
  (a+b+1) `div` 2
```

that is, we do not need to write like

```hs
  kiriage a b
    | even (a+b) = (a+b)   `div` 2
    | otherwise  = (a+b+1) `div` 2 
```
  
## ABC 081 A - Placing Marbles
[abc081_a](https://atcoder.jp/contests/abc081/tasks/abc081_a)

Brute-force search.

### Related problems
[abc095_a](https://atcoder.jp/contests/abc095/tasks/abc095_a)

[abc085_a](https://atcoder.jp/contests/abc085/tasks/abc085_a)

[abc069_b](https://atcoder.jp/contests/abc069/tasks/abc069_b)

[abc082_b](https://atcoder.jp/contests/abc082/tasks/abc082_b)

## ABC 081 B - Shift Only
[abc081_b](https://atcoder.jp/contests/abc081/tasks/abc081_b)

For loop

### Related problems
[abc068_b](https://atcoder.jp/contests/abc068/tasks/abc068_b)

[abc102_b](https://atcoder.jp/contests/abc102/tasks/abc102_b)

[abc113_b](https://atcoder.jp/contests/abc113/tasks/abc113_b)

[abc072_b](https://atcoder.jp/contests/abc072/tasks/abc072_b)

[abc053_b](https://atcoder.jp/contests/abc053/tasks/abc053_b)

[abc095_b](https://atcoder.jp/contests/abc095/tasks/abc095_b)

## ABC 087 B - Coins
[abc087_b](https://atcoder.jp/contests/abc087/tasks/abc087_b)

Dynamic Programming (DP) algorithm

[How is Dynamic programming different from Brute force](https://cs.stackexchange.com/questions/23599/how-is-dynamic-programming-different-from-brute-force)

### Related problems
[abc105_b](https://atcoder.jp/contests/abc105/tasks/abc105_b)

[arc004_1](https://arc004.contest.atcoder.jp/tasks/arc004_1)

[abc051_b](https://atcoder.jp/contests/abc051/tasks/abc051_b)

## ABC083 B - Some Sums
[abc083_b](https://atcoder.jp/contests/abc083/tasks/abc083_b)


