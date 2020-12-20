function [b0] = decasteljau3(B,U)
% DeCasteljaujev postopek na trikotniku U vrstica, kjer so baricentrične
% koordinate točk, glede na trikotnik, za katerega delamo razcvet. 

n1 = size(B,1);
n = n1-1;
u = zeros(n,3);

[m d] = size(U);

% v matriki u so vse iste vrstice, kot v U < n-krat zapišemo vrstico z
% baricentričnimi koordinbatami točke

b0=zeros(m,1);

for k=1:m
    t= U(k,:);
    for i = 1:n
        u(i,:)=t; %decasteljev seveda izvede blossom na vsakem koraku decastelj. algoritma
    end
    b0(k)=blossom3(B,u);
end

b0=b0;
end
