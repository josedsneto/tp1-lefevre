N = 50;
X = zeros(N,1);
X_prime = zeros(N-2,1);
x = 0;
X(1) = x;

for i=2:N
    X(i) = cos(X(i-1));
end

%syms y
%eq = cos(y) == y;
%s = solve(eq,y);

for i=1:N-2
    J = [2*x + 2, -2*y; 2*x.*y, x.^2 + 1];

    X_prime(i) = X(i) - (X(i+1)-X(i))/(X(i+2)-2*X(i+1)+X(i));
end

s = X(end);
%mu = abs(X(30 + 1) - s)/abs(X(30) - s);

ek = abs(X(1:N-1) - s);
log_ek = log10(ek);

I = 20;
order1 = (log_ek(I+1) - log_ek(I))/(log_ek(I) - log_ek(I-1));

vitesse1 = -log10(ek(2:end))+1*log(ek(1:end-1));

s = X_prime(end);
%mu = abs(X(30 + 1) - s)/abs(X(30) - s);

ek_prime = abs(X_prime(1:N-2) - s);
log_ek_prime = log10(ek_prime);

I = 20;
order2 = (log_ek_prime(I+1) - log_ek_prime(I))/(log_ek_prime(I) - log_ek_prime(I - 1));

vitesse2 = -log10(abs(ek_prime(2:end)./ek_prime(1:end-1)));

figure();
plot(1:N-2, X_prime, "-sb"); hold on
xlabel('n');
%ylabel('x');
legend('x_n = cos(x_{n-1})');
set(gcf,'PaperSize',[10 10]);
print(gcf,'aitken_delta2_cos_point_fixe', '-dpdf', '-r300', '-bestfit');

figure();
plot(log_ek(2:N-3), log_ek(1:N-4), "-sr"); hold on
xlabel('log_{10}e_{k+1}');
ylabel('log_{10}e_{k}');
legend('ek');
set(gcf,'PaperSize',[10 10]);
print(gcf,'aitken_delta2_log_ek_fp', '-dpdf', '-r300', '-bestfit');

%figure();
%plot(vitesse1, "-sb"); hold on
%plot(vitesse2, "-sr"); 
%xlabel('n');
%ylabel('x');
%legend('Vitesse1','Vitesse2');
%set(gcf,'PaperSize',[10 10]);
%print(gcf,'aitken_vitesse_cos_point_fixe', '-dpdf', '-r300', '-bestfit');

figure();
plot(ek(2:end),ek(1:end-1), "-sb"); hold on
plot(ek_prime(2:end),ek_prime(1:end-1), "-sr"); 
xlabel('n');
%ylabel('x');
legend('Cn1','Cn2');
set(gcf,'PaperSize',[10 10]);
print(gcf,'aitken_vitesse_cos_point_fixe', '-dpdf', '-r300', '-bestfit');