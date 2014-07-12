module Main
    where

tri :: [Integer]
tri = map (\n -> n * (n + 1) `div` 2) [1..]

divisors :: Integer -> [Integer]
divisors n = 1 : n : (concatMap (\i -> [i, n `div` i]) .
                      filter (\i -> n `mod` i == 0) $
                      takeWhile (\i -> i*i <= n) [2..])

main :: IO ()
main = print . head . dropWhile ((500>) . length . divisors) $ tri
