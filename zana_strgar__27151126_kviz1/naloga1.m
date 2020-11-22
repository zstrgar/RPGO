%===== NALOGA 1 =====
a = 33/101;

p1=[-1 6 a];
p2=[5 -4 1];

%kontrolne točke Bezierjeve krivulje so v matriki B
B(:,1)=(power2bernstein(p1))';
B(:,2)=(power2bernstein(p2))';

%=== a) ============================================
%oddaljenost b2 od izhodišča
b2 = B(end,:);
d1 = norm(b2) ;

%=== b) ============================================
%transformirana krivulja
BT = [1 -1].*(B + [a,1]);

t=1/2;
T = bezier(BT, t);
d2 = norm(T-b2);

%=== c) ============================================
prva_komponenta = bernstein2power(BT(:, 1));
prosti_clen = prva_komponenta(end);




