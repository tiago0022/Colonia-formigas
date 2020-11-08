function [distancia_total] = calcula_distancia_total(cidades, rota)
    
    quantidade_cidades = size(rota, 1);

    distancia_total = 0;
    
    cidade_atual = rota(1);
    for i=2:quantidade_cidades
        distancia_total = distancia_total + distancia(cidades, cidade_atual, rota(i));
    end
    
end

