module Main
    where

import Data.List

main :: IO ()
main = print . head . filter cand $ [99999,100008..]
    where cand n = (==1) . length . group . map (sort . show) $
            [n, 2*n, 3*n, 4*n, 5*n, 6*n]
