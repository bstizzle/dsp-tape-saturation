function output = L(x)
    if abs(x) > 10^(-4)
        output = (1 / tanh(x)) - (1 / x);  % Compute for values larger than threshold
    else
        output = x / 3;  % Compute for values smaller or equal to the threshold
    end
end