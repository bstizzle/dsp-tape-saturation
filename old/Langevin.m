function output = Langevin(x)
    if ismatrix(x)  % Check if x is an array
        %{
            implementing this section as it was done in the python for the
            paper, it causes infinite recursion

        t = x;  % MATLAB passes arrays by reference, so no need for copy
        for n = 1:length(x)
            t(n) = Langevin(t(n));  % Recursively call L for each element
        end
        result = t;  % Return the modified array
        %}
        
        % so instead do it with explicit element-wise division
        output = (1 ./ tanh(x)) - (1 ./ x);
        output(abs(x) <= 10^(-4)) = x(abs(x) <= 10^(-4)) / 3;
    else
        if abs(x) > 10^(-4)
            output = (1 / tanh(x)) - (1 / x);  % Compute for values larger than threshold
        else
            output = x / 3;  % Compute for values smaller or equal to the threshold
        end
    end
end