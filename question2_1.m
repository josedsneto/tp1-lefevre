N = 50;
cossenos = zeros(N,1);
x = 0;
cossenos(1) = x;

for i=2:N
    cossenos(i) =  cos(cossenos(i-1));
end

%syms y
%eq = cos(y) == y;
%s = solve(eq,y);

s = cossenos(end);
%mu = abs(cossenos(30 + 1) - s)/abs(cossenos(30) - s);

ek = abs(cossenos(1:N-1) - s);
log_ek = log10(ek);

I = 20;
order = (log_ek(I+1) - log_ek(I))/(log_ek(I) - log_ek(I - 1));

figure();
plot(1:N, cossenos, "-sb"); hold on
xlabel('n');
%ylabel('x');
legend('x_n = cos(x_{n-1})');
set(gcf,'PaperSize',[10 10]);
print(gcf,'cos_point_fixe', '-dpdf', '-r300', '-bestfit');

figure();
plot(log_ek(2:N-1), log_ek(1:N-2), "-sr"); hold on
xlabel('log_{10}e_{k+1}');
ylabel('log_{10}e_{k}');
%legend('ek = cos(x_n) - s');
set(gcf,'PaperSize',[10 10]);
print(gcf,'log_ek_fp', '-dpdf', '-r300', '-bestfit');
 