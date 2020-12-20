function plotbezier3(Bx,By,Bz,d)
% Opis :
% plotbezier3 nariše trikotno ploskev in njeno kontrolno mrežo
%
% Definicija :
% plotbezier3 (Bx ,By ,Bz ,d)
%
% Vhodni podatki :
% Bx , By , Bz  matrike velikosti n+1 x n+1 , ki določajo
%               koordinate kontrolnih točk ploskve
%               (element posamezne matrike na mestu (i,j),
%               j <= n+2-i, določa koordinato kontrolne
%               točke z indeksom (n+2-i-j, j-1 , i-1)),
% d             stevilo intervalov, na katere je razdeljena stranica
%               trikotnika

%sestavim triangulacijo trikotnika
[TRI,U] = trimeshgrid(d);
TRI2 = trimeshgrid((size(Bx,1)-1));

%tocke
b = bezier3(Bx,By,Bz,U);
clf;

trisurf(TRI,b(:,1),b(:,2),b(:,3));
hold on;

trimesh(TRI2,Bx(:),By(:),Bz(:),'facecolor','none');


end