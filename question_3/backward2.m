m = 1000;
a = 1;

I = zeros(m,1);
I(m) = 0;

for i = m:-1:2
  I(i-1) = (1/a)*(1/i - I(i));
end
I;

figure();
plot(I, "-sg"); hold on
title('Value of I^{(m)}_n through backward method');
xlabel("n");
legend('I^{(m)}_n');
tight();
