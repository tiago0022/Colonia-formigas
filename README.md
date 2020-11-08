# Colonia de formigas
LIA - Algoritmo colônia de formigas

Algoritmo de colônia de formigas para resolver o problema do caixeiro viajante.

Executar o algoritmo por meio do console do matlab, com as seguintes opções de comando:
1. `ACO (D, delta0, delta, rho, alpha, beta)`
    1. D = matriz com as distâncias entre as cidades
    2. delta0 = valor do feromônio inicial em cada arco
    3. delta = quantidade de feromônio de referência depositada nos arcos visitados
    4. rho = taxa de evaporação do feromônio a cada iteração
    5. alpha = parâmetro utilizado na definição da rota (influência da distância no arco)
    6. beta = parâmetro utilizado na definição da rota (influência do feromônio no arco)
1. `colonia_formigas` -> executa o algoritmo com os valores padrão
    1. D = matriz contida em "Colonia.csv"
    2. delta0 = 0.1
    3. delta = 10
    4. rho = 0.01
    5. alpha = 1
    6. beta = 1
