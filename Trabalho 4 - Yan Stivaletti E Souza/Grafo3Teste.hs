import Grafo3
import GrafoListAdj

grafo1 = novoGrafo 1 []
grafo2 = novoGrafo 3 [(2,3),(1,2),(1,3)]
grafo3 = novoGrafo 3 []
grafo4 = novoGrafo 4 [(1,4), (2,3), (2,4), (1,3)]
grafo5 = novoGrafo 2 [(1,2)]
trilhaeuleriana = novoGrafo 7 [(1,2),(1,7),(3,6),(4,5),(5,6), (5,7), (6,7),(2,3),(2,6),(2,7),(3,4),(3,5)]
semieuleriano = novoGrafo 6 [(1,2),(1,5),(1,6),(2,3),(2,4),(2,6),(3,4),(4,5),(4,6),(5,6)]
halmitoniano = novoGrafo 6 [(1,2), (1,3), (1,6), (2,3), (2,4), (3,5), (4,5), (4,6), (5,6)]


--éConexo grafo1
--éConexo grafo2
--éConexo grafo4

--numCompConexas grafo1
--numCompConexas semieuleriano
--numCompConexas grafo5

--distância grafo4 4 3
--distância semieuleriano 7 3
--distância halmitoniano 6 3

--excentricidade grafo4 4
--excentricidade semieuleriano 7
--excentricidade grafo3 3

--raio grafo4
--raio grafo3
--raio grafo1

--diâmetro grafo4
--diâmetro grafo3 
--diâmetro grafo1

--centro grafo4
--centro grafo3 
--centro grafo1

--éArticulação halmitoniano 6
--éArticulação semieuleriano 7
--éArticulação grafo4 1

--éPonte halmitoniano (5,6)
--éPonte semieuleriano (2,7)
--éPonte grafo4 (1,4)


