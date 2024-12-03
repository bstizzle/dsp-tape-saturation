function output = Hsys(x, sat, drive, width, alpha, k, fs)

    Ms = 0.5 + 1.5*(1-sat);
    a = Ms / (0.01 + 6*drive);
    c = (1-width)^0.5 - 0.01;
    
    x1_L = 0;
    xD1_L = 0;
    Mn1_L = 0;
    Hn1_L = 0;
    Hdn1_L = 0;

    x1_R = 0;
    xD1_R = 0;
    Mn1_R = 0;
    Hn1_R = 0;
    Hdn1_R = 0;

    y = zeros(size(x));
    
    [~, xC] = size(x);
    % check if signal is mono or stereo
    if(xC==2)
        for n=2:length(x)
            H_L = x(n, 1);
    
            diffArray = Diff(H_L, x1_L, xD1_L, alpha, fs);
            x1_L = diffArray(1);
            xD1_L = diffArray(2);
            Hd_L = diffArray(2);
    
            M = RK4(fs, @JA, H_L, Hn1_L, Hd_L, Hdn1_L, Mn1_L, Ms, a, alpha, k, c);
        
            Mn1_L = M;
            Hn1_L = H_L;
            Hdn1_L = Hd_L;
        
            y(n, 1) = M;
    
            H_R = x(n, 2);
    
            diffArray = Diff(H_R, x1_R, xD1_R, alpha, fs);
            x1_R = diffArray(1);
            xD1_R = diffArray(2);
            Hd_R = diffArray(2);
    
            M = RK4(fs, @JA, H_R, Hn1_R, Hd_R, Hdn1_R, Mn1_R, Ms, a, alpha, k, c);
        
            Mn1_R = M;
            Hn1_R = H_R;
            Hdn1_R = Hd_R;
        
            y(n, 2) = M;
        end
    else
        for n=2:length(x)
            H_L = x(n, 1);
    
            diffArray = Diff(H_L, x1_L, xD1_L, alpha, fs);
            x1_L = diffArray(1);
            xD1_L = diffArray(2);
            Hd_L = diffArray(2);
    
            M = RK4(fs, @JA, H_L, Hn1_L, Hd_L, Hdn1_L, Mn1_L, Ms, a, alpha, k, c);
        
            Mn1_L = M;
            Hn1_L = H_L;
            Hdn1_L = Hd_L;
        
            y(n, 1) = M;
        end
    end

    output = y;
end