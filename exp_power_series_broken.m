
x = -20;

N = ceil(2*abs(x));

Y = zeros(N,1);
Y(1) = 1;

E = zeros(N,1);

for i = 1:N
  Y(i + 1) = Y(i) + x^i/factorial(i);
  E(i + 1) = abs(Y(i + 1) - exp(x))
end

# Calculate theoretical bounding error
be = abs(x)^N / factorial(N)

figure();
semilogy(1:Nit, E, "-sr");
#semilogy(1:Nit, ones(Nit)*e, "--k");
title('Error of exp(10) through power series');
ylabel('|exp(10) - exp(10)_{power series}|');
xlabel("n - Number of Iterations-");
#legend('|\pi - \pi_{agm}|', 'Error threshold for agm');

figure();
plot(1:N + 1, Y, "-sg"); hold on
plot(1:N + 1, ones(N+1)*exp(x), "--b");
title('Value of exp(10) through power series');
xlabel("n - Number of Iterations -");
legend('exp(10)_{power series}', 'exp(10)');
tight();


