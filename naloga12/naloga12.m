%Naloga 12
%Kontrolne tocke robnih krivulj:

[Bx,By,Bz] = deal(zeros(9,11));

phi = linspace(0,pi,11);
psi = linspace(0,pi,9);

%1. vrstica
Bx(1,:) = 1+sin(phi);
By(1,:) = -cos(phi);

%zadnja vrstica
Bx(9,:) = -1-sin(phi);
By(9,:) = -cos(phi);

%1. stolpec
Bx(:,1) = cos(psi);
By(:,1) = -1;
Bz(:,1) = sin(psi);

%zadnji stolpec
Bx(:,11) = cos(psi);
By(:,11) = 1;
Bz(:,11) = sin(psi);

%Kontrolne tocke Coonsove ploskve:
[Bx,By,Bz] = coons(Bx,By,Bz);

%Tocke na ploskvi:
u = linspace(0,1,100);
v = linspace(0,1,100);

[bx by bz] = bezier2(Bx,By,Bz,u,v);

%grafek
surf(bx, by, bz);
hold on
mesh(Bx, By, Bz, 'FaceColor', 'None');  %prozorne pravokotnike naredi
hold on


