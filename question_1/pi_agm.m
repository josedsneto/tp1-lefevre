N = 1e5;

a = N;
b = 4;

Nit = 0;
A = zeros(1000);
A(1) = N;

e = 1e-6;
while (abs(a-b) > e)
  a1 = (a+b)/2;
  b1 = sqrt(a*b);
  a = a1;
  b = b1;
  Nit += 1;
  A(Nit) = a;
end

A = A(1:Nit);

p1 = (log(N)*a)/N;

my_pi = 2*p1

pi_converging = 2*(log(N)*A)/N;

E = abs(pi_converging -pi);

figure();
semilogy(1:Nit, E, "-sr");
#semilogy(1:Nit, ones(Nit)*e, "--k");
title('Error of \pi with means method');
ylabel('|\pi - \pi_{agm}|');
xlabel("n - Number of Iterations for mean convergence -");
#legend('|\pi - \pi_{agm}|', 'Error threshold for agm');

figure();
plot(1:Nit, pi_converging, "-sg"); hold on
plot(1:Nit, ones(Nit,1)*pi, "--b");
title('Value of \pi with means method');
xlabel("n - Number of Iterations -");
legend('\pi_{agm}', '\pi');
tight();




