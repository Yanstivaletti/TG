module Grafo2(
    fundeVértices,
    contraiVértices,
    contraiAresta,
    éPasseio,
    éPasseioAberto,
    éPasseioFechado,
    éTrilha,
    éCaminho,
    éCiclo,
    éGrafoCíclico,
    éCn,
    éGrafoCaminho,
    éPn,
    éGrafoBipartido,
    éTrilhaEuleriana,
    éGrafoEuleriano,
    éSemiEuleriano,
    éHamiltonianoOre,
    éHamiltonianoDirac,
    fecho,
    buscaGenérica,
    buscaLargura,
    buscaProfundidade,
    )where

import GrafoListAdj
import Data.List



fundeVértices g v w = removeVértice (novoGrafo verticesLength (a++filt)) maximo
 where
 verticesLength = length(vértices g) - 1
 minimo = min v w
 maximo = max v w
 a = [(a1, minimo) | a1 <- vizinhos g maximo]
 filt = filter (\(x,y) -> x /= maximo && y /= maximo) ar
 ar = [(a1, a2) | (a1, a2) <- arestas g]

contraiVértices g v w = removeVértice (novoGrafo verticesLength fusão) (max v w)
 where 
 fusão = arestas (fundeVértices g v w)
 verticesLength = length(vértices g) - 1

contraiAresta g (v,w) = novoGrafo verticesLength fusão
 where
 arestaRemovida = removeAresta g (v,w)
 fusão = arestas (fundeVértices arestaRemovida v w)
 verticesLength = length(vértices g) - 1

éPasseio g vs = checaAdj g vs

ultimo :: [b] -> b
ultimo = foldr1 (\_ b -> b)

éPasseioAberto g vs = (éPasseio g vs) && head(vs) /= ultimo(vs)
 
éPasseioFechado g vs = (éPasseio g vs) && head(vs) == ultimo(vs)

éTrilha g vs = (éPasseio g vs) && saoDiferentes
 where 
 saoDiferentes = arestasDiff (geraArestas vs)

éCaminho g vs = (éTrilha g vs) && (verticesDiff vs)

éCiclo g vs = (éTrilha g a) && extremos
 where 
 extremos = (head(vs) == ultimo(vs))
 a = noExtrem vs

éGrafoCíclico g = éKRegular g 2
 
éCn g n = (éGrafoCíclico g) && length(vértices g) == n
 
éGrafoCaminho g = éCaminho g (vértices g)
 
éPn p n = (éGrafoCaminho p) && length(vértices p) == n

éGrafoBipartido g vert1 vert2 = adj && (naoadj vert1) || (naoadj vert2)
 where
 adj = foldr (&&) True [adjacente g x y | x <- vert1, y <- vert2]
 naoadj v = foldr (&&) True [not (adjacente g x y) | (x, y) <- (geraArestas v)]

éTrilhaEuleriana g t = (éTrilha g t) && (foldr (&&) True trilha) && (length(trilha) == length (arestas g))
 where
 trilha = [adjacente g x y | (x, y) <- (geraArestas t)]

éGrafoEuleriano g = geuleriano
 where
 geuleriano = foldr (&&) True [even x | x <- seqGraus g]

éSemiEuleriano g = impares (seqGraus g) == 2

éHamiltonianoOre g = qtdvertice >= 3 && soma
 where 
 qtdvertice = length(vértices g)
 naoAdj = repetidos[(v,w) | v <- vértices g, w <- vértices g, v /= w, not(adjacente g v w)]
 soma = foldr (&&) True [(length(vizinhos g v) + length(vizinhos g w)) >= qtdvertice | (v,w) <-naoAdj]

éHamiltonianoDirac g = qtdvertice >= 3 && grau
 where
 qtdvertice = length(vértices g)
 grau = foldr (&&) True [length(vizinhos g v) >= (div qtdvertice 2) | v <- vértices g]

fecho g 
 |éCompleto g = g 
 |otherwise = concatFecho (insereFecho g) g

buscaGenérica g = ordembusca g [head (vértices g)] [head (vértices g)] 

buscaLargura g = ordemBuscaLargura g [head (vértices g)] [head (vértices g)] 

buscaProfundidade g = ordemBuscaProfundidade g [head (vértices g)] [head (vértices g)] 

-- Funções Complementares --

seqGraus g = (sort [length(vizinhos g v)| v <- (vértices g)])

éRegular g = iguais (seqGraus g)

éCompleto g = iguais (seqGraus g) && (head(seqGraus g) == (length(vértices g) - 1))

iguais :: (Eq b) => [b] -> Bool
iguais xs = and $ map (== head xs) (tail xs)

ad (x, y) (w, z) = ((x, y) /= (w, z)) && ((x, y) /= (z, w))

repetidos [] = []
repetidos (x:xs) = x:(repetidos (filter (ad x) xs))

éKRegular g k = iguais (seqGraus g) && head(seqGraus g) == k

checaAdj g [x] = True                              -- A função checaAdj checa se 
checaAdj g [] = True                               -- todos os vértices são adjacentes
checaAdj g (h1:h2:t)  
 |not (adjacente g h1 h2) = False
 |otherwise = checaAdj g (h2:t)

criaAresta [] = []                                     -- A função criaAresta cria arestas
criaAresta [_] = []                                    -- entre dois vertices, unido-os um por um
criaAresta (h1:h2:t) = [(h1, h2)] ++ criaAresta (h2:t) 

arestasDiff :: [(Int, Int)] -> Bool
arestasDiff [] = True                                  --A função arestasDiff mostra se as 
arestasDiff [_] = True                                 --arestas são diferentes (True) ou não (False)
arestasDiff ((x, h):t) 
 |elem (x, h) t || elem (h, x) t = False
 |otherwise = arestasDiff t

verticesDiff :: [Int] -> Bool                   -- A função verticesDiff mostra se as
verticesDiff [] = True                          -- os vertices são diferentes (True) ou não (False)
verticesDiff [_] = True
verticesDiff (h:t) 
 |elem h t = False
 |otherwise = verticesDiff t

noExtrem :: [a] -> [a]                   -- A função noExtrem retira as extremidades de um grafo
noExtrem [] = []          
noExtrem [h] = []
noExtrem t = tail (init t)

geraArestas [] = []            --A função geraArestas gera todas as arestas possíveis a partir dos vértices
geraArestas [_] = []
geraArestas (h1:h2:t) = [(h1, h2)] ++ geraArestas (h1:t) ++ geraArestas (h2:t) 

impares :: [Int] -> Int
impares  [] = 0              -- A função Impares conta quantos numeros impares existem em uma lista
impares  (h1:h2)
 |odd h1 == True = 1 + (impares h2)
 |otherwise = impares h2

-- A função insereFecho retorna uma lista de arestas que serão inseridas do fecho
insereFecho g = repetidos[(v,w) | v <- vértices g, w <- vértices g, v /= w, not(adjacente g v w)]


concatFecho [] g = g                                    -- A função concatFecho concatena as arestas para formar o fecho
concatFecho (a:t) g = concatFecho t (novaAresta g a)


ordembusca g visitados [] = visitados                                   --A função Ordembusca marca vértices
ordembusca g visitados (h1:h2) = ordembusca g nVisitados fila         -- visitados e retorna a ordem de busca do grafo
 where
 fila = [adj | adj <- vizinhos g h1, not (elem adj visitados)] 
 nVisitados = if not (elem h1 visitados) then visitados ++ h2 ++ [h1]  
 else visitados


ordemBuscaLargura g visitados [] = visitados                                        --Função ordemBuscaLargura marca os vertices 
ordemBuscaLargura g visitados (h1:h2) = ordemBuscaLargura g nVisitados fila       --visitados e retorna a ordem da busca em largura do grafo
 where
 fila = h2 ++ [adj | adj <- vizinhos g h1, not (elem adj visitados)]
 nVisitados = if not (elem h1 visitados) then visitados ++ [h1] 
 else visitados

ordemBuscaProfundidade g visitados [] = visitados                                           --Função ordemBuscaProfundidade marca os vertices 
ordemBuscaProfundidade g visitados (h1:h2) = ordemBuscaProfundidade g nVisitados pilha    --visitados e retorna a ordem da busca em profundidade do grafo
 where
 pilha = [adj | adj <- vizinhos g h1, not (elem adj visitados)] ++ h2
 nVisitados = if not (elem h1 visitados) then visitados ++ [h1] 
 else visitados
