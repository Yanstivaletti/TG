module Grafo (
    éConexo,
    numCompConexas,
    distância,
    excentricidade,
    diâmetro,
    raio,
    centro,
    éArticulação,
    éPonte
)where

import GrafoListAdj
import Data.List




éConexo g = foldr (&&) True [not(éIsolado g v) | v <- vértices g]

numCompConexas g = length ([n | n <-(vértices g), éConexo g])

distância g u v = length (menorCaminho g u v) - 1

excentricidade g v = maximum( map (distância g v) [x | x <- vértices g, x /= v && (elem x (vértices g))])

raio g = mElemento g (vértices g) 

diâmetro g = mAElemento g (vértices g)


centro g = [xs | xs <- (vértices g), xs == raio g]

éArticulação g u = grau g u == grauMax g

éPonte g (u,v) = (grau g u == grauMax g) && (grau g v == grauMax g)

-- Funções Auxiliares 

éIsolado g v = (vizinhos g v) == []

mElemento g [] = 0
mElemento g [xs] = xs
mElemento g (h1:h2:xs)
    |(excentricidade g h1) > (excentricidade g h2) = mElemento g (h2:xs)
    |(excentricidade g h1) < (excentricidade g h2) = mElemento g (h1:xs)
    |(excentricidade g h1) == (excentricidade g h2) = mElemento g (h2:xs)


mAElemento g [] = 0
mAElemento g [xs] = xs
mAElemento g (h1:h2:xs)
    |(excentricidade g h1) > (excentricidade g h2) = mAElemento g (h1:xs)
    |(excentricidade g h1) < (excentricidade g h2) = mAElemento g (h2:xs)
    |(excentricidade g h1) == (excentricidade g h2) = mAElemento g (h1:xs)

mEElemento g [] = []
mEElemento g [xs] = [xs]
mEElemento g (h1:h2:xs)
    |(excentricidade g h1) > (excentricidade g h2) = mEElemento g (h2:xs)
    |(excentricidade g h1) < (excentricidade g h2) = mEElemento g (h1:xs)
    |(excentricidade g h1) == (excentricidade g h2) = mEElemento g (h2:xs)

grauMax g = maximum(seqGraus g)

busca g menorCaminho [] v = menorCaminho 
busca g menorCaminho (x:y) v 
 |x == v = menorCaminho ++ [v]
 |otherwise = busca g novosVisitados fila v
  where
  fila = y ++ [adj | adj <- vizinhos g x, not (elem adj menorCaminho)]
  novosVisitados = if not (elem x menorCaminho) && (adjacente g x v) && (checa g v menorCaminho) then menorCaminho ++ [x] 
  else menorCaminho
   where 
   checa g x [] = True
   checa g x (y:z) = if (adjacente g x y) then False
   else checa g x z

menorCaminho g u v = busca g [u] [u] v

seqGraus g = (sort [length(vizinhos g v)| v <- (vértices g)])