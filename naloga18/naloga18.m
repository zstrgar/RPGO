%=== 18. NALOGA ====



%triangulacija:
V = [ -3 -3; -3 -2; -3 1; -3 3; -1.7 -1; -1.6 0.5; ...
-1.5 1.7; -1.1 -3; -0.9 -2; -0.7 1; -0.5 -1; ...
-0.5 0; -0.5 3; -0.4 1.6; 0 -2; 0.5 -1; 0.5 0.5; ...
0.6 1.2; 0.7 -0.4; 1 2.2; 1.2 -3; 1.2 -1.6; 1.6 3; ...
2 -1; 2 0.6; 3 -3; 3 -1.8; 3 -0.4; 3 1.7; 3 3];
TRI = delaunay ( V ) ;
tri = triangulation ( TRI , V ) ;

%Funkcija f:
f = @(x,y) 3*(1-x).^2.*exp(-x.^2 - (y+1).^2) ...
    - 10*(x/5 - x.^3 - y.^5).*exp(-x.^2-y.^2) ...
    - 1/3*exp(-(x+1).^2 - y.^2);

%Prvi odvod funkcije f po x:
dxf = @(x,y) (exp(-(x+1).^2 - y.^2).*(2*x + 2))/3 ...
    + 3*exp(-(y+1).^2 - x.^2).*(2*x-2) ...
    + exp(-x.^2 - y.^2).*(30*x.^2 - 2) ...
    - 6*x.*exp(-(y+1).^2 - x.^2).*(x - 1).^2 ...
    - 2*x.*exp(-x.^2 - y.^2).*(10*x.^3 - 2*x + 10*y.^5);

%Prvi odvod funkcije f po y:
dyf = @(x,y) (2*y.*exp(-(x+1).^2 - y.^2))/3 ...
    + 50*y.^4.*exp(-x.^2 - y.^2) ...
    - 3*exp(-(y+1).^2 - x.^2).*(2*y + 2).*(x - 1).^2 ...
    - 2*y.*exp(-x.^2 - y.^2)*(10*x.^3 - 2*x + 10*y.^5);

%Gradient funkcije f:
Df = @(x,y) [dxf(x,y); dyf(x,y)];

%Drugi odvod funkcije f po x:
dxxf = @(x,y) (2*exp(-(x+1).^2 - y.^2))/3 ...
    + 6*exp(-(y+1).^2 - x.^2) ...
    + 60*x.*exp(-x.^2 - y.^2) ...
    - 6*exp(-(y+1).^2 - x.^2).*(x - 1).^2 ...
    - 2*exp(-x.^2 - y.^2).*(10*x.^3 - 2*x + 10*y.^5) ...
    - (exp(-(x+1).^2 - y.^2).*(2*x + 2).^2)/3 ...
    + 12*x.^2.*exp(-(y+1).^2 - x.^2).*(x - 1).^2 ...
    + 4*x.^2.*exp(-x.^2 - y.^2).*(10*x.^3 - 2*x + 10*y.^5) ...
    - 12*x.*exp(-(y+1).^2 - x.^2).*(2*x - 2) ...
    - 4*x.*exp(-x.^2 - y.^2).*(30*x.^2 - 2);

%Mesani odvod funkcije f po x in y:
dxyf = @(x,y) 4*x.*y.*exp(-x.^2 - y.^2).*(10*x.^3 - 2*x + 10*y.^5) ...
    - (2*y.*exp(-(x+1).^2 - y.^2).*(2*x + 2))/3 ...
    - 2*y.*exp(-x.^2 - y.^2).*(30*x.^2 - 2) ...
    - 100*x.*y.^4.*exp(-x.^2 - y.^2) ...
    - 3*exp(-(y+1).^2 - x.^2).*(2*x - 2).*(2*y + 2) ...
    + 6*x.*exp(-(y+1).^2 - x.^2).*(2*y + 2)*(x - 1)^2;

%Drugi odvod funkcije f po y:
dyyf = @(x,y) (2*exp(-(x+1).^2 - y.^2))/3 ...
    - 6*exp(-(y+1).^2 - x.^2).*(x - 1).^2 ...
    - 2*exp(-x.^2 - y.^2).*(10*x.^3 - 2*x + 10*y.^5) ...
    + 200*y.^3*exp(-x.^2 - y.^2) ...
    - 200*y.^5.*exp(-x.^2 - y.^2) ...
    - (4*y.^2*exp(-(x+1).^2 - y.^2))/3 ...
    + 4*y.^2.*exp(-x.^2 - y.^2).*(10*x.^3 - 2*x + 10*y.^5) ...
    + 3*exp(-(y+1).^2 - x.^2).*(2*y + 2).^2.*(x - 1).^2;

%Hessejeva matrika funkcije f:
Hf = @(x,y) [dxxf(x,y) dxyf(x,y); dxyf(x,y) dyyf(x,y)];


%Argyrisov zlepek:
S = argyrisspline(tri, f, Df, Hf);

%zberemo x,y
%testis za 10x10
% Vrednosti na kvadratu [-3,3] x [-3,3] diskretiziranem z mrezo velikosti 10 x 10:
[Bx,By] = meshgrid(linspace(-3,3,10),linspace(-3,3,10));

len = length(Bx(1,:));
for i = 1:len
    for j = 1:len
        x = Bx(j,i);
        y = By(j, i);
        [ID, bar] = pointLocation(tri, x, y);
        Si = S{ID};
        b_test(j,i) = decasteljau3(Si, bar);
    end
end

% Maksimalna absolutna napaka aproksimacije funkcije f na mrezi 101 x 101:
[Bx,By] = meshgrid(linspace(-3,3,101),linspace(-3,3,101));

len = length(Bx(1,:));
b = zeros(len);
for i = 1:len
    for j = 1:len
        x = Bx(j,i);
        y = By(j, i);
        [ID, bar] = pointLocation(tri, x, y);
        Si = S{ID};
        b(j,i) = decasteljau3(Si, bar);
    end
end

Z = peaks(101);
% maksimalna absolutna napaka
max(max(abs(b-Z)))

% graf triangulacije
n = length(V(:,1));
figure()
trimesh(TRI, V(:,1), V(:,2), zeros(n,1), 'edgecolor', 'black', 'facecolor', 'none')
axis([-3 3 -3 3])
title('Triangulacija')

% Graf Argyrisovega zlepka za funkcijo peaks

figure()
surf(Bx, By, b)
axis([-3 3 -3 3])
title('Argyrisov zlepek za funkcijo peaks')

figure()
surf(Bx, By, Z)
axis([-3 3 -3 3])
title('Funkcija peaks')