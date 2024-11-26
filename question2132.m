N = 50;
X = zeros(N,1);
x0 = 0;
X(1) = x0;

% Find the fixed point with Newton-Raphson's method
s = nrSolve( @(x) (10*cos(x) - x), 0, 20, 0.001);

for i=2:N
    X(i) = X(i-1) + (10*cos(X(i-1)) - X(i-1))/(1 + 10*sin(X(i-1)));
end

e = abs(X - s);
Cn = -log10(e/s);
log_e = log10(e);

beta = (log_e(3:N) - log_e(2:N-1))./(log_e(2:N-1) - log_e(1:N-2));

% Plot of xn
figure();
plot(1:N, X, "-sb"); hold on
xlabel('n');
ylabel('x_n = cos(x_{n-1})');
legend('x_n = cos(x_{n-1})');
set(gcf,'PaperSize',[10 10]);
print(gcf,'cos_nr10', '-dpdf', '-r300', '-bestfit');

% Plot of Cn, the number of significative digits
figure();
plot(Cn, "-sk"); hold on
xlabel('n');
legend('Cn');
set(gcf,'PaperSize',[10 10]);
print(gcf,'cn_nr10', '-dpdf', '-r300', '-bestfit');

% Plot of log(ek) x log(ek+1)
figure();
plot(log_e(2:N-1), log_e(1:N-2), "-sr"); hold on
xlabel('log_{10}e_{k+1}');
ylabel('log_{10}e_{k}');
set(gcf,'PaperSize',[10 10]);
print(gcf,'log_e_nr10', '-dpdf', '-r300', '-bestfit');
 