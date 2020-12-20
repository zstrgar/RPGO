function b = decasteljau3 (Bx,By,Bz,U)
% Opis :
%  decasteljau3 izračuna vrednost polinoma dveh spremenljivk v točki U
%
% Definicija :
%  b = decasteljau3 (Bx, By, Bz, U)
%
% Vhodni podatki :
%   Bx, By, Bz  matrike velikosti n+1 x n+1 , ki predstavlja
%               koeficiente polinoma dveh spremenljivk stopnje n v
%               Bezierjevi obliki (element matrike na mestu (i,j),
%               j <= n+2 -i, določa koeficient polinoma z indeksom
%               (n+2-i-j, j-1 , i-1) ),
%   U           matrika velikosti 1 x 3 , ki predstavlja baricentrične 
%               koordinate točk glede na domenski trikotnik
%
% Izhodni podatek :
%   b      vrednost razcveta polinoma , določenega z matrikami Bx, By, Bz
%          v točki U

%stopnja
n = size(Bx,1)-1;

%naredimo seznam baricentricnih koordinat
bar = repmat(U,n,1);

%za vsako koordinato b naredimo blossom3
bx = blossom3(Bx,bar);
by = blossom3(By,bar);
bz = blossom3(Bz,bar);

b = [bx, by, bz];
end