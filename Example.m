clc
clear
close all

h  =0.1;
step_num = 5 ;

         % x   y   y'  y" ...
ini_val = [0 ; 1 ; 1 ; 1];

f{1,1} = @(x,y,y1,y2) y1 ;
f{2,1} = @(x,y,y1,y2) y2 ;
f{3,1} = @(x,y,y1,y2) 2*y2 + 3*y1*y^2 + 3*x*y ;


[y]=ODE_RK4(h,step_num,ini_val,f);
