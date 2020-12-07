%==== NALOGA 15.
%Domenski trikotnik:
T = [0 0; 5 1; 3 3];

%Baricentrične koordinate točk:
P1=[0,0]; U1 = pointbarry(P1,T);
P2=[1,1]; U2 = pointbarry(P2, T);
P3=[4,2]; U3 = pointbarry(P3, T);

%Baricentrične koordinate vektorjev:
x=[1,0]; X = vectorbarry(x, T);
y=[0,1]; Y = vectorbarry(y, T);