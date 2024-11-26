function xn = nrSolve(f,x0,N,h)
    xn = x0;
    for n = 1:N
        xn = xn - f(xn)/numDeriv(f,xn,h);
    end
end