%===== NALOGA 4 =====
d = 40/101;

D = zeros(8,2);
for j=-1:6
    D(j+2,:) = [sin(pi*j/3), 2*cos(pi*j/4)+1];
end

P = D([1 3 4 5 6 8],:);
u = alphaparam(P, d);

%=== a) ========================================
maks = max(diff(u));

%=== b) ========================================

B = beziercubspline(u, D);

razdalja = norm(B{4}(1,:)-D(1,:));


%=== c) ========================================



