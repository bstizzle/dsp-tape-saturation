function output = compr(x,comp,a)
    % comp - compression -1<comp<0
    % a - filter parameter <l

    [~, xC] = size(x);
    y = zeros(size(x));

    if(xC==2)
        x1 = x(:,1);
        x2 = x(:,2);

        h = filter((1-a)^2, [1.0000 -2*a a^2], abs(x1));
        h = h / max(h);
        h = h .^ comp; 
        y1 = x1 .* h;
        y1 = y1 .* max(abs(x1)) / max(abs(y1));

        h = filter((1-a)^2, [1.0000 -2*a a^2], abs(x2));
        h = h / max(h);
        h = h .^ comp; 
        y2 = x2 .* h;
        y2 = y2 .* max(abs(x2)) / max(abs(y2));

        y = [y1 y2];
    else
        h = filter((1-a)^2, [1.0000 -2*a a^2], abs(x));
        h = h / max(h);
        h = h .^ comp; 
        y = x .* h;
        y = y .* max(abs(x)) / max(abs(y));
    end

    output = y;
end