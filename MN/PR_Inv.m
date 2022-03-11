function B = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
	% Se va inlocui aceasta linie cu descrierea algoritmului de inversare 
  
    N = size(A);
 
  Q = zeros(N);  % realizez matricile Q si R  si initializez fiecare element din ele cu 0
  R = zeros(N); 
  
   for i=1:N
     R(i, i) = norm(A(:, i));
     Q(:, i) = A(:, i) / R(i, i);
     R(i, i+1 : N) =Q(:, i)' * A(:, i+1 : N);
     A(:, i+1 : N) = A(:, i+1 : N) - Q(:, i) * R(i, i+1 : N);
  endfor
  
   M = zeros(N);
   I = eye(N);
   
   
  for i=1:N
    
    x = SST(R, Q' *I(:,i));
    B(:, i) = x;
  endfor
  
endfunction