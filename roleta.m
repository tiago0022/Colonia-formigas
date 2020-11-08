function [pai] = roleta(vetor_adaptabilidade)
    
    tamanho_populacao = size(vetor_adaptabilidade, 2);
%     disp(tamanho_populacao);
    
    somatorio = 0;
    sorteio = rand(1)*100;
    
%     disp(sorteio);
    
    % método roleta para escolha do pai
    for i=1:tamanho_populacao
        somatorio = somatorio + vetor_adaptabilidade(i);
%         disp(somatorio);
        if sorteio <= somatorio
            pai = i;
            break;
        end
    end 
    
    % Tratativa de erro de arredondamento
    if sorteio == 100
        pai = tamanho_populacao;
    end
    
    disp(pai);
    
end

