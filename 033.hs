module Main
    where

import Data.Ratio

isCurious :: Int -> Int -> Int -> Bool
isCurious a b c = ((10*a + b) % (10*b + c)) == a%c

main :: IO ()
main = print . denominator . product $
    [a%c | a <- [1..9], b <- [1..9], c <- [1..9], a /= b, a /= c, isCurious a b c]
