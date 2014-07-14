module Main
    where

import Utils
import Data.Ratio

ring :: Integer -> [Integer]
ring n = [l, l + 2*n, l + 4*n, l + 6*n]
    where l = 4*n^2 - 2*n + 1

ringPrimes :: Integer -> Int
ringPrimes = length . filter ((==1) . length . factors) . ring

main :: IO ()
main = print . (+1) . (*2) . round . fst . head .
       filter (\(l,p) -> 0.10 > (fromIntegral p / (4*l + 1))) .
       zip [1..] . tail $ scanl (\a k -> a + ringPrimes k) 0 [1..]
