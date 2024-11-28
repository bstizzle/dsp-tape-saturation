function output = Ld(x)
    if abs(x) > 10^(-4)
        output = (1 / x^2) - (1 / tanh(x))^2 + 1;  % Langevin derivative for values larger than threshold
    else
        output = 1 / 3;  % Langevin derivative for values smaller or equal to the threshold
    end
end