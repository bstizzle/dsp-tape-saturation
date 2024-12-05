function output = compr(x,comp,a)
    % Compressor/expander
    % comp - compression: O>comp>-1, expansion: O<comp<1
    % a - filter parameter <l
    h = filter((1-a)^2, [1.0000 -2*a a^2], abs(x));
    h = h / max(h);
    h = h .^ comp;
    y = x .* h;
    output = y .* max(abs(x)) ./ max(abs(y));
end