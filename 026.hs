module Main
    where

import Data.List (maximumBy, elemIndex)
import Data.Ord (comparing)

remainders:: Int -> Int -> [Int] -> Int
remainders d 0 rs = 0
remainders d r rs = let r' = r `mod` d
                     in case elemIndex r' rs of
                            Just i  -> i + 1
                            Nothing -> remainders d (10*r') (r':rs)

main :: IO ()
main = print . fst $ maximumBy (comparing snd) [(n, cycleLength n) | n <- [1..999]]
        where cycleLength d = remainders d 10 []
