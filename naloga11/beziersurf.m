function graf = beziersurf(Bx,By,Bz,d)
% Opis:
%  beziersurf za podane kontrolne točke nariše Bezierjevo ploskev
%  in pripadajočo kontrolno mrežo
%
% Definicija:
%  graf = beziersurf(Bx,By,Bz)
%
% Vhodni podatki:
%  Bx, By, Bz   matrike velikosti n+1 x m+1, ki dolocajo
%               koordinate kontrolnih tock,
%   d           določimo, kako fino delitev želimo (smiselno je 10,50,100)
%
% Izhodni podatki:
%  graf     vsebuje narisano ploskev in kontrolno mrežo

u = linspace(0,1,d);
v = linspace(0,1,d);

[bx by bz] = bezier2(Bx,By,Bz,u,v);
surf(bx, by, bz);
hold on
mesh(Bx, By, Bz, 'FaceColor', 'None');  %prozorne pravokotnike naredi
hold on
end