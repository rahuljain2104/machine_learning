p = zeros(20,20);
j =1 ;
for i = 1:20
  p(i,:) = X(4520,j:j+19);
  j=j+20 ; 
end

imshow(p) 