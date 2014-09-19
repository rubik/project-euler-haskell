module Main
    where

import Utils
import Data.Ord (comparing)
import Data.List (group, maximumBy)


triples :: Integer -> [[Integer]]
triples p = concatMap (select p) [7..(p - 12) `div` 3]
    where select p r = [triple | (s,t) <- divisorPairs $ r^2 `div` 2,
                        let triple = [r + s, r + t, r + s + t],
                        sum triple == p,
                        let gcds = [gcd a b | a <- triple, b <- triple,
                                    a /= b],
                        (length . group $ gcds) == 1]

main :: IO ()
main = print . fst . maximumBy (comparing snd) $
    [(n, length $ triples n) | n <- [12..1000]]
