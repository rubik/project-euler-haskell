module Main
    where

import Control.Applicative

main :: IO ()
main = print $ liftA2 (-) ((^2) . sum) (sum . map (^2)) [1..100]
