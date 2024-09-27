N = 100

x0 = -20;

x = abs(x0);

Y = zeros(N,1);
Y(1) = 1;

# verkificar se x < 0, se sim, cqlculqr exp(abs(x))

E = zeros(N,1);

for i = 1:N
  Y(i + 1) = Y(i) + x^i/factorial(i);

end

# Calculate theoretical bounding error
be = abs(x)^N / factorial(N)

if (x0 < 0)
  y = 1/Y(N);
else
  y = Y(N);
end

y

# se x< 0, calcular 1/exp(abs(x))

# For a negative number, we could start from the end/ calculate
# the positive then make the division


#semilogy(E,1:N)
#semilogy(1:N, E), hold on
#semilogy(1:N, pi* ones(N,1))
