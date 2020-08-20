clear all; clc;
ingresos=input('Ingrese el numero de pedidos: ');
productos = input('Ingrese el numero de productos por pedido: '); %aqui se ingresa el numero de productos por pedido
variantes = 9; %variantes al ingreso del proceso Productivo
componentes = 3; % numero de componentes por producto
pedido=randi(variantes,ingresos*productos,componentes);
desde=1;hasta=10;
for i=1:ingresos %Aqui se añade el numero de pedido a la cuarta columna
    pedido(desde:hasta,(componentes+1))=i;
    desde=desde+10;
    hasta=hasta+10;
    pedido(i*productos:(i+1)*productos,4)=i;
end

%Esta seccion inicializa el caso 1 con 4 pedidos de 10 productos cada uno, 9
%variantes y 3 componentes.
% ingresos=4;
% productos = 10; %aqui se ingresa el numero de productos por pedido
% variantes = 9; %variantes al ingreso del proceso Productivo
% componentes = 3;
% load('pedido_random');
% pedido=pedido1;

%Esta seccion inicializa el caso 2 con 1 pedidos de 10 productos cada uno,
%3 variantes y 2 componentes.
% ingresos=1;
% productos = 10; %aqui se ingresa el numero de productos por pedido
% variantes = 3; %variantes al ingreso del proceso Productivo
% componentes = 2;
% load('pedido_random2');
% pedido=pedido2;

type permutaciones_creacion.m
type permutacion_cruce.m
type permutacion_mutacion.m
type f_eval.m
type f_resultado.m

FitnessFcn = @(x) f_eval(x,pedido,componentes,ingresos);

my_plot1 = @(options,state,flag) gaplotbestf(options,state,flag);
my_plot2 = @(options,state,flag) gaplotscores(options,state,flag);
my_plot3 = @(options,state,flag) gaplotselection(options,state,flag);
my_plot4 = @(options,state,flag) gaplotscorediversity(options,state,flag);
my_plot5 = @(options,state,flag) gaplotstopping(options,state,flag);
my_plot6 = @(options,state,flag) gaplotgenealogy(options,state,flag);
%my_plot7 = @(options,state,flag) gaplotdistance(options,state,flag);
%% Genetic Algorithm Options Setup
% First, we will create an options container to indicate a custom data type
% and the population range.
options = optimoptions('ga', 'PopulationType', 'custom','InitialPopulationRange', ...
                            [1;(ingresos*productos)]);
% options = optimoptions('ga','PopulationType', 'custom','InitialPopulationRange',[1;productos],'PlotFcn',gaplotbestf);
%
% We choose the custom creation, crossover, mutation, and plot functions
% that we have created, as well as setting some stopping conditions.
options = optimoptions(options,'CreationFcn',@permutaciones_creacion, ...
                        'CrossoverFcn',@permutacion_cruce, ...
                        'MutationFcn',@permutacion_mutacion, ...
                        'PlotFcn', {my_plot1,my_plot2,my_plot3,my_plot4,my_plot5}, ...
                        'MaxGenerations',30,'PopulationSize',5, ...
                        'MaxStallGenerations',40,'UseVectorized',true);
                        %'PlotFcn', my_plot, ...
                        %'PlotFcn', {my_plot1,my_plot2,my_plot3}, ...
                        %'PlotFcn', {my_plot1,my_plot2,my_plot3,my_plot4,my_plot5,my_plot6}, ...
%%
% Finally, we call the genetic algorithm with our problem information.

numberOfVariables = (ingresos*productos);
[x,fval,reason,output] = ...
    ga(FitnessFcn,numberOfVariables,[],[],[],[],[],[],[],options);

pedido_respuesta=f_resultado(x,pedido,componentes);