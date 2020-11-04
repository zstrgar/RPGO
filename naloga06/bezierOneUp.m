function Be = bezierOneUp(B)
% Opis :
%   bezierOneUp izvede visanje stopnje dane Bezierjeve krivulje za eno
%   stopnjo
%
% Definicija :
%    Be = bezierOneUp (B)
%
% Vhodni podatek :
%   B   matrika velikosti (n +1) x d, v kateri vsaka vrstica
%       predstavlja d- dimenzionalno kontrolno tocko
%       Bezierjeve krivulje stopnje n,
%       dane Bezierjeve krivulje
% Izhodni podatek :
%   Be  matrika velikosti (n+2) x d, v kateri vsaka
%       vrstica predstavlja d- dimenzionalno kontrolno tocko
%       Bezierjeve krvulje stopnje n+1, ki ustreza dani
%       Bezierjevi krivulji

[n, d] = size(B);
n = n-1;
B = [zeros(1, d); B; zeros(1,d)];

Be = zeros(n,d);
for i=0:n+1
    Be(i+1,:) = B(i+1,:)*i/(n+1) + B(i+2,:)*(1-i/(n+1));
end
Be;
end



