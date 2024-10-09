x0 = -20;

x = abs(x0);
N = ceil(2*x);

Y = zeros(N,1);
Y(1) = 1;

E = zeros(N,1);

for i = 1:N
  Y(i + 1) = Y(i) + x^i/factorial(i);
end

# Calculate theoretical bounding error
be = abs(x)^N / factorial(N);

if (x0 < 0)
  Z = 1./Y;
  E = abs(Z - exp(x0));
else
  Z = Y;
end

figure();
semilogy(1:N+1, E, "-sr"); hold on
semilogy(1:N+1, ones(N+1)*be, "--k");
title('Error of exp(10) through power series');
#ylabel('|exp(10) - exp(10)_{power series}|');
xlabel("n - Number of Iterations-");
legend('|exp(10) - exp(10)_{power series}|', 'Bounding Error |x|^n/n!');

figure();
plot(1:N + 1, Y, "-sg"); hold on
plot(1:N + 1, ones(N+1)*exp(x), "--b");
title('Value of exp(10) through power series');
xlabel("n - Number of Iterations -");
legend('exp(10)_{power series}', 'exp(10)');
tight();


