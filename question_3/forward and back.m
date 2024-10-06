
# Only forward
N = 10;
a = 10;

#y = 2;
Y = zeros(N,1);
Y(1) = log((1+a)/a);

E = zeros(N,1);

for i = 1:N
  Y(i+1) = 1/i -a*Y(i);
  i
  y = Y(i+1)

end

y = Y(N);



