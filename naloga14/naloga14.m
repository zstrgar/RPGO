%=== 14. NALOGA =====
[X,Y,Z] = peaks(50);
P = [(X(:)+3)/6 (Y(:)+3)/6 Z(:)];

%Sestavljena Bezierjeva ploskev za M = 5, N = 4 in m = 3, n = 4:
M=5; N=4;
m=3;n=4;

Sz=lsqbezier2spline(5,4,3,4,P);

%Vrednosti (bx,by,bz) na mrezi 

[U,V] = meshgrid(linspace(0,1,10));