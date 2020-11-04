function Be = bezierelv(B,k)
% Opis:
%  bezierelv izvede visanje stopnje dane Bezierjeve krivulje
%
% Definicija:
%  Be = bezierelv(B,k)
%
% Vhodna podatka:
%  B    matrika velikosti (n+1) x d, v kateri vsaka vrstica
%       predstavlja d-dimenzionalno kontrolno tocko
%       Bezierjeve krivulje stopnje n,
%  k    stevilo, ki doloca, za koliko zelimo zvisati stopnjo
%       dane Bezierjeve krivulje
%
% Izhodni podatek:
%  Be   matrika velikosti (n+k+1) x d, v kateri vsaka
%       vrstica predstavlja d-dimenzionalno kontrolno tocko
%       Bezierjeve krvulje stopnje n+k, ki ustreza dani
%       Bezierjevi krivulji


if k == 1
    Be = bezierOneUp(B);
else
    Be = bezierelv(bezierOneUp(B), k-1);
end

Be;
end
