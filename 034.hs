module Main
    where

import Data.Char
import Utils

main :: IO ()
main = print . sum . filter isCurious $ [10..100000]
    where isCurious n = n == sum (map (factorial . digitToInt) $ show n)
