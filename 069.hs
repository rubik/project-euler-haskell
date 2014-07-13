module Main
    where

import Data.List
import Utils

-- For n/phi(n) to be at a maximum, phi(n) has to be at a minimum.
-- Since phi(n) = product(1 - 1/p) for every prime factor p of n,
-- phi(n) hits a maximum at every primorial p_k.

main :: IO ()
main = print . last . takeWhile (<1000000) . map product . tail . inits $ primes
