N = 50;
x = zeros(N,1);
%x = 0;
x(1) = 0.5;

for i=2:N
    x(i) = x(i-1) + (cos(x(i-1)) - x(i-1))/(1+ sin(x(i-1)));
end

%syms y
%eq = cos(y) == y;
%s = solve(eq,y);

s = x(end);
%mu = abs(x(30 + 1) - s)/abs(x(30) - s);

ek = abs(x(1:N-1) - s);
log_ek = log10(ek);

I = 3;
order = (log_ek(I+1) - log_ek(I))/(log_ek(I) - log_ek(I - 1));



figure();
plot(1:N, x, "-sb"); hold on
xlabel('n');
%ylabel('x');
legend('x_n = x_{n-1} + (cos(x) - x)/(sin(x)+1)');
set(gcf,'PaperSize',[10 10]);
print(gcf,'cos_nr', '-dpdf', '-r300', '-bestfit');

figure();
plot(log_ek(2:N-1), log_ek(1:N-2), "-sr"); hold on
xlabel('log_{10}e_{k+1}');
ylabel('log_{10}e_{k}');
%legend('ek = cos(x_n) - s');
set(gcf,'PaperSize',[10 10]);
print(gcf,'log_ek_nr', '-dpdf', '-r300', '-bestfit');
 