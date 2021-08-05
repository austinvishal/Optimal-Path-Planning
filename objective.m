function f=objective(x0,start,goal,obstac)

%  Function calculates the total path length / distance between trajectory
%  points.
f=0; 
tra=[start' x0 goal'];

for i=1:size(tra,2)-1
    f=f+sqrt((tra(1,i+1)-tra(1,i))^2 + (tra(2,i+1)-tra(2,i))^2);   %computes euclidean distance between xinit,yinit and xnext,ynext till goal.
end
end