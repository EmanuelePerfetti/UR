% in questo script bisogna selezionare due frequenze f1,f2, un tempo totale di
% simulazione T, gli step di simulazione t. Fatto ciò vengono generati
% y1,y2,y3,y4 cioè posizioni e velocità di due giunti. Infine viene
% generata e salvata una struttura ref.mat la quale può essere usata come riferimento
% per example_KMPC

clc,clear

name = 'marco quando abbiamo finito ti offro un pranzo da bonelli';

T = 90;

%nella cartella finale --> sim_ref_ellisse_01 è stata ottenuta con f1=0.08,
%f2=0.09,a1=a2=0.8 t = linspace(0,90,400). Il riferimento in questa
%cartella è il ref_traj_ellisse_01

%nella cartella finale --> sim_ref_ellisse_01 è stata ottenuta con f1=0.07,
%f2=0.08,a1=a2=0.7 t = linspace(0,90,450). Il riferimento in questa
%cartella è il ref_traj_ellisse_02

t = linspace(0,90,450);
f1 = 0.07;
f2 = 0.08;
a1 = 0.7;
a2 = 0.7;
y(:,1) = deg2rad(-90) + a1*(1-cos(f1*t));
y(:,2) = deg2rad(0) + a2*(1-cos(f2*t));
y(:,3) = a1*f1*sin(f1*t);
y(:,4) = a2*f2*sin(f2*t);

ref = struct;

ref.name = name;
ref.T = T;
ref.y = y;
ref.t = t;

% file_name = 'ref_traj';
% 
% save(file_name,'-struct','ref')

plot(ref.y)


