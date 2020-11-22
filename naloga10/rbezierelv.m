function [Be,we] = rbezierelv(B,w)
% Opis:
%  rbezierelv izvede visanje stopnje dane racionalne
%  Bezierjeve krivulje
%
% Definicija:
%  [Be,we] = rbezierelv(B,w)
%
% Vhodna podatka:
%  B    matrika velikosti (n+1) x d, v kateri vsaka vrstica
%       predstavlja d-dimenzionalno kontrolno tocko
%       racionalne Bezierjeve krivulje stopnje n,
%  w    seznam uteži racionalne Bezierjeve krivulje
%
% Izhodni podatek:
%  Be   matrika velikosti n+2 x d, v kateri vsaka vrstica
%       predstavlja d-dimenzionalno kontrolno tocko
%       racionalne Bezierjeve krvulje stopnje n+1, ki je
%       prirejena dani racionalni Bezierjevi krivulji,
%  we   seznam dolzine n+2, v katerem vsak element
%       predstavlja utez racionalne Bezierjeve krvulje
%       stopnje n+1, ki je prirejena dani racionalni
%       Bezierjevi krivulji
[n,d]=size(B);

%kontrolne točke polinomske Bezierjeve krivulje
Bp=zeros(n,d+1);
for i=1:n
    Bp(i,:) = [w(i)*B(i,:), w(i)];
end

%dvig stopnje za 1 polinomske Bp
Bpe = bezierelv(Bp, 1);

%določim nove kontrolne točke (zadnje komponente Bpe)
we = Bpe(:,end);

%kontrolne točke (preostali del kontrolne točke Bpe delimo z we(i))
for i = 1:n+1
    Be(i,:) = Bpe(i, 1:end-1)/we(i);
end


end

