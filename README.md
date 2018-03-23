# HaskellPlayground
Experiments of Haskell programming.

AtCoder.

# IO
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


# Usefull links
## Category Theory for Programmers
[Category Theory for Programmers: The Preface](https://bartoszmilewski.com/2014/10/28/category-theory-for-programmers-the-preface/)



