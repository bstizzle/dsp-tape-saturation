function output = Hsys(x, sat, drive, width, alpha, k, fs)

    Ms = 0.5 + 1.5*(1-sat);
    a = Ms / (0.01 + 6*drive);
    c = (1-width)^0.5 - 0.01;
    
    x1 = 0;
    xD1 = 0;
    Mn1 = 0;
    Hn1 = 0;
    Hdn1 = 0;

    y = zeros(size(x));

    for n=2:length(x)
        H = x(n);

        diffArray = Diff(H, x1, xD1, alpha, fs);
        x1 = diffArray(1);
        xD1 = diffArray(2);
        Hd = diffArray(2);

        M = RK4(fs, @JA, H, Hn1, Hd, Hdn1, Mn1, Ms, a, alpha, k, c);
    
        Mn1 = M;
        Hn1 = H;
        Hdn1 = Hd;
    
        y(n) = M;
    end

    output = y;
end