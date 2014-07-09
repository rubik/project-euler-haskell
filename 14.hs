module Main
    where

import Data.List

-- Just to showcase unfoldr's power
collatzSeq :: Integer -> [Integer]
collatzSeq = unfoldr coll
    where
        coll 0 = Nothing
        coll 1 = Just (1,0)
        coll n
            | even n    = Just (n,n `div` 2)
            | otherwise = Just (n,3*n + 1)

collatz :: Integer -> Integer
collatz 1 = 1
collatz n
    | even n    = 1 + collatz (n `div` 2)
    | otherwise = 1 + collatz (3 * n + 1)

maxCollatz :: Integer -> Integer
maxCollatz n = foldl ff (0,0) $ map (\x -> (x, collatz x)) $ [1..n]
    where ff acc@(x,y) it@(x',y') = if y > y' then acc else it

main :: IO ()
main = print . fst . maxCollatz $ 999999
