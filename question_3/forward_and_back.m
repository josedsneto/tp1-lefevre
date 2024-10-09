a = 1;
N = 1000;

if (a < 0)
  disp("Result is not defined for a <= 0")
else
  I = zeros(N,1); % Allocate memory

  if (a <= 1)% Forward method converges
    I = zeros(N,1);
    I(1) = log((1+a)/a);
    for i = 1:N
      I(i+1) = 1/i -a*I(i);
    end

  else % Backward method converges
    I(N) = 0;
    for i = N:-1:2
      I(i-1) = (1/a)*(1/i - I(i));
    end
  end

  figure();
  plot(I, "-sg"); hold on
  title('Value of I_n through combined method');
  xlabel("n");
  legend('I_n');
  tight();
end


