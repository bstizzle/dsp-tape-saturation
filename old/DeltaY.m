function output = DeltaY(y, x, n, a)
    % deltaX and L(Q)-y have the same sign, deltaY = 1
    if sign(DeltaX(x, n)) == sign(Langevin(Q(x,y,n,a)) - y(n))
        output = 1;
    % else deltaY = 0
    else
        output = 0;
    end
end