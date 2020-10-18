%Nariši Bernsteinove bazne polinome stopnje n

x=0:0.01:1;

n = 5;

%bernsteinovi bazni polinomi zloženi v diagonalno matriko
b = diag(ones(1,n+1));

%graf
for i=1:(n+1)
    b(i,:) = bernstein2power(b(i,:));
    y = polyval(b(i,:),x);
    plot(x,y);
    hold on
end


