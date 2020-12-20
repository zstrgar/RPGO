function b = blossom3(B,U)
% Opis:
%  blossom3 izracuna razcvet polinoma dveh spremenljivk
%
% Definicija:
%  b = blossom3(B,U)
%
% Vhodna podatka:
%  B    matrika velikosti n+1 x n+1, ki predstavlja
%       koeficiente polinoma dveh spremenljivk stopnje n v
%       Bezierjevi obliki (element matrike na mestu (i,j),
%       j <= n+2-i, doloca koeficient polinoma z indeksom
%       (n+2-i-j, j-1, i-1)),
%  U    matrika velikosti n x 3, v kateri vrstice
%       predstavljajo baricentricne koordinate tock ali
%       vektorjev glede na domenski trikotnik, za katere
%       izvajamo razcvet polinoma
%
% Izhodni podatek:
%  b    vrednost razcveta polinoma, dolocenega z matriko B,
%       v tockah, dolocenih z matriko U

%stopnja
n = size(U,1);

%naredimo en razcvet
for r=1:n
u = U(r,1);
v = U(r,2);
w = U(r,3);
    for i = 1:((n+1)- r)    % gremo čez vrstice
        for j = 1:((n+1)- r)    %gremo čez stolpce
            B(i,j) = u*B(i,j)+v*B(i,j+1)+w*B(i+1,j);
        end
    end
end 

b = B(1,1);
end


