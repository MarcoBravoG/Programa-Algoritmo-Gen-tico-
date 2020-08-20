nlote=4; %se establece el # de componentes repetidos que ingresan al sistema
rangoPedido=size(pedido); %se guarda el # de productos en el pedido total

%Aqui inicia el analisis de cada poblacion de la nueva generacion
%for n=1:size(x,1) %recorremos todas las poblaciones
poblacion=x{1};
%enceramos los residuos de cada elemento al cambiar de poblacion
rA=0;rB=0;rC=0;rD=0;rE=0;rF=0;rG=0;rH=0;rI=0;
n=1;
%enceramos los elementos de castigo
rT=zeros(rangoPedido(1,1),1);
m_pedido=zeros(rangoPedido);

%Aqui inicia el ciclo de comparacion de cada producto del pedido
for i=1:rangoPedido(1,1)
    %i=poblacion(m); %recorremos todos los productos en el orden de la poblacion generada por el AG
    m_pedido(i,:)=pedido(i,:);
    for j=1:componentes %recorremos los elementos de un producto (sin tomar en cuenta el # de pedido)
        switch pedido(i,j)
            case 1 %comparamos si el elemento es tipo A
                if rA>0 %si existe el residuo, usamos uno para el producto
                    rA=rA-1;
                elseif rA==0 %si no hay residuo disponible, ingresa un nuevo lote menos 1
                    rA=rA+(nlote-1);
                end               
            case 2 %comparamos si el elemento es tipo B
                if rB>0 %si existe el residuo, usamos uno para el producto
                    rB=rB-1;
                elseif rB==0
                    rB=rB+(nlote-1);
                end               
            case 3 %comparamos si el elemento es tipo C
                if rC>0 %si existe el residuo, usamos uno para el producto
                    rC=rC-1;
                elseif rC==0
                    rC=rC+(nlote-1);
                end               
            case 4 %comparamos si el elemento es tipo D
                if rD>0 %si existe el residuo, usamos uno para el producto
                    rD=rD-1;
                elseif rD==0
                    rD=rD+(nlote-1);
                end    
            case 5 %comparamos si el elemento es tipo E
                if rE>0 %si existe el residuo, usamos uno para el producto
                    rE=rE-1;
                elseif rE==0
                    rE=rE+(nlote-1); 
                end
            case 6 %comparamos si el elemento es tipo E
                if rF>0 %si existe el residuo, usamos uno para el producto
                    rF=rF-1;
                elseif rF==0
                    rF=rF+(nlote-1);
                end
            case 7 %comparamos si el elemento es tipo E
                if rG>0 %si existe el residuo, usamos uno para el producto
                    rG=rG-1;
                elseif rG==0
                    rG=rG+(nlote-1);
                end
            case 8 %comparamos si el elemento es tipo E
                if rH>0 %si existe el residuo, usamos uno para el producto
                    rH=rH-1;
                elseif rH==0
                    rH=rH+(nlote-1);
                end
            case 9 %comparamos si el elemento es tipo E
                if rI>0 %si existe el residuo, usamos uno para el producto
                    rI=rI-1;
                elseif rI==0
                    rI=rI+(nlote-1); 
                end
            otherwise
        end
    end
    rT(i)=rA+rB+rC+rD+rE+rF+rG+rH+rI;
%     n=n+1;
end
m_pedido(:,componentes+2)=rT(:);
% resp = m_pedido;