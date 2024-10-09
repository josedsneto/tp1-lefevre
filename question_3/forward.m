N = 1000;
a = 1;

I = zeros(N,1);
I(1) = log((1+a)/a);


for i = 1:N
  I(i+1) = 1/i -a*I(i);
end

figure();
plot(I, "-sg"); hold on
title('Value of I_n through forward method');
ylim([0 0.1])
xlabel("n");
legend('I_n');
tight();


