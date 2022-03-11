function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out 
  
  file = fopen(nume,'r');
  N = fscanf(file, '%f',1);
  
  for i=1:N
    a = fscanf(file, '%f', 1);
    b = fscanf(file, '%f', 1);
    for j=1:b
      c = fscanf(file, '%f', 1);
    endfor
  endfor
  
  val1 = fscanf(file, '%f', 1);
  val2 = fscanf(file, '%f', 1);
  fclose(file);
  
  Nume = strcat(nume, '.out');
  File = fopen(Nume, 'w');
  fprintf(File, '%i \n', N);
  
  R1 = Iterative(nume, d, eps);
  fprintf(File, '%.6f \n', R1);
  fprintf(File, '\n');
  
  R2 = Algebraic(nume, d);
  fprintf(File, '%.6f \n', R2);
  fprintf(File, '\n');
  
  [PR1, v] = sort(R2, 'descend');
  
  for i=1:N
    y = Apartenenta(PR1(i), val1, val2);
    fprintf(File, '%i %i %.6f\n', i, v(i), y);
  endfor
  
  fclose(File);

  endfunction