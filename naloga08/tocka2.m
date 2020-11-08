%Kubicni C^2 zlepek

%Kontrolne tocke kubicnega C^2 zlepka in tocke za parametrizacijo:
D = [-5 0; -4 1; -2 -1; 0 3; 3 0; 5 2; 7 -1];
P = D([1 3 4 5 7],:);

%Enakomerna parametrizacija:
u1 = alphaparam(P,0);
B1 = beziercubspline(u1,D);

%Centripetalna parametrizacija:
u2 = alphaparam(P,0.5);
B2 = beziercubspline(u2,D);


%Tetivna parametrizacija:
u3 = alphaparam(P,1);
B3 = beziercubspline(u3,D);