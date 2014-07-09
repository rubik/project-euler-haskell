module Main
    where

import Data.Char

factorial :: Integer -> Integer
factorial n = product [1..n]

main :: IO ()
main = print . sum . map digitToInt . show . factorial $ 100
