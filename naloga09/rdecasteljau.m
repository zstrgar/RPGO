function b = rdecasteljau(B,w,t)
% Opis:
%  rdecasteljau vrne tocko na racionalni Bezierjevi
%  krivulji, ki je izracunana z de Casteljaujevim
%  postopkom, prirejenim za racionalni primer
%
% Definicija:
%  b = rdecasteljau(B,w,t)
%
% Vhodni podatki:
%  B    matrika, katere vrstica predstavlja koordinate
%       kontrolne tocke racionalne Bezierjeve krivulje,
%  w    seznam utezi racionalne Bezierjeve krivulje,
%  t    stevilo, ki doloca vrednost delilnega parametra v
%       de Casteljaujevem postopku
%
% Izhodni podatek:
%  b    vrstica, ki predstavlja tocko na racionalni
%       Bezierjevi krivulji pri parametru t
[n,d] = size(B);

Mb = NaN(n,n);
W = zeros(n,n);
b = zeros(1,d);

W(:,1) = w';

for j = 1:d
    Mb(:,1) = B(:,j);
    for r =2:n
        for i=1:(n+1)-r
            W(i,r) = (1-t)*W(i, r-1) + t*W(i+1, r-1);
            Mb(i,r) = (1-t)*(W(i,r-1))/(W(i,r))*Mb(i, r-1) + t*(W(i+1, r-1))/(W(i,r))*Mb(i+1, r-1);
        end
    end
    b(j) = Mb(1,end);
end
b;
end