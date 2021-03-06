%====== NALOGA 13.
[X,Y,Z] = peaks(50);                %v obeh smereh 50 točk
P = [(X(:)+3)/6 (Y(:)+3)/6 Z(:)];   %velikosti 2500x3

%Bezierjeva ploskev za m = 6 in n = 5:
m=6; n=5;

[Bx,By] = meshgrid(linspace(-3,3,7),linspace(-3,3,6));   %6x7 grid
Bz = lsqbezier2(6,5,P);


%Izracun vrednosti na mrezi 10 x 10:

[u,v] = deal(linspace(0,1,10));
[~,~,bz] = bezier2(Bx,By,Bz,u,v);


%Maksimalna absolutna napaka na mrezi 50 x 50:

[u,v] = deal(linspace(0,1,50));
[~,~,bz] = bezier2(Bx,By,Bz,u,v);
norm(bz(:)-P(:,3),Inf);

%Bezierjeva ploskev za m = 9 in n = 10:
m=9; n=10;

[Bx,By] = meshgrid(linspace(-3,3,10),linspace(-3,3,11));
Bz = lsqbezier2(9,10,P);

%Izracun vrednosti na mrezi 10 x 10:

[u,v] = deal(linspace(0,1,10));
[~,~,bz] = bezier2(Bx,By,Bz,u,v);


%Maksimalna absolutna napaka na mrezi 50 x 50:

[u,v] = deal(linspace(0,1,50));
[~,~,bz] = bezier2(Bx,By,Bz,u,v);
norm(bz(:)-P(:,3),Inf)   %maksimalno absolutno odstopanje bz in P(:,3)


%izris krivulje ??????????????????????????????????????????????????????????
%graf funkcije peak
surf(X,Y,Z);
hold on


%aproksimacija ploskev za peaks:
[bx,by,bz]=bezier2(Bx, By, Bz, u,v);
beziersurf(bx, by, bz, 50);
hold on