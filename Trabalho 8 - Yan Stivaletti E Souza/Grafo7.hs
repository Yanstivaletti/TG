module Grafo (
    representação,
    completa,
    conta,
    coloraçõesKn,
    combinações,
    totalColoraçõesKn

)where

import GrafoListAdj
import Data.List

representação :: Int -> Int -> [Int]
representação base numero =
    |numero <= 0 = []
    |otherwise = (representação base (numero `div` base)) ++ [(mod numero base)]

completa:: [Int] -> Int -> [Int]
completa xs n =
    |n == length(xs) = xs
    |otherwise = 0:(completa xs (n-1)) 

conta:: Int -> Int -> Int -> Int -> [[Int]]
conta b larg min max = [representação b n | n <-[min..max], length (representação b n) <= larg]

coloraçõesKn n r = [novoGrafo i j| i <- [1..n], j<-[((1..n],[1..n),[0..r])]

totalColoraçõesKn n r =
    |mod n 2 == 0 = (n-1) * r
    |otherwise  = n * r

combinações k ns = filter ((k==).length) (subsequences ns)


