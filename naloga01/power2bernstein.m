function b = power2bernstein(p)
%Opis:
% power2bernstein pretvori polinom, predstavljen s
% koeficienti v potenčni bazi, v polinom, predstavljen 
% v Bernsteinovi bazi
%
% Vhodni podatek:
%   p   seznam koeficientov dolžine n+1, ki po vrsti
%       pripadajo razvoju polinoma stopnje n v potenčni
%       bazi od x^n do 1
% Izhod:
%   b   seznam koeficientov dolžine n+1, ki po vrsti
%       pripadajo razvoju polinoma stopnje n v Bernsteinovi
%       bazi od 0-tega do n-tega Bernsteinovega
%       polinoma

p = fliplr(p);
n=length(p) - 1;

%matrika koeficientov v bernsteinovi bazi
b=zeros(n+1);
for i = 0:n
    for j = i:n
        b(i+1,j+1)= p(i+1) * nchoosek(j,i) / nchoosek(n,i);
    end
end
b=sum(b);    
end

