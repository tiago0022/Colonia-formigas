function [solucao] = ACO(D, delta0, delta, rho, alpha, beta)

    % mapeamento dos parâmetros

    cidades = D;

    feromonio_inicial = delta0;
    feromonio_depositado = delta;

    taxa_evaporacao = rho;

    influencia_distancia = alpha;
    influencia_feromonio = beta;

    % inicialização

    melhor_distancia_total = Inf; % L*

end

