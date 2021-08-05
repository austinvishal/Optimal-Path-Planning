%% Clear
close all
clear all
clc
%% Initialize random seed
randomseed = input('Enter a random seed:\n');

rand('state',randomseed);
%% Set axis
axis([0,10,0,10])
axis square;
hold on
%% Initialize start , goal , obstacles and grid 
start=[2,9];
goal=[9.5,6];
 
%Create a window 
 figure(1)
    rectangle('Position',[4.5 0 1 4])
    rectangle('Position',[4.5 6 1 4])

    hold on

%Obstacles parameter
  %low obstacle
%   obstac=[3.2 2 1;2 7 1;6.8 3 1;6.8 7 1;3.5 5 0.6;6.5 5 0.6];
%High obstacle
  obstac=[3.2 2 1;2 7 1;6.8 3 1;6.8 7 1;3.5 5 0.6;6.5 5 0.6;7 1 0.7;9 4 1;9 7 1;3 8 1;2 5 1;8 9 1;1 2 1];
    
 %Cirlces centers Xc,Yc,radius  
   for l=1:size(obstac,1)
    circle([obstac(l,1),obstac(l,2)],obstac(l,3),1000,'-'); % arguments Xc, Yc and radius from obstac vector for drawing circle
   end
    
  %%  Create random sample points 
    x0=[];
    
    for n=1:8
        xnew=rand(1)*10;
        ynew=rand(1)*10;
    
        x0=[x0 [xnew;ynew]];
    end
  % Set lower and upper bound for sample points  
LB=[0 0 0 4.5 5.5 5.8 5.8 5.8;
    0 0 0 4.2 4.2 0 0 0 ];
UB=[4.2 4.2 4.2 4.5 5.5 10 10 10;
    10 10 10 5.8 5.8 10 10 10 ];

   % Plot the inital configuration
plot(goal(1),goal(2),'r*') ;
plot(start(1),start(2),'g*') ;
plot(x0(1,:),x0(2,:),'y*') ;
hold on;

trajectory=[start'  x0 goal'];
%  plot(trajectory(1,:),trajectory(2,:),'k')

%% Optimization function

%Objective function
f=objective(x0,start,goal,obstac)
% 
%Constraints function
[G Geq]=constraints(x0,start,goal,obstac)
% 
options = optimset('Display','iter','MaxFunEvals',2000,'MaxIter',1000,'TolFun',...
                    1e-06,'TolX',1e-08);
                
x=fmincon('objective',x0,[],[],[],[],LB,UB,'constraints',options,start,goal,obstac);

%% Plot optimized points and trajectory

 plot(x(1,:),x(2,:),'k*') ;
 trajectory1=[start'  x goal'];
 plot(trajectory1(1,:),trajectory1(2,:),'k')
 xlabel('X axis')
 ylabel('Y axis')
 title('Robot Trajectory')

 
 



