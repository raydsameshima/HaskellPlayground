# HaskellPlayground
Experiments of Haskell programming.

AtCoder.

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



