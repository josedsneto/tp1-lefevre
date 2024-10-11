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

  h2 = figure();
  plot(I, "-sg"); hold on
  title('Value of I_n through combined method');
  grid();
  xlabel("n");
  legend('I_n');
  set(h2,'PaperSize',[5 5]);
  print(h2,'forward_and_backward_plot', '-dpng', '-r300');
end


