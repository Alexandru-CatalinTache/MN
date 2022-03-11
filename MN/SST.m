function x = SST(A, b) % functie pentru rezolvarea unui sistem superior-triunghiular
  [n n] = size(A);
  x(n) = b(n)/A(n, n);
  
  for i=(n-1):-1:1
    sum=0;
    for j = (i + 1) : n
      s=A(i, j) * x(j);
      sum =sum+ s;
    endfor
    dif= b(i)-sum;
    x(i) = dif / A(i, i);
  endfor
endfunction