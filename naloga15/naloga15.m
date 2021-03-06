%==== NALOGA 15.
%Domenski trikotnik:
T = [0 0; 5 1; 3 3];

%Baricentrične koordinate točk:
P1=[0,0]; BP1 = pointbary(P1,T);
P2=[1,1]; BP2 = pointbary(P2, T);
P3=[4,2]; BP3 = pointbary(P3, T);

%vse te točke spravim v eno matriko, da bom lažje računala v nadaljevanju
BP = [BP1; BP2; BP3];

%Koeficienti polinoma p v Bezierjevi obliki:
B = [2 1 -1 0;
    5 3 -4 NaN;
    0 0 NaN NaN;
    1 NaN NaN NaN];


%vrednosti polinoma p v točkah iz BP (P1, P2, P3):
n= length(BP);
r=3;
Vp = zeros(n,1);  % matrika Vp vsebuje vrednosti polinoma p v točkah BP  
for i=1:n
    Vp(i) = blossom3(B, repmat(BP(i,:), r, 1));   % r-kratna ponovitev točk
end


%====== OVODI =====
%Baricentrične koordinate smernih vektorjev:
x=[1,0]; xb = vectorbary(x, T);
y=[0,1]; yb = vectorbary(y, T);

%===== 1. dovodi =====

%smer x:
n=length(BP);
Dx=zeros(n,1);  %v Dx so zbrane vrednosti 1. odvodov v smeri x v točkah iz BP
for i=1:n
    Dx(i) = factorial(n)/factorial(n-1)*blossom3(B, [xb;repmat(BP(i,:), n-1, 1)]);
end

%smer y:
n=length(BP);
Dy=zeros(n,1);  %v Dy so zbrane vrednosti 1. odvodov v smeri y v točkah iz BP
for i=1:n
    Dy(i) = factorial(n)/factorial(n-1)*blossom3(B, [yb;repmat(BP(i,:), n-1, 1)]);
end


%====== 2. ODVODI =========
% smer x, x
n=length(BP);
Dxx = zeros(n,1); % v Dxx so zbrane vrednosti 2. odvodov s smeri x v točkah iz bP
for i =1:n
    Dxx(i) = factorial(n)/factorial(n-2)*blossom3(B, [xb; xb; repmat(BP(i,:),n-2,1)]);
end

% smer y, y
n=length(BP);
Dyy = zeros(n,1); % v Dyy so zbrane vrednosti 2. odvodov s smeri y v točkah iz bP
for i =1:n
    Dyy(i) = factorial(n)/factorial(n-2)*blossom3(B, [yb; yb; repmat(BP(i,:),n-2,1)]);
end


% mešani (x, y)
n=length(BP);
Dxy = zeros(n,1); % v Dxy so zbrane vrednosti 2. odvodov s smereh x, y v točkah iz bP
for i =1:n
    Dxy(i) = factorial(n)/factorial(n-2)*blossom3(B, [xb; yb; repmat(BP(i,:),n-2,1)]);
end
