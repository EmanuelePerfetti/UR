% in questo script bisogna selezionare due frequenze f1,f2, un tempo totale di
% simulazione T, gli step di simulazione t. Fatto ciò vengono generati
% y1,y2,y3,y4 cioè posizioni e velocità di due giunti. Infine viene
% generata e salvata una struttura ref.mat la quale può essere usata come riferimento
% per example_KMPC

clc,clear

name = 'marco quando abbiamo finito ti offro un pranzo da bonelli';

T = 90;

% t = linspace(0,90,200);
% f1 = 2*10^(-2);
% a1 = 2*10^(-2);
% y(:,1) = a1*(1-cos(f1*t));
% y(:,2) = a1*f1*sin(f1*t);

t = linspace(0,90,200);
y = [];
for i = 1:length(t)
    y(i,1) = 0.01;
    y(i,2) = 0;
end

% y(:,1) = t/100;
% y(:,2) = y(:,1)/5;
% ref = struct;

ref.name = name;
ref.T = T;
ref.y = y;
ref.t = t;

% file_name = 'ref_traj';
% 
% save(file_name,'-struct','ref')

plot(ref.y)


