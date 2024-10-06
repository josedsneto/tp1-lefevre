
N = 100

#y = 2;
Y = zeros(N,1);
Y(1) = 2;

E = zeros(N,1);

for i = 1:N
  p1 = (Y(i)/(2^i))^2;
  p2 = sqrt(1 - p1);
  p3 = p1/(1+ p2);

  Y(i+1) = (2^i) * sqrt(2*p3);
  E(i) = abs(pi - Y(i));

end


#semilogy(E,1:N)
semilogy(1:N, E), hold on
#semilogy(1:N, pi* ones(N,1))

