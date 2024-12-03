function output = symmclip(x, thresh)
    % y=symclip(x)
    % "Overdrive" simulation with symmetrical clipping
    % x - input
    % thresh - threshold for symmetrical soft clipping

    N = length(x);
    y = zeros(size(N));
    [~, xC] = size(x);

    % check if signal is mono or stereo
    if(xC==2)
        for n=1:1:N
        % by Schetzen Formula
            if abs(x(n,1))<thresh
                y(n,1)=2*x(n,1);
            end
            if abs(x(n,2))<thresh
                y(n,2)=2*x(n,2);
            end
        
            if abs(x(n,1))>=thresh
                if x(n,1)>0 
                    y(n,1)=(3-(2-x(n,1)*3).^2)/3;
                end
                if x(n,1)<0
                    y(n,1)=-(3-(2-abs(x(n,1))*3).^2)/3;
                end
            end
            if abs(x(n,2))>=thresh
                if x(n,2)>0 
                    y(n,2)=(3-(2-x(n,2)*3).^2)/3;
                end
                if x(n,2)<0
                    y(n,2)=-(3-(2-abs(x(n,2))*3).^2)/3;
                end
            end
            
            if abs(x(n,1))>2*thresh
                if x(n,1)>0
                    y(n,1)=1;
                end
                if x(n,1)< 0
                    y(n,1)=-1;
                end
            end
            if abs(x(n,2))>2*thresh
                if x(n,2)>0
                    y(n,2)=1;
                end
                if x(n,2)< 0
                    y(n,2)=-1;
                end
            end
        end
    else
        for n=1:1:N
        % by Schetzen Formula
            if abs(x(n))<thresh
                y(n)=2*x(n);
            end
        
            if abs(x(n))>=thresh
                if x(n)>0 
                    y(n)=(3-(2-x(n)*3).^2)/3;
                end
                if x(n)<0
                    y(n)=-(3-(2-abs(x(n))*3).^2)/3;
                end
            end
        
            if abs(x(n))>2*thresh
                if x(n)>0
                    y(n)=1;
                end
                if x(n)< 0
                    y(n)=-1;
                end
            end
        end
    end

    output = y;
end