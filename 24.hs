module Main
    where

import Data.List
import Utils

-- Unlike the usual definition of reminder, here it is 0 < r <= b
qrm :: Int -> Int -> (Int, Int)
qrm a b
    | r == 0    = (q-1, a - b * (q - 1))
    | otherwise = (q,r)
        where (q,r) = divMod a b

indexes :: Int -> Int -> [Int]
indexes 0 p = []
indexes n p = q : indexes (n-1) r
    where (q,r) = qrm p $ factorial n

build :: (Eq a) => [a] -> [Int] -> [a]
build s [] = s
build s (i:is) = let e = s!!i
                  in e : build (delete e s) is

main :: IO ()
main = putStrLn . build "0123456789" . indexes 9 $ 1000000
