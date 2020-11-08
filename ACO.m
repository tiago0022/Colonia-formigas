function [melhor_rota] = ACO(D, delta0, delta, rho, alpha, beta)

    % mapeamento dos parâmetros

    cidades = D;

    feromonio_inicial = delta0;
    feromonio_depositado = delta;

    taxa_evaporacao = rho;

    influencia_distancia = alpha;
    influencia_feromonio = beta;

    % Inicialização

    quantidade_cidades = size(cidades, 1); % eta
    quantidade_formigas = quantidade_cidades;

    melhor_distancia_total = Inf; % L*
    melhor_rota = zeros(quantidade_cidades, 1); % R*
    vetor_melhores_distancias = zeros(10000, 1); % Vetor de histórico, para plotar o gráfico no final

    feromonios = feromonio_inicial * ones(quantidade_cidades); % Gamma_{ij}

    iteracao = 1;
    iteracoes_com_mesma_solucao = 0;

    % Iterações
    while iteracoes_com_mesma_solucao < quantidade_cidades

        % Quantidade de feromônios que serão acrescentados DeltaGamma_{ij}
        feromonios_acrescentados = zeros(quantidade_cidades);

        % Calcula a rota de cada formiga
        for formiga=1:quantidade_formigas

            % Define a rota R da formiga k
            rota = define_rota(formiga, cidades, feromonios, influencia_distancia, influencia_feromonio);

            % Calcula a distância total L percorrida pela formiga k
            distancia_total = calcula_distancia_total(cidades, rota);

            % Atualiza a melhor solução caso necessário
            if distancia_total < melhor_distancia_total
                melhor_distancia_total = distancia_total;
                melhor_rota = rota;
                iteracoes_com_mesma_solucao = 0;
            end

            % Calcula o feromônio adicionado em cada arco visitado
            for i=2:quantidade_cidades
                cidade_atual = rota(i); % i
                cidade_anterior = rota(i-1); % j
                feromonios_anteriormente = feromonios_acrescentados(cidade_atual, cidade_anterior); % DeltaGamma_{ij}
                feromonios_formiga = feromonio_depositado / distancia_total; % delta/L_k
                feromonios_resultado = feromonios_anteriormente + feromonios_formiga; % DeltaGamma_{ij} + delta/L_k
                feromonios_acrescentados(cidade_atual, cidade_anterior) = feromonios_resultado; % DeltaGamma_{ij} = DeltaGamma_{ij} + delta/L_k
                feromonios_acrescentados(cidade_anterior, cidade_atual) = feromonios_resultado; % DeltaGamma_{ji} = DeltaGamma_{ij} + delta/L_k
            end

        end

        % TODO Calcula a nova quantidade de feromônios para cada arco
        for i=1:quantidade_cidades
            for j=1:quantidade_cidades
                
            end
        end

        % Atualiza iteração
        vetor_melhores_distancias(iteracao) = melhor_distancia_total;
        iteracoes_com_mesma_solucao = iteracoes_com_mesma_solucao + 1;
        iteracao = iteracao + 1;

    end

    % TODO Exibe gráfico de melhor distância por iteração

    disp('Melhor rota encontrada:');
    disp(melhor_rota');
    disp('Distância total da melhor rota:');
    disp(melhor_distancia_total);

end

