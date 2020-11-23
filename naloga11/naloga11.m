%naloga 11.
%Kontrolne tocke ploskve:

Bx = [0 3 5 6; 1 4 5 7; 0 3 5 6];
By = [-1 -2 -1 -2; 1 2 1 2; 5 5 6 5];
Bz = [-3 -2 0 -5; 3 6 3 2; -1 4 -2 8];


%Tocke na ploskvi:
u = linspace(0,1,10);
v = linspace(0,1,10);

[bx by bz] = bezier2(Bx,By,Bz,u,v);

%Preverimo, če dela in narišimo grafek:
surf(bx, by, bz);
hold on
mesh(Bx, By, Bz, 'FaceColor', 'None');  %prozorne pravokotnike naredi
hold on
