
N = 50;
X = zeros(2,N);

X(:,1) = [5,5];

for i = 1:N
    xk = X(1,i);
    yk = X(2,i);

    J = [2*xk + 2, -2*yk; 2*xk*yk, xk^2 + 1];
    F = [xk^2 - yk^2 + 2*xk, xk^2*yk + yk - 1]';
    
    X(:,i+1) = X(:,i) - J\F;
end

x_converged = X(1,end);
y_converged = X(2,end);

e = sqrt(X(1,:).^2 + X(2,:).^2);

figure();
plot(X(1,:), "-sr"); hold on
yline(x_converged, 'b');
plot(X(2,:),'-sk');
yline(y_converged, 'b');
xlabel('k');
ylabel('X_k');
title('First root');
legend('x_k',['s_x = ',num2str(x_converged)],'y_k',['s_y = ',num2str(y_converged)]);
set(gcf,'PaperSize',[10 10]);
print(gcf,'convergence_FX_1st_root', '-dpdf', '-r300', '-bestfit');