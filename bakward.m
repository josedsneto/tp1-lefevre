m = 10 # m == N
a = 10;

I = 0;

for i = m:-1:1
  i
  I = (1/a)*(1/i - I)
end

