N = 30;
k = 3;
alpha = 5;

X = zeros(1,N);
X(1) = 0.5; % a
X(1) = 1.0; % a2



% Find the fixed point with Newton-Raphson's method
s = nrSolve( @(x) (x^k - alpha), 1, 20, 0.0001);

for i=3:N
    a1 = X(i-2);
    a2 = X(i-1);
    if a1 == a2
        X(i) = a1;
    else
        X(i) = a2 - (a2^k - alpha)*(a2 - a1)/(a2^k - a1^k);
    end
end

e = abs(X - s);
Ck = -log10(e/s);

figure();
plot(X(:), "-sr"); hold on
yline(s, 'b');
xlabel('k');
legend('x_k',['x_s = ',num2str(s)]);
set(gcf,'PaperSize',[10 10]);
print(gcf,'convergence_racine_3_5_sec', '-dpdf', '-r300', '-bestfit');

figure();
plot(Ck, "-sr"); hold on
xlabel('k');
legend('Ck');
set(gcf,'PaperSize',[10 10]);
print(gcf,'chiffres_significatifs_racine_3_5_sec', '-dpdf', '-r300', '-bestfit');