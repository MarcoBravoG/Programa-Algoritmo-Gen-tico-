function scores = f_eval(x, pedido,componentes,ingresos)
scores = zeros(size(x,1),1);
nlote=4; %se establece el # de componentes repetidos que ingresan al sistema
rangoPedido=size(pedido); %se guarda el # de productos en el pedido total
t_almacen=18; %capacidad maxima del almacen de 6 posiciones
%Aqui inicia el analisis de cada poblacion de la nueva generacion
for n=1:size(x,1) %recorremos todas las poblaciones
    poblacion=x{n};
    %enceramos los residuos de cada elemento al cambiar de poblacion
    rA=0;rB=0;rC=0;rD=0;rE=0;rF=0;rG=0;rH=0;rI=0;
    %enceramos los elementos de castigo
    cBonus=0; cAlmacen=0; cOrden=0;
    rT=zeros(rangoPedido(1,1),1);
    pedido1=0; pedido2=0; pedido3=0; pedido4=0;
    
    %Aqui inicia el ciclo de comparacion de cada producto del pedido
    for m=1:rangoPedido(1,1)
        i=poblacion(m); %recorremos todos los productos en el orden de la poblacion generada por el AG
        for j=1:componentes %recorremos los elementos de un producto (sin tomar en cuenta el # de pedido)
            switch pedido(i,j)
                case 1 %comparamos si el elemento es tipo A
                    if rA>0 %si existe el residuo, usamos uno para el producto
                        rA=rA-1;
                    elseif rA==0 %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        rA=rA+(nlote-1);
                        cBonus=cBonus+2; %cada que ingresan mas componentes, se castiga esta decision
                    end               
                case 2 %comparamos si el elemento es tipo B
                    if rB>0 %si existe el residuo, usamos uno para el producto
                        rB=rB-1;
                    elseif rB==0
                        rB=rB+(nlote-1); %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        cBonus=cBonus+2;%cada que ingresan mas componentes, se castiga esta decision
                    end               
                case 3 %comparamos si el elemento es tipo C
                    if rC>0 %si existe el residuo, usamos uno para el producto
                        rC=rC-1;
                    elseif rC==0
                        rC=rC+(nlote-1); %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        cBonus=cBonus+2;%cada que ingresan mas componentes, se castiga esta decision
                    end               
                case 4 %comparamos si el elemento es tipo D
                    if rD>0 %si existe el residuo, usamos uno para el producto
                        rD=rD-1;
                    elseif rD==0
                        rD=rD+(nlote-1); %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        cBonus=cBonus+2;%cada que ingresan mas componentes, se castiga esta decision
                    end    
                case 5 %comparamos si el elemento es tipo E
                    if rE>0 %si existe el residuo, usamos uno para el producto
                        rE=rE-1;
                    elseif rE==0
                        rE=rE+(nlote-1); %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        cBonus=cBonus+2;%cada que ingresan mas componentes, se castiga esta decision
                    end
                case 6 %comparamos si el elemento es tipo E
                    if rF>0 %si existe el residuo, usamos uno para el producto
                        rF=rF-1;
                    elseif rF==0
                        rF=rF+(nlote-1); %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        cBonus=cBonus+2;%cada que ingresan mas componentes, se castiga esta decision
                    end
                case 7 %comparamos si el elemento es tipo E
                    if rG>0 %si existe el residuo, usamos uno para el producto
                        rG=rG-1;
                    elseif rG==0
                        rG=rG+(nlote-1); %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        cBonus=cBonus+2;%cada que ingresan mas componentes, se castiga esta decision
                    end
                case 8 %comparamos si el elemento es tipo E
                    if rH>0 %si existe el residuo, usamos uno para el producto
                        rH=rH-1;
                    elseif rH==0
                        rH=rH+(nlote-1); %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        cBonus=cBonus+2; %cada que ingresan mas componentes, se castiga esta decision
                    end
                case 9 %comparamos si el elemento es tipo E
                    if rI>0 %si existe el residuo, usamos uno para el producto
                        rI=rI-1;
                    elseif rI==0
                        rI=rI+(nlote-1); %si no hay residuo disponible, ingresa un nuevo lote menos 1
                        cBonus=cBonus+2; %cada que ingresan mas componentes, se castiga esta decision
                    end
                otherwise
            end
        end
        %al final de analizar cada producto, verificamos si el almacen se
        %lleno
        if (rA+rB+rC+rD+rE+rF+rG+rH+rI)>t_almacen
            cAlmacen=t_almacen;% si el almacen esta lleno, se ingresa un valor de castigo
            %disp(rA+rB+rC+rD+rE+rF+rG+rH+rI);
        end
        %disp(rA+rB+rC+rD+rE+rF+rG+rH+rI);
        %En esta parte se analiza como se van completando los pedidos en
        %funcion de su orden
        if(pedido(i,componentes+1)==1)
            pedido1=pedido1+1;
        elseif (pedido(i,componentes+1)==2)
            pedido2=pedido2+1;
        elseif (pedido(i,componentes+1)==3)
            pedido3=pedido3+1;
        elseif (pedido(i,componentes+1)==4)
            pedido4=pedido4+1;
        end
        %comparamos si se estan realizando los pedidos finales en primer
        %lugar para castigar la secuencia.
        if (pedido4>pedido2 || pedido4>pedido3 || pedido3>pedido2 || pedido2>pedido1 || pedido4>pedido1 || pedido3>pedido1)
            cOrden=cOrden+8;
        end
        rT(i)=rA+rB+rC+rD+rE+rF+rG+rH+rI+cBonus+cAlmacen+cOrden;
        %rT(i)=rA+rB+rC+rD+rE+rF+rG+rH+rI;
        %disp(poblacion(m));
    end
    scores(n)=sum(rT);
    %disp(poblacion);
end
