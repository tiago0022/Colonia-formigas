function [escolha] = roleta(vetor_probabilidade)
    
    tamanho_populacao = size(vetor_probabilidade, 1);
    
    somatorio = 0;
    sorteio = rand(1)*100;
   
    % método roleta para escolha da rota
    for i=1:tamanho_populacao
        somatorio = somatorio + vetor_probabilidade(i);
        if sorteio <= somatorio
            escolha = i;
            break;
        end
    end 
    
    % Tratativa de erro de arredondamento
    if sorteio == 100
        escolha = tamanho_populacao;
    end
    
end

