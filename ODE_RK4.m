function[y]=ODE_RK4(h,step_size,ini_val,f)

order = numel(f);
k = zeros(order + 1);

for j=1:step_size

for i=1:3
k(:,i) =[h ; h*fevalcell(f,ini_val(:,i,j)) ];

 if i == 3
     break
 end

ini_val(:,i+1,j+1)=ini_val(:,i,j) + k(:,i)/2 ;
end
ini_val(:,i+1,j+1)=ini_val(:,i,j) + k(:,i) ;

i=4;

k(:,i) = h*[h ; h*fevalcell(f,ini_val(:,i,j))];
ini_val(:,1,j+1)=ini_val(:,1,j) + (1/6)*(k(:,i)+ 2*k(:,i)+ 2*k(:,i) +k(:,i));

end

y(:,:) = ini_val(:,1,:);

end