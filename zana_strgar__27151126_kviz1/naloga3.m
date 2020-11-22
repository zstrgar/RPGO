%===== NALOGA 3 =====
c = 379/101;

b0 = [0 -1 1];
b1 = [3 2 -2];
b2 = [2 5 c];
b3 = [4 2 -2];

B = [b0; b1; b2; b3];

%=== a) ================================


%=== b) ================================
t = 0.5;
BS = beziersub(B,t);

%dolžina prvega poligona
p1 = BS{1};
dolzina1 =0;
for i=1:3
    razlika = p1(i+1,:)-p1(i,:);
    dolzina1 = dolzina1 + norm(razlika);
end

p2=BS{2};
dolzina2 =0;
for i=1:3
    razlika = p2(i+1,:)- p2(i,:);
    dolzina2 = dolzina2 + norm(razlika);
end

razmerje = dolzina1/dolzina2;

%=== c) ========
dolzina = dolzina1+dolzina2



