function [G Geq]=constraints(x0,start,goal,obstac)

dist=+inf;
index=0;
Geq=[];
p=1;

tra = [start' x0 goal'];

Geq = [];
f=1;
    % To ensure the line segments are outside circle
    for k = 1:size(obstac,1)
        for i = 1 : length(tra)-1
            d = sqrt((tra(1,i+1)-tra(1,i))^2 + (tra(2,i+1)-tra(2,i))^2);
            theta = atan2(tra(2,i+1)-tra(2,i),(tra(1,i+1)-tra(1,i))); 
            j=1;
                for lambda = 0:0.1:1
                    IX(1,j) = tra(1,i) + lambda*d*cos(theta);
                    IX(2,j) = tra(2,i) + lambda*d*sin(theta);
                    d1(j) = sqrt((IX(1,j)-obstac(k,1))^2 + (IX(2,j)-obstac(k,2))^2);
%                     plot(IX(1,j),IX(2,j));
                    j=j+1;
                end
                p = min(d1);
            G(f) = -p+obstac(k,3);
%             G(i,k) = obstac(k,3) - p;
            f=f+1;
        end
        
    end

end 
