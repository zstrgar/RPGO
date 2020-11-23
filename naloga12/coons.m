function [Bx,By,Bz] = coons(Bx,By,Bz)
% Opis:
%  coons vrne kontrolne tocke Coonsove ploskve
%
% Definicija:
%  [bx,by,bz] = coons(Bx,By,Bz)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki dolocajo
%               koordinate robnih kontrolnih tock
%               (v konstrukciji Coonsove ploskve se
%               upostevajo kontrolne tocke, ki jih doloca
%               prva in zadnja vrstica ter prvi in zadnji
%               stolpec posamezne matrike)
%
% Izhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki dolocajo
%               koordinate kontrolnih tock Coonsove ploskve
[n, m]=size(Bx);
m=m-1;
n=n-1;

[b1x, b2x, b3x] = deal(zeros(n+1, m+1));
[b1y, b2y, b3y] = deal(zeros(n+1, m+1));
[b1z, b2z, b3z] = deal(zeros(n+1, m+1));

%prva ploskev
for j=2:n
    for i=2:m
        b1x(j,i) = (1-(j-1)/n)*Bx(1,i) + ((j-1)/n)*Bx(end,i);
        b1y(j,i) = (1-(j-1)/n)*By(1,i) + ((j-1)/n)*By(end,i);
        b1z(j,i) = (1-(j-1)/n)*Bz(1,i) + ((j-1)/n)*Bz(end,i);
    end
end

%druga ploskev
for j=2:n
    for i=2:m
        b2x(j,i) = (1-(i-1)/m)*Bx(j,1) + (i-1)/m*Bx(j,end);
        b2y(j,i) = (1-(i-1)/m)*By(j,1) + (i-1)/m*By(j,end);
        b2z(j,i) = (1-(i-1)/m)*Bz(j,1) + (i-1)/m*Bz(j,end);
    end
end

%tretja ploskev
for j=2:n
    for i=2:m
        b3x(j,i) = (1-(i-1)/m)*(1-(j-1)/n)*Bx(1,1) + (1-(i-1)/m)*((j-1)/n)*Bx(end,1) + ((i-1)/m)*(1-(j-1)/n)*Bx(1,end) +((i-1)/m)*((j-1)/n)*Bx(end,end);
        b3y(j,i) = (1-(i-1)/m)*(1-(j-1)/n)*By(1,1) + (1-(i-1)/m)*((j-1)/n)*By(end,1) + ((i-1)/m)*(1-(j-1)/n)*By(1,end) +((i-1)/m)*((j-1)/n)*By(end,end);
        b3z(j,i) = (1-(i-1)/m)*(1-(j-1)/n)*Bz(1,1) + (1-(i-1)/m)*((j-1)/n)*Bz(end,1) + ((i-1)/m)*(1-(j-1)/n)*Bz(1,end) +((i-1)/m)*((j-1)/n)*Bz(end,end);
    end
end

Bx = Bx + b1x + b2x - b3x;
By = By + b1y + b2y - b3y;
Bz = Bz + b1z + b2z - b3z;


end