module Main
    where

import Data.List

main = print . sum . nub $ [3,6..999] ++ [5,10..999]
