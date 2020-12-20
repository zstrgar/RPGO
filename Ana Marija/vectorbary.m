function u = vectorbary(vektor,T)
%Funkcija vectorbary vrne baricentriène koorinate glede na trikotnik T,
%(podan kot 3 x 2 matrika [x1 y1; x2 y2; x3 y3])
%vekotrja, ki ga dobimo ko odštejemo toèki (x,y) in (0,0)
%baricentriène koordinate vektorja se vedno seštejejo v 0

%baricentriène koordinate toèke (x,y), uporabimo metodo, ki smo jo samo
%napisali kot funkcijo prej
bar1 = pointbary(vektor,T);
%baricentriène koordinate toèke (0,0)
bar2 = pointbary([0 0],T);
%baricentriène koordinate vektorja
u = bar1 - bar2;
end

