% Chiciuc, Alisa, 314CC

function R = Iterative ( nume, d , eps )
  
  file = fopen( nume, 'r' );

  %citeste numarul de elemente
  N = fscanf( file, '%d', 1 );

  %initializeaza matricile
  A = zeros( N, N );
  L = zeros( N, 1 );
  R = ones( N, 1 );

  %Citeste fisierul si creeaza matricea A 
  for i = 1:N
    indice_i = fscanf( file,'%d', 1 );
    n = fscanf( file,'%d',1 );
    for j = 1:n
	    indice_j = fscanf( file,'%d', 1 );
      A( indice_i, indice_j ) = 1;
	  endfor
  endfor

  %calculeaza valorile L
  for i = 1:N
    suma = 0;
    for j = 1:N
      if( A( i, j ) == 1 )
        suma = suma + 1;
      endif
    endfor
    L( i, 1 ) = suma;
  endfor

  %decrementeaza L pentru paginile care linkeaza la ele insusi
  for i = 1:N
	  if ( A( i, i ) == 1 )
		  A( i, i ) = 0;
		  L( i ) = L( i )-1;
	  endif
  endfor

  %Creeaza matricea M
  for i = 1:N
    for j = 1:N
      if( A( i, j ) == 1 )
        M( j, i ) = 1/L( i, 1 );
      endif
    endfor
  endfor

  %determina vectorul R
  new_R = R*1/N;
  one = ones( N, 1 );
  while 1
    R = new_R;
	  new_R = d*M*R + ( 1 - d )/N*one;
	  if ( abs( new_R - R ) < eps )
		  break;
	  endif
  endwhile

  fclose( file );
endfunction