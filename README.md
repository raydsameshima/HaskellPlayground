# HaskellPlayground
Experiments of Haskell programming, especially AtCoder.

See 
[A good reference in Japanse](https://qiita.com/drken/items/fd4e5e3630d0f5859067#5-%E9%81%8E%E5%8E%BB%E5%95%8F%E7%B2%BE%E9%81%B8-10-%E5%95%8F)

[AtCoder Beginners Selection](https://atcoder.jp/contests/abs)

See, [totemo kawaii](https://myuon.github.io/posts/haskell-atcoder/).

# IO
String = [Char] is too slow.

## Data.ByteString.Char8
See the discussion in 
[Data.Text vs Data.ByteString.Char8](https://stackoverflow.com/questions/8916107/data-text-vs-data-bytestring-char8)

Instead of using

```haskell

main = do
  as <- map read . words <$> getLine
  ...

```

we must use Data.ByteString.Char8:

```haskell

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main = do
  as <- readInts
  ...

```

# GHC language extensions
[A good start wll be here.](https://haskell.jp/blog/posts/2018/about-ghc-exts-1.html)

## BangPattern
TBA

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
Data.ByteString.Char8

[abc113_b](https://atcoder.jp/contests/abc113/tasks/abc113_b)
Data.ByteString.Char8

[abc072_b](https://atcoder.jp/contests/abc072/tasks/abc072_b)

[abc053_b](https://atcoder.jp/contests/abc053/tasks/abc053_b)
Data.ByteString.Char8

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

Integers (decimal numbers) and for loop.

### Related problems
[abc080_b](https://atcoder.jp/contests/abc080/tasks/abc080_b)

[abc090_b](https://beta.atcoder.jp/contests/abc090/tasks/abc090_b)

[agc025_a](https://beta.atcoder.jp/contests/agc025/tasks/agc025_a)
Vector performs well.
Indeed, the interface is easy and clear.

## ABC 088 B - Card Game for Two

Sorts, Greedy

### Related problems
[abc067_b](https://atcoder.jp/contests/abc067/tasks/abc067_b)

[abc042_b](https://beta.atcoder.jp/contests/abc042/tasks/abc042_b)
Data.ByteString.Char8

[agc027_a](https://atcoder.jp/contests/agc027/tasks/agc027_a)
Data.ByteString.Char8

[agc012_a](https://atcoder.jp/contests/agc012/tasks/agc012_a)
Data.ByteString.Char8


## ABC 085 B - Kagami Mochi
[abc085_b](https://atcoder.jp/contests/abc085/tasks/abc085_b)
Data.ByteString.Char8

### Related problems
[abc071_b](https://atcoder.jp/contests/abc071/tasks/abc071_b)
Data.ByteString.Char8

[abc061_b](https://atcoder.jp/contests/abc061/tasks/abc061_b)
Data.ByteString.Char8

[abc091_b](https://atcoder.jp/contests/abc091/tasks/abc091_b)
Data.ByteString.Char8

[arc086_a](https://atcoder.jp/contests/abc081/tasks/arc086_a)
Data.ByteString.Char8

Note: my implementation uses only List as the data structure.
The execution time is so far beyond ok line, but some additional factor may be earned.

By the way, why this link is not self-consistent?
I mean, the title after constests in its url differs from the last arc086_a.

## ABC 085 C - Otoshidama
[abc085_c](https://atcoder.jp/contests/abc085/tasks/abc085_c)

Double, or triple folded for-loops (still eager search)

Initial attempt was using list comprehension to filter a correct combination.
It basically the same as double-for-loops as in [https://qiita.com/drken/items/fd4e5e3630d0f5859067#第-8-問--abc-085-c---otoshidama-300-点](https://qiita.com/drken/items/fd4e5e3630d0f5859067#第-8-問--abc-085-c---otoshidama-300-点)

Second attempt is much faster; first construct the ideal combination to pay Y-yen, maximumizing 10000-bills, then exchanging into smaller bill to reach the given N-bills.

### Related problems
[abc088_c](https://atcoder.jp/contests/abc088/tasks/abc088_c)
Data.ByteString.Char8

We do not need to find a solution, but to say the existance.

[arc096_a](https://atcoder.jp/contests/arc096/tasks/arc096_a)
Data.ByteString.Char8

Simple comparison.

[abc057_c](https://atcoder.jp/contests/abc057/tasks/abc057_c)
Data.ByteString.Char8

Prime factors.
It requires factor 2 in execution time and memory usage.

[arc083_a](https://atcoder.jp/contests/abc074/tasks/arc083_a)
Data.ByteString.Char8

Need better implementation, say factor 3.
Filter has to be done only once. 
