module Grafo(
    subdivideAresta,
    suavizaVértice,
    coloreVérticesIngênuo,
    coloreVértices,
    coloreMaiorPrimeiro,
    intervaloIndiceCromático,
    éRoda,
    índiceCromCiclo,
    índiceCromRoda,
    índiceCromKn,
    coloreArestasCiclo,
    coloreArestasRoda,
    coloreArestasKn,
    coloreArestasBipartido,
    coloreArestas

    )where


import GrafoListAdj
import Data.List


subdivideAresta g (v,w) n = novoGrafo grafo arest
    where 
        grafo = length (vértices g) + n
        arest = removeAresta g (v,w)

suavizaVértice g v
    | grau v /= 2 = g
    | otherwise  =  removeVértice g

coloreVérticesIngênuo g = [n | n <- [1 .. (length (vértices g))]

coloreVértices g = [n | n <- [0..length (vértices g)]

coloreMaiorPrimeiro g = [n | n <- [0 .. sort((length (seqGraus g)))]

intervaloIndiceCromático g = (grauMax g, grauMax g + 1)

éRoda g = (grauMax g == length (vértices g) - 1)

índiceCromCiclo g = 
    | éGrafoCiclico g == False = 0
    | mod length(vértices g) 2 == 0 = 2
    |otherwise = 3

índiceCromRoda g = 
    | éRoda g == False = 0
    | mod length (vértices g) 2 == 0 = 4
    | otherwise = 3

índiceCromKn g =
    | éCompleto g == False = 0
    | mod length (vértices g) 2 == 0 =length(vértices g) -1 
    | otherwise = length(vértices g)

coloreArestasCiclo g =
    | éGrafoCiclico g == False = []
    | otherwise = [(a,n) | (a,n) <- (arestas g,[1..(índiceCromCiclo g)])]

coloreArestasRoda g =
    | éRoda g == False = []
    | otherwise = [(a,n) | (a,n) <- (arestas g,[1..(índiceCromRoda g)])]

coloreArestasKn g =
    | éCompleto g == False = []
    | otherwise = [(a,n) | (a,n) <- (arestas g,[1..(índiceCromKn g)])]

coloreArestasBipartido g =
    | éBipartido g == False = []
    | otherwise = [(a,n) | (a,n) <- (arestas g,[1..2)])]

coloreArestas g =
    | éGrafoCiclico g == True = coloreArestasCiclo g
    | éRoda g == True = coloreArestasRoda g
    | éCompleto g == True = coloreArestasKn g
    | éBipartido g == True = coloreArestasBipartido g
    | otherwise = []



-- Funções Complementares --

éGrafoCíclico g = éKRegular g 2

éKRegular g k = iguais (seqGraus g) && head(seqGraus g) == k

iguais :: (Eq a) => [a] -> Bool
iguais xs = and $ map (== head xs) (tail xs)

éCompleto g = iguais (seqGraus g) && (head(seqGraus g) == (length(vértices g) - 1))

éBipartido g v1 v2 = adj && (naoadj v1) || (naoadj v2)
 where
 adj = foldr (&&) True [adjacente g x y | x <- v1, y <- v2]
 naoadj v = foldr (&&) True [not (adjacente g x y) | (x, y) <- (form v)]

form [] = []
form [_] = []
form (x:y:t) = [(x, y)] ++ form (x:t) ++ form (y:t) 

seqGraus g = (sort [length(vizinhos g v)| v <- (vértices g)])