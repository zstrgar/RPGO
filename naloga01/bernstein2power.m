function p = bernstein2power(b)
%Opis:
%Funkcija bernstein2power pretvori polinom, predstvaljen s 
%koeficienti v Bernsteinovi bazi, v polinom, predstavljen
%v potenčni bazi.
%
%Vhodni podatek:
% b     seznam koeficientov dolžine n+1, ki po vrsti
%       pripadajo razvoju polinoma stopnje n v Bernsteinovi
%       bazi od 0-tega do n-tega Bernesteinovega
%       polinoma
%
%Izhodni podatek:
%   p   seznam koeficientov dolžine n+1, ki po vrsti
%       pripadajo razvoju polinoma stopnje n v potenčni
%       bazi od x^n do 1

n = length(b)-1;
p = zeros(n+1);

for i=0:n
    for j=i:n
        p(i+1,j+1) = b(i+1)*(-1)^(i+j)*nchoosek(n,j)*nchoosek(j,i);
    end
end

p=fliplr(sum(p));   %fliplr prebere matriko(vektor) iz desne proti levi
                    %sum sešteje vrednosti v stolpcu

end

