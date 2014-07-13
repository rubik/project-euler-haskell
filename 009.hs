module Main
    where

import Utils
import Data.List

main :: IO ()
main = print (2*m^5*n - 2*m*n^5)
    where
        m = head [m | m <- sort . divisors $ 500, let n = 500 `div` m - m,
                  n > 0, m > n]
        n = 500 `div` m - m
