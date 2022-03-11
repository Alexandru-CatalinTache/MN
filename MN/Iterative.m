function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina. 
  
  file=fopen(nume,'r');
   N=fscanf(file, '%f', 1); %citesc nr de valori
   
   for i=1:N                     % initializez matricea A cu zerouri
     for j=1:N
       A(i,j)=0;
     endfor
   endfor  
   
   for i=1:N           
     v(i)=1;
   endfor
   
   v=v';         % transform vectorul linie in vector coloana 
   
   for i=1:N                % creez lista de adiacenta
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
    inv(i, i)=1/linkuri(i);
  endfor
  
  M=(inv*A);
  M=M';                        %transpun matricea M
  
  for i=1:N
    R0(i,1)=1/N;
  endfor
  
   R=d*M*R0+((1-d)/N)*v;
   
   while(norm(R - R0) >= eps)
    R0=R;
    R=d*M*R0+((1-d)/N)*v;
  endwhile
  
  R=R0; % la iesirea din while rezultatul corect este cel al valorii lui  R0
  
  endfunction