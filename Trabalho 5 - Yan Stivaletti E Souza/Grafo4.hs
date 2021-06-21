module Grafo(
    éArvore,
    éEstrela,
    éFloresta,
    folhas,
    internos,
    éArvoreBin,
    éArvoreBinEstrita,
    éArvoreBinCompleta,
    éÁrvoreM,
    prufer,
    decodPrufer,
    éSeqVálida,
    numÁrvRotuladas
    )where

import GrafoListAdj
import Data.List





éArvore g = éConexo && (nãoéCircuito g [] [head(vértices g)])
  where
    éConexo = foldr (&&) True [not(éIsolado g v)|v <- vértices g]


éEstrela g = first && middle && end
 where
 end = (last_list (seqGraus g)) == (length (vértices g) - 1)
 first = head(seqGraus g) == 1
 middle = foldr (&&) True (map (== 1) (noExtrem(seqGraus g)))

last_list :: [a] -> a
last_list = foldr1 (\_ a -> a)


éFloresta g = not(éGrafoCíclico g) && not(éConexo)
  where
    éConexo = foldr (&&) True [not(éIsolado g v)|v <- vértices g]


folhas a = [v | v <- (vértices a), (length(vizinhos a v) == 1)]

internos a = [v | v <- (vértices a), (length(vizinhos a v) /= 1)]

éArvoreBin a r = éArvore a && (head(vértices a) == r)

éArvoreBinEstrita a r = (éArvore a) && (éEstrita a [] r)

éEstrita g v [] = True
éEstrita g v (h:t)
 |((nabor) == False) = False
 |otherwise = éEstrita g newNabors (child ++ t)
 where
 child = [adj | adj <- vizinhos g h, not (elem adj v)]
 nabor = (length(child) == 0 || length(child) == 2) 
 newNabors = if not (elem h v) then v ++ [h]  
 else v

éBináriaEstrita g = (éArvore g) && (éEstrita g [] [head(vértices g)])

éÁrvoreM a r m = (éArvore a) && (aria m a r r)

éArvoreBinCompleta a r = (éArvore a) && (éCompleta a r r)

éCompleta g v [] = True
éCompleta g v (h:t)
 |((nabor) == False) = False
 |otherwise = éCompleta g newNabors (child ++ t)
 where
 child = [adj | adj <- vizinhos g h, not (elem adj v)]
 nabor = (length(child) == 0 || length(child) == 1) 
 newNabors = if not (elem h v) then v ++ [h]  
 else v

 éArvoreMCheia a r m = (éArvore a)  && (éBináriaEstrita a) && (éArvoreBinCompleta a r)


prufer a = prufer1 a [] 
 where 
 prufer1 a lista 
  |not(éArvore a) = []
  |(length(vértices a) == 2) = [head(vértices a)] ++ []
  |otherwise = part_2 ++ (prufer1 newg newl)
   where
   part_1 = minimum(folhas a)
   part_2 = (vizinhos a part_1)
   newg = (removeVértice a part_1)
   newl = (lista ++ [part_1])

decodPrufer c =
 let n = length(c) + 2 in novoGrafo n (decod c [1..n])
 where
 decod [] (x:xs:[]) = [(x,xs)]
 decod v l = 
  let 
  minmn = (minimum(filter (\y -> not(elem y v)) l))
  rest = head(v) in [(minmn,rest)] ++ decod (tail v) (filter (/= minmn) l)

éSeqVálida s = (sum s) == (2*(length s) - 2)

numÁrvRotuladas s = div (first_part (length s)) (second_part s)


--Funções Auxiliares 

éIsolado g v = (vizinhos g v) == []

éGrafoCíclico g = éKRegular g 2

éKRegular g k = same (seqGraus g) && head(seqGraus g) == k

same :: (Eq a) => [a] -> Bool
same xs = and $ map (== head xs) (tail xs)

seqGraus g = (sort [length(vizinhos g v)| v <- (vértices g)])

noExtrem :: [a] -> [a]                   -- A função noExtrem retira as extremidades de um grafo
noExtrem [] = []          
noExtrem [h] = []
noExtrem t = tail (init t)

nãoéCircuito g visitados [] = True
nãoéCircuito g visitados (x:y) 
 |(elem x visitados) = False
 |otherwise = nãoéCircuito g novosVisitados pilha
  where
  pilha = [adj | adj <- vizinhos g x, not (elem adj visitados)] ++ y
  novosVisitados = visitados ++ [x]

fatorial 0 = 1
fatorial 1 = 1
fatorial n = fatorial' n 1
  where 
    fatorial' 0 r = r
    fatorial' n r = fatorial' (n-1) (r*n)

second_part [x] = fatorial (x-1)
second_part (x:xs) =  (fatorial (x-1)) * (second_part xs)

first_part x = fatorial (x-2)

aria m g v [] = True
aria m g v (h:t)
 |((nabor) == False) = False
 |otherwise = aria m g newNabors (nodes ++ t)
 where
 nodes = [adj | adj <- vizinhos g h, not (elem adj v)]
 nabor = (length(nodes) <= m) 
 newNabors = if not (elem h v) then v ++ [h]  
 else v
