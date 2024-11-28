function y = symmclip(x)
    % y=symclip(x)
    % "Overdrive" simulation with symmetrical clipping
    % x - input
    N = length(x);
    th = 1/3; % threshold for symmetrical soft clipping
    y = zeros(size(N));
    for n=1:1:N
    % by Schetzen Formula
        if abs(x(n))<th
            y(n)=2*x(n);
        end
    
        if abs(x(n))>=th
            if x(n)>0 
                y(n)=(3-(2-x(n)*3).^2)/3;
            end
            if x(n)<0
                y(n)=-(3-(2-abs(x(n))*3).^2)/3;
            end
        end
    
        if abs(x(n))>2*th
            if x(n)>0
                y(n)=1;
            end
            if x(n)< 0
                y(n)=-1;
            end
        end
    end
end

fs = 44100;
t = 0:fs;
x = sin(2 * pi * t * 10 / fs)';

subplot(2,1,1);
plot(x)
subplot(2,1,2);
plot(symmclip(x))