module Main
    where

fibs :: [Integer]
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

main :: IO ()
main = print . fst . head . filter ((999<) . length . show . snd) .
       zip [1..] $ fibs
