% ingresos=input('Ingrese el numero de pedidos: ');
% productos = input('Ingrese el numero de productos por pedido: '); %aqui se ingresa el numero de productos por pedido
% variantes = 9; %variantes al ingreso del proceso Productivo
% componentes = 3; % numero de componentes por producto
% pedido1=randi(variantes,ingresos*productos,componentes);
% desde=1;hasta=10;
% for i=1:ingresos %Aqui se añade el numero de pedido a la cuarta columna
%     pedido1(desde:hasta,(componentes+1))=i;
%     desde=desde+10;
%     hasta=hasta+10;
%     pedido(i*productos:(i+1)*productos,4)=i;
% end
% save('pedido_random','pedido1');

pedido2=[[2 3 1];[1 3 1];[2 2 1];[1 3 1];[3 1 1];[2 3 1];[3 2 1];[1 2 1];[1 3 1];[1 1 1]];
save('pedido_random2','pedido2');