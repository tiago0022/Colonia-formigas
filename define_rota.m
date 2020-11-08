function [rota] = define_rota(formiga, cidades, feromonios, influencia_distancia, influencia_feromonio)

    quantidade_cidades = size(cidades, 1);
    
    rota = zeros(quantidade_cidades, 1);
    
    % Define cidade inicial
    rota(1) = mod(formiga, quantidade_cidades);
    
    % Calcula a próxima cidade a cada iteração
    for i=2:quantidade_cidades
        cidades_nao_visitadas = setdiff(cidades(:, 1), rota);
        cidade_atual = rota(i - 1);
        rota(i) = calcula_proxima_cidade(cidades, feromonios, influencia_distancia, influencia_feromonio, cidade_atual, cidades_nao_visitadas);
    end 

end

function [proxima_cidade] = calcula_proxima_cidade(cidades, feromonios, influencia_distancia, influencia_feromonio, cidade_atual, cidades_nao_visitadas)
    
    numero_possibilidades = size(cidades_nao_visitadas, 1);
    
    vetor_probabilidade = zeros(numero_possibilidades, 1);
    
    % Calcula o numerador do termo da probabilidade de cada cidade não
    % visitada => [Gamma_{ij}]^alpha x [eta_{ij}]^beta
    for i=1:numero_possibilidades
        termo_feromonios = feromonios(cidade_atual, cidades_nao_visitadas(i)) ^ influencia_feromonio;
        termo_distancia = (1/distancia(cidades, cidade_atual, cidades_nao_visitadas(i))) ^ influencia_distancia;
        vetor_probabilidade(i) = termo_feromonios * termo_distancia;
    end
    
    % Calcula o denominador do termo da probabilidade de cada cidade não
    % visitada => sum_{k pertence a V} [Gamma_{ik}]^alpha x [eta_{ik}]^beta
    soma_probabilidade = sum(vetor_probabilidade);
    
    vetor_probabilidade = (vetor_probabilidade / soma_probabilidade) * 100;
    
    indice_escolhido = roleta(vetor_probabilidade);
    
    proxima_cidade = cidades_nao_visitadas(indice_escolhido);

end
