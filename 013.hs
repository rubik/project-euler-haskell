module Main
    where

import Control.Monad

default (Integer)

main = putStrLn . take 10 . show . sum . map read . lines =<< readFile "013.txt"
