function plotLangevin(nl, range)
    x = linspace(-range, range, 100);  % Generate input range
    y = arrayfun(nl, x);  % Apply the nonlinear function to each element of x
    plot(x, y)  % Plot the result
end