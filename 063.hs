module Main
    where

-- 10^(n-1) <= x^n < 10^n
main :: IO ()
main = print $ sum [1 | x <- [1..9], y <- [1..l], y==length (show $ x^y)]
    where l = ceiling $ 1 / (1 - logBase 10 9)
