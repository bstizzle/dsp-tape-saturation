function output = Langevin_d(x)
    if ismatrix(x)  % Check if x is an array
        output = (1 ./ x.^2) - (1 ./ tanh(x)).^2 + 1;
        output(abs(x) <= 10^(-4)) = 1 / 3;
    else
        if abs(x) > 10^(-4)
            output = (1 / x^2) - (1 / tanh(x))^2 + 1;  % Langevin derivative for values larger than threshold
        else
            output = 1 / 3;  % Langevin derivative for values smaller or equal to the threshold
        end
    end
end