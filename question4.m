N = 50;
x = 1:N;
y = 1:N;

X = zeros(2,N);

Xn = zeros(N);
Yn = zeros(N);

F = zeros(2,N);

X(:,1) = [-5,-5];

for i = 1:N-1
    xk = X(1,i);
    yk = X(2,i);
    
    X(:,i+1) = X(:,i) - [2*xk + 2, -2*yk; 2*xk*yk, xk^2 + 1]\[xk^2 - yk^2 + 2*xk, xk^2*yk + yk - 1].';
end

x_converged = X(1,end);
y_converged = X(2,end);

figure();
plot(X(1,:), "-sr"); hold on
yline(x_converged, 'b');
plot(X(2,:),'-sk');
yline(y_converged, 'b');
xlabel('k');
ylabel('X_k');
title('Deuxième racine');
legend('x_k',['x_s = ',num2str(x_converged)],'y_k',['y_s = ',num2str(y_converged)]);
set(gcf,'PaperSize',[10 10]);
print(gcf,'convergence_FX_deuxieme_racine', '-dpdf', '-r300', '-bestfit');