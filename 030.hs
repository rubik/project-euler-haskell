module Main
    where

import Data.Char

power :: Int -> Int
power = sum . map ((^5) . digitToInt) . show

main = print . sum . filter (\n -> n==power n) $ [10..999999]
