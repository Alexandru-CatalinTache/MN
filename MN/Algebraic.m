function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
	
  file = fopen(nume,'r');
   N = fscanf(file, '%f', 1);
   
   for i=1:N                   
     for j=1:N
       A(i,j)=0;
     endfor
   endfor  
   
   for i=1:N           
     v(i)=1;
   endfor
   
   v=v';  

for i=1:N                 % creez lista de adiacenta
    linie=fscanf(file, '%f', 1);
    nr=fscanf(file, '%f', 1);
    for j=1:nr
      coloana=fscanf(file, '%f', 1);
      if(linie != coloana)
        A(linie, coloana) = 1;
      endif
      if(linie == coloana)
        A(linie, coloana)=0;
        endif
    endfor
  endfor
  
  fclose(file);  
 
for i=1:N              %calculez nr de likuri al fiecarei pagini
    linkuri(i)=0;
    for j =1:N
      linkuri(i)=linkuri(i)+A(i, j);
    endfor
  endfor
  
  for i=1:N                     % initializez matricea K cu zerouri
     for j=1:N
       K(i,j)=0;
     endfor
   endfor  
   
  for i=1:N                % elementul matricei inv de pe pozitia i,i este inversul elementului de pe diagonala principala
    inve(i, i)=1/linkuri(i);
  endfor
  
  M=(inve*A);
  M=M';                        %transpun matricea M 
  
  I=eye(N);   % matricea identitate
  B=I - d * M;
  
  inversa=PR_Inv(B); % calculez inversa cu ajutorul functiei Gram-Schmidt
  R=inversa*(1-d)/N*v; 
  
endfunction