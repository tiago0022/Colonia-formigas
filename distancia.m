function [distancia] = distancia(cidades, i, j)
    
    Xi = cidades(i, 2);
    Xj = cidades(j, 2);
    
    Yi = cidades(i, 3);
    Yj = cidades(j, 3);
    
    distanciaX = Xi - Xj;
    distanciaY = Yi - Yj;
    
    distancia = sqrt(distanciaX^2 + distanciaY^2);

end

