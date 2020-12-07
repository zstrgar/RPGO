function B = lsqbezier2(m,n,P)
% Opis:
%  lsqbezier2 vrne kontrolne tocke tenzorskega polinoma, ki
%  po metodi najmanjsih kvadratov najbolje aproksimira dane
%  podatke
%
% Definicija:
%  B = lsqbezier2(m,n,P)
%
% Vhodni podatki:
%  m,n      parametra, ki dolocata stopnjo polinoma,
%  P        matrika podatkov, ki v vsaki vrstici vsebuje
%           parametra z intervala [0,1] ter njima
%           pripadajoco vrednost, ki jo aproksimiramo
%
% Izhodni podatek:
%  B        matrika velikosti n+1 x m+1, ki vsebuje
%           koeficiente polinoma, ki po metodi najmanjsih
%           kvadratov najbolje aproksimira dane podatke

K = length(P);
f = P(:,end);
u = P(:,1);
v = P(:,2);

Bm=zeros(K, m+1);
for k=1:K
    for i=1:m+1
        Bm(k,i) = nchoosek(m, i-1)*u(k)^(i-1) * (1-u(k))^(m-(i-1));
    end
end

Bn=zeros(K, n+1);
for k=1:K
    for j=1:n+1
        Bn(k,j) = nchoosek(n, j-1)*v(k)^(j-1)*(1-v(k))^(n-(j-1));
    end
end

M=zeros(K, (m+1)*(n+1));
for k=1:K
    s=1;            %stevec da lahko skačem za n+1 po stolpcih
    for i=1:m+1
        M(k, s:(i*(n+1))) = Bm(k,i).*Bn(k,:);
        s = s+(n+1);
    end
end

B = M\f;
B=reshape(B, [n+1, m+1]);

end

