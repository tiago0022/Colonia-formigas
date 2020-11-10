cidades = dlmread('Colonia.csv', ';', 1, 0); % D

feromonio_inicial = 0.1; % delta_0
feromonio_depositado = 10; % delta

taxa_evaporacao = 0.01; % rho

influencia_distancia = 1; % alfa
influencia_feromonio = 1; % beta

ACO(cidades, feromonio_inicial, feromonio_depositado, taxa_evaporacao, influencia_distancia, influencia_feromonio);