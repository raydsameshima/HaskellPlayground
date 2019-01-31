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

# Usefull links
## Category Theory for Programmers
[Category Theory for Programmers: The Preface](https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/)

# 10 types of problems
## ABC 086 A - Product
[abc086_a](https://atcoder.jp/contests/abc086/tasks/abc086_a)

