module Main
    where

import Data.List
import Utils

main :: IO ()
main = print . sum . map fst . filter (\(i,n) -> n < 10000 && i /= n &&
        i == k !! fromInteger (n - 1)) . zip [1..] $ k
    where
        k = map (sum . init . sort . divisors) [1..10000]
