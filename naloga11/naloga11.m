%naloga 11.
%Kontrolne tocke ploskve:

Bx = [0 3 5 6; 1 4 5 7; 0 3 5 6];
By = [-1 -2 -1 -2; 1 2 1 2; 5 5 6 5];
Bz = [-3 -2 0 -5; 3 6 3 2; -1 4 -2 8];


beziersurf(Bx, By, Bz, 50) %zadnji argument je finost delitve u in v.
hold on