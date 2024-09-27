N = 40; # Number of iterations

Y = zeros(N,1); # yk
Y(1) = 2; # First term of series

E = zeros(N,1); # Error in terms of iteration

for i = 1:N
  sqrt1 = sqrt(1 - ((Y(i)/(2^i))^2)); # This implementation is unstable
  Y(i+1) = (2^i) * sqrt(2*(1-sqrt1));
  E(i) = abs(pi - Y(i));

end

figure();
semilogy(1:N, E, "-sr");
title('Error of \pi with Archimedes method, unstable implementation');
ylabel('|\pi - \pi_{archimedes}|');
xlabel("n - Number of Iterations -");

figure();
plot(1:N+1, Y, "-sg"); hold on
plot(1:N+1, ones(N+1,1)*pi, "--b");
title('Value of \pi with Archimedes method, unstable implementation');
xlabel("n - Number of Iterations -");
legend('\pi_{archimedes}', '\pi');
tight();

