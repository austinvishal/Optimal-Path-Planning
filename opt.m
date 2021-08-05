function [optimdist,xpoint]=opt(start,goal,x0)

optimdist=0; 
xpoint=[];

tra=[start' x0 goal'];



for i=1:size(tra,2)-1
       
    % pause;
    dist=norm(tra(:,i)-tra(:,i+1));
    dx=dist/10;
    theta=atan2((tra(2,i+1)-tra(2,i)),(tra(1,i+1)-tra(1,i)));
    xnew=tra(1,i);
    ynew=tra(2,i);
    
    for j=0:dx:dist-dx
    
        xnew=xnew+dx*cos(theta);
        ynew=ynew+dx*sin(theta);
        xpoint=[xpoint [xnew;ynew]];
        
    end    
    
end


end