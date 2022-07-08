function[y]=ODE_RK4(h,step_num,ini_val,f)

order = numel(f);
k = zeros(order + 1);

for j=1:step_num

for i=1:3
k(:,i) =[1 ; fevalcell(f,ini_val(:,i,j)) ];

 if i == 3
     break
 end

ini_val(:,i+1,j)=ini_val(:,1,j) + h*k(:,i)/2 ;
end
ini_val(:,i+1,j)=ini_val(:,1,j) + h*k(:,i) ;

i=4;

k(:,i) = [1 ; fevalcell(f,ini_val(:,i,j))];

ini_val(:,1,j+1)=ini_val(:,1,j) + (1/6)*h*(k(:,1)+ 2*k(:,2)+ 2*k(:,3) +k(:,4));
ini_val(1,1,j+1)=ini_val(1,1,j) + h;
end

y(:,:) = ini_val(:,1,:);

end