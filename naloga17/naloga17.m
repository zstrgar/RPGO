%=== 17. NALOGA =====
%Trikotnik T:
T = [-1.7 -1; -0.5 -1; -0.5 0];

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



%Izracun koeficientov Argyrisovega polinoma:
Bz = argyris(T,f,Df,Hf);


% Vrednosti polinoma v domenskih tockah za N = 10 
%(prva dva stolpca sta kartezicni koordinati domenske tocke, tretji pa vrednost polinoma):
[TRI,U] = trimeshgrid(10);

n = length(U);
V = ones(3);
V(2:3,:) = T';
b_test = zeros(n, 3);
for i = 1:n
    x_tmp = V*U(i,:)';
    b_test(i,[1 2]) = x_tmp(2:3)'; 
    b_test(i,3) = decasteljau3(Bz, U(i,:));
end

% Maksimalna absolutna napaka aproksimacije funkcije f v domenskih tockah trikotnika T za N = 50:
[TRI,U] = trimeshgrid(50);

n = length(U(:,1));
V = ones(3);
V(2:3,:) = T';
b = zeros(n, 3);
for i = 1:n
    x_tmp = V*U(i,:)';
    b(i,[1 2]) = x_tmp(2:3)'; 
    b(i,3) = decasteljau3(Bz, U(i,:));
end

Z = peaks(b(:,1),b(:,2));
norm(b(:,3)-Z(:),Inf)

figure()
trisurf(TRI,b(:,1),b(:,2),b(:,3))
title('Argyrisov polinom')

figure()
trisurf(TRI,b(:,1),b(:,2),Z)
title('Funkcija peaks')






