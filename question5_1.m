N = 10;
k = 3;
alpha = 5;

X = zeros(1,N);

X(1) = 3;

for i=1:N-1
    X(i+1) = X(i) - (X(i) - alpha*X(i)/X(i)^k)/3;
end

x_converged = X(end);

ek = X - x_converged;
log_ek = -log10(abs(ek(1:end-1)/x_converged));

figure();
plot(X(:), "-sr"); hold on
yline(x_converged, 'b');
xlabel('k');
ylabel('X_k');
legend('x_k',['x_s = ',num2str(x_converged)]);
set(gcf,'PaperSize',[10 10]);
print(gcf,'convergence_racine_3_5', '-dpdf', '-r300', '-bestfit');

figure();
plot(log_ek, "-sr"); hold on
xlabel('k');
ylabel('X_k');
%legend('x_k',['x_s = ',num2str(x_converged)]);
set(gcf,'PaperSize',[10 10]);
print(gcf,'chiffres_significatifs_racine_3_5', '-dpdf', '-r300', '-bestfit');