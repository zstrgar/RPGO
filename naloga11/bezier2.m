function [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
% Opis:
%  bezier2 vrne tocke na Bezierjevi ploskvi iz tenzorskega
%  produkta
%
% Definicija:
%  [bx,by,bz] = bezier2(Bx,By,Bz,u,v)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki dolocajo
%               koordinate kontrolnih tock,
%  u, v         vrstici dolzine M in N, ki predstavljata
%               parametre v smereh u in v
%
% Izhodni podatki:
%  bx, by, bz   matrike velikosti N x M, ki predstavljajo
%               tocke na Bezierjevi ploskvi:
%               [bx(J,I) by(J,I) bz(J,I)] je tocka pri
%               parametrih u(I) in v(J)
[n,m]=size(Bx);
M = length(u);
N = length(v);

b1x = zeros(N, m);
b1y = zeros(N, m);
b1z = zeros(N, m);

% m deCasteljaujevih postopkov za parameter v
for i=1:m
    b1x(:,i) = bezier(Bx(:,i), v);
    b1y(:,i) = bezier(By(:,i), v);
    b1z(:,i) = bezier(Bz(:,i), v);
end

bx=zeros(N, M);
by=zeros(N, M);
bz=zeros(N, M);

% pri vsakem v-ju (to je 1:N) izračunamo deCasteljaujev algoritem za vrstice v
% matriki b1x, b1y, b1z in zapolnimo še stolpce. Rabili smo 2x
% transponirati.

for j=1:N
    bx(j,:) = bezier(b1x(j, :)', u)';
    by(j,:) = bezier(b1y(j, :)', u)';
    bz(j,:) = bezier(b1z(j, :)', u)';
end


end