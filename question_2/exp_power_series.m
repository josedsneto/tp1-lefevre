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

h = figure();
semilogy(1:N+1, E, "-sr"); hold on
semilogy(1:N+1, ones(N+1)*be, "--k");
grid();
%title('Error of exp(10) through power series');
%ylabel('|exp(10) - exp(10)_{power series}|');
xlabel("Number of Iterations");
legend('|exp(-20) - exp(-20)_{power series}|', 'Bounding Error |x|^n/n!');
set(h,'PaperSize',[5 5]);
%print(h2,'pi_plot', '-dpng', '-r300', '-bestfit');
print(h,'exp_err_plot_-20_good', '-dpng', '-r300');

h2 = figure();
plot(1:N + 1, Y, "-sg"); hold on
plot(1:N + 1, ones(N+1)*exp(x), "--b");
grid();
%title('Value of exp(10) through power series');
xlabel("Number of Iterations");
legend('exp(-20)_{power series}', 'exp(-20)');

set(h2,'PaperSize',[5 5]);
%print(h2,'pi_plot', '-dpng', '-r300', '-bestfit');
print(h2,'exp_plot_-20_good', '-dpng', '-r300');


