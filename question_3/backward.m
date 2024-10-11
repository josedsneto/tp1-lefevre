m = 10;
a = 10;

I = zeros(m,1)
I(1) = 0;

for i = 1:m
  j = m-i+1;
  I(i+1) = (1/a)*(1/j - I(i));
end
I

