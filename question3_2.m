N = 50;
X = zeros(N,1);
x = 0;
X(1) = x;

for i=2:N
    if cos(X(i-1)) == X(i-1)
        X(i) = X(i-1);
    else
        X(i) =  X(i-1) - (cos(X(i-1))-X(i-1))^2/(cos(cos(X(i-1)))-2*cos(X(i-1))+X(i-1));
    end
end

%syms y
%eq = cos(y) == y;
%s = solve(eq,y);

s = X(end);
%mu = abs(X(30 + 1) - s)/abs(X(30) - s);

ek = abs(X(1:N-1) - s);
log_ek = log10(ek);

I = 2;
order = (log_ek(I+1) - log_ek(I))/(log_ek(I) - log_ek(I - 1));

figure();
plot(1:N, X, "-sb"); hold on
xlabel('n');
%ylabel('x');
legend('x_n = cos(x_{n-1})');
set(gcf,'PaperSize',[10 10]);
print(gcf,'aitken_cos_point_fixe', '-dpdf', '-r300', '-bestfit');

figure();
plot(log_ek(2:N-1), log_ek(1:N-2), "-sr"); hold on
xlabel('log_{10}e_{k+1}');
ylabel('log_{10}e_{k}');
%legend('ek = cos(x_n) - s');
set(gcf,'PaperSize',[10 10]);
print(gcf,'aitken_log_ek_fp', '-dpdf', '-r300', '-bestfit');
 