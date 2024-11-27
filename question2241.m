N = 10;
k = 3;
alpha = 5;

X = zeros(1,N);
X(1) = 1;


% Find the fixed point with Newton-Raphson's method
s = nrSolve( @(x) (x^k - alpha), 1, 20, 0.0001);

for i=1:N-1
    X(i+1) = X(i) - (X(i) - alpha*X(i)/X(i)^k)/3;
end

e = abs(X - s);
Ck = -log10(e/s);

figure();
plot(X(:), "-sr"); hold on
yline(s, 'b');
xlabel('k');
legend('x_k',['x_s = ',num2str(s)]);
set(gcf,'PaperSize',[10 10]);
print(gcf,'convergence_racine_3_5', '-dpdf', '-r300', '-bestfit');

figure();
plot(Ck(1:6), "-sr"); hold on
xlabel('k');
legend('Ck');
set(gcf,'PaperSize',[10 10]);
print(gcf,'chiffres_significatifs_racine_3_5', '-dpdf', '-r300', '-bestfit');