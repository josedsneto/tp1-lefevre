N = 100; # Number of iterations

Y = zeros(N,1); # yk
Y(1) = 2; # First term of series

E = zeros(N,1); # Error in terms of iteration

for i = 1:N
  p1 = (Y(i)/(2^i))^2;
  p2 = sqrt(1 - p1);
  p3 = p1/(1+ p2);

  Y(i+1) = (2^i) * sqrt(2*p3);
  E(i) = abs(pi - Y(i));

end

save("pi_arch_error.mat","E", "Y");

h=figure();
semilogy(1:N, E, "-sr");
grid();
%title('Error of \pi with Archimedes method, stable implementation');
#ylabel('|\pi - \pi_{archimedes}|');
xlabel("Number of Iterations");
legend('|\pi - \pi_{archimedes}|');
set(h,'PaperSize',[5 5]);
%print(h,'error_pi_stable', '-dpdf', '-r300', '-bestfit');
print(h,'error_pi_stable', '-dpng', '-r300');

h2=figure();
plot(1:N+1, Y, "-sg"); hold on
plot(1:N+1, ones(N+1,1)*pi, "--b");
grid();
%title('Value of \pi with Archimedes method, stable implementation');
xlabel("Number of Iterations");
legend('\pi_{archimedes}', '\pi');
set(h2,'PaperSize',[5 5]);
print(h2,'error_stable_plot', '-dpng', '-r300');
