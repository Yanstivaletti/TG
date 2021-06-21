module Grafo
   (Grafo,
    éTrivial,      
    éIsolado,       
    éTerminal,    
    éPar,  
    éImpar,      
    seqGraus,          
    grauMax,       
    grauMin,       
    éRegular,        
    éKRegular,      
    éVazio,     
    éNulo,
    éCompleto,
    éKn,
    grafoCompleto,
    grafoComplemento,
    éSubgrafo,
    éSubgrafoPróprio,
    éSubgrafoInduzidoVértices,
    éSubgrafoInduzidoArestas,
    éClique,
    éCjIndependenteVértices,
    união,
    interseção,
    soma
   ) where

import GrafoListAdj
import Data.List 



éTrivial g = length(vértices g) == 1
 

éIsolado g v = (vizinhos g v) == []


éTerminal g v = length(vizinhos g v) == 1

éPar g v = mod (length(vizinhos g v)) 2 == 0


éImpar g v = mod (length(vizinhos g v)) 2 /= 0 

seqGraus g = (sort [length(vizinhos g v)| v <- (vértices g)])

grauMax :: Grafo -> Int
grauMax g = maximum(seqGraus g)

grauMin:: Grafo -> Int
grauMin g = head(seqGraus g)

iguais :: (Eq b) => [b] -> Bool
iguais xs = and $ map (== head xs) (tail xs)

éRegular :: Grafo -> Bool
éRegular g = iguais (seqGraus g)

éKRegular :: Grafo ->Int -> Bool
éKRegular g k = iguais (seqGraus g) && head(seqGraus g) == k

éVazio :: Grafo -> Bool
éVazio g = length(vértices g) > 0 && length(arestas g) == 0

éNulo :: Grafo -> Bool
éNulo g = length(vértices g) == 0

éCompleto :: Grafo -> Bool
éCompleto g = iguais (seqGraus g) && (head(seqGraus g) == (length(vértices g) - 1))
 

éKn g n = iguais (seqGraus g) && (head(seqGraus g) == (length(vértices g) - 1)) && (length(vértices g) == n)
 
arestaGrafoCompleto :: Int -> [(Int,Int)]
arestaGrafoCompleto 0 = []
arestaGrafoCompleto n = [(x1, x2) | x1 <- [1..n], x2 <- [x1..n], x1 /= x2]

grafoCompleto n = novoGrafo n (arestaGrafoCompleto n)

--16)
arestagrafoComplemento :: Int -> Grafo -> [(Int,Int)]
arestagrafoComplemento 0 g = []
arestagrafoComplemento n g = [(x1, x2) | x1 <- [1..n], x2 <- [x1..n], x1 /= x2, not (adjacente g x1 x2)]

grafoComplemento g = novoGrafo (length(vértices g)) (arestagrafoComplemento (length(vértices g)) g)

éSubgrafo :: Grafo -> Grafo -> Bool
éSubgrafo h g = p && ad
 where
 p = foldr (&&) True [pertence g v | v <- vértices h]
 ad = foldr (&&) True [adjacente g x y | (x,y) <- arestas h]

éSubgrafoPróprio  :: Grafo -> Grafo -> Bool
éSubgrafoPróprio h g = subg && tam
 where
 subg = éSubgrafo h g 
 tam = length(arestas h) <= length(arestas g) && length(vértices h) < length(vértices g)
 
 
éSubgrafoInduzidoVértices :: Grafo -> Grafo -> [Int] -> Bool
éSubgrafoInduzidoVértices h g vh = subg && p && ad
 where 
 subg = (éSubgrafo h g) 
 p = (foldr (&&) True [pertence g v | v <- vh]) 
 ad = (foldr (&&) True [adjacente h v1 v2 | v1 <- vh, v2 <- vh, adjacente g v1 v2])



éSubgrafoInduzidoArestas h g ah = subg && p && ad 
 where 
 subg = éSubgrafo h g 
 p = (foldr (&&) True [(pertence h v1) && (pertence h v2)| (v1, v2) <- ah, pertence g v1, pertence g v2])
 ad = (foldr (&&) True [adjacente g a1 a2 | (a1, a2) <- ah])
 

éClique :: Grafo -> Grafo -> Bool
éClique h g = (éSubgrafo h g) && (éCompleto h)
 
éCjIndependenteVértices :: Grafo -> Grafo -> Bool
éCjIndependenteVértices h g = (éSubgrafo h g) && (éVazio h)

união :: Grafo -> Grafo -> Grafo
união h g = novoGrafo vertice aresta
 where 
 vertice = max (maximum(vértices g)) (maximum(vértices h))
 aresta = union (arestas h) (arestas g)

interseção:: Grafo -> Grafo -> Grafo
interseção g h = novoGrafo vertice aresta 
 where 
 vertice = min (maximum(vértices g)) (maximum(vértices h))
 aresta = intersect (arestas h) (arestas g)


soma :: Grafo -> Grafo -> Grafo
soma h g = novoGrafo v (union (union (union apenasG apenasH) nenhum) (intersect (arestas g) (arestas h)))
 where 
 u = união h g
 vg = vértices g
 vh = vértices h
 v = length(union vg vh) 
 apenasG = [(a1, a2) | (a1, a2) <- arestas g, not (adjacente h a1 a2)]
 apenasH = [(a1, a2) | (a1, a2) <- arestas h, not (adjacente g a1 a2)]
 nenhum = repetidos ([(a1, a2) | a1 <- vh, a2 <- vg, a1 /= a2, not(adjacente u a1 a2)])
 
ad (x, y) (w, z) = ((x, y) /= (w, z)) && ((x, y) /= (z, w))

repetidos [] = []
repetidos (x:xs) = x:(repetidos (filter (ad x) xs))
