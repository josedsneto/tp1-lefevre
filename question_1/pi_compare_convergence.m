#Compare the convergence between the values of pi obtained by the agm method and arch. method

N = 1e3;

a = N;
b = 4;

Nit = 40;
A = zeros(1000);
A(1) = N;

for i = 1:Nit
  a1 = (a+b)/2;
  b1 = sqrt(a*b);
  a = a1;
  b = b1;
  A(i) = a;
end

A = A(1:Nit);

p1 = (log(N)*a)/N;

my_pi = 2*p1;

pi_converging = 2*(log(N)*A)/N;

E = abs(pi_converging -pi);

E_agm = E;

load("pi_arch_error.mat");
E_arch = E(1:Nit);
pi_arch = Y(1:Nit);

h = figure();
semilogy(1:Nit, E_agm, "-sr"); hold on
semilogy(1:Nit, E_arch, "-ob");
grid();
#semilogy(1:Nit, ones(Nit)*e, "--k");
%title('Error of \pi with means method (N = 1e3) and Archimedes method');
%ylabel('|\pi - \pi_{agm}|');
xlabel("Number of Iterations");
legend('|\pi - \pi_{agm}|', '|\pi - \pi_{archimedes}|');

set(h,'PaperSize',[5 5]);
%print(h2,'pi_plot', '-dpng', '-r300', '-bestfit');
print(h,'pi_agm_plot', '-dpng', '-r300');

h2 = figure();
plot(1:Nit, pi_converging, "-sg"); hold on
plot(1:Nit, pi_arch, "-sk");
plot(1:Nit, ones(Nit,1)*pi, "--b");
grid();
%title('Value of \pi with means method');
xlabel("Number of Iterations");
legend('\pi_{agm}','\pi_{archimedes}', '\pi');
%tight();

set(h2,'PaperSize',[5 5]);
%print(h2,'pi_plot', '-dpng', '-r300', '-bestfit');
print(h2,'pi_agm_err_plot', '-dpng', '-r300');


