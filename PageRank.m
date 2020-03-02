% Chiciuc, Alisa, 314CC

function [ R_iter R2_algeb ] = PageRank( nume, d, eps )

  file = fopen( nume, 'r' );

  %citeste numarul de elemente
  N = fscanf( file, '%d', 1 );

  %initializeaza matricile
  A = zeros( N, N );

  %Citeste fisierul si creeaza matricea A 
  for i = 1:N
    indice_i = fscanf( file, '%d', 1 );
    n = fscanf( file, '%d', 1 );
    for j = 1:n
	  	indice_j = fscanf( file, '%d', 1 );
     A( indice_i, indice_j ) = 1;
	  endfor
  endfor
  %citeste val1 si val2
  val1 = fscanf( file, '%f', 1);
  val2 = fscanf( file, '%f', 1);

  fclose(file);

  %Deteremina rezultatul prin metoda iterativa
  R_iter = Iterative( nume, d, eps );

  %Determina rezultatul prin metoda algebrica
  R_algeb = Algebraic( nume, d );

  %creeaza fisierul de iesire
  nume_out = strcat( nume, '.out' );

  file = fopen(nume_out, 'w');
  %afiseaza numarul de elemente
  fprintf( file, '%d\n', N );

  %afiseaza rezultatul de la metoda iterativa
  for i = 1:N
    a = R_iter( i, 1 );
    fprintf( file, '%f\n', a );
  endfor


  %afiseaza rezultatul de la metoda algebrica
  fprintf( file, '\n' );
  for i = 1:N
    a = R_algeb( i, 1 );
    fprintf( file, '%f\n', a );
  endfor

  %memoreaza indicii in A
  I = zeros( N, 1 );
  for i=1:N
    I( i, 1 ) = i;
  endfor

  %sorteaza descrescator rezultatul, ordonand si indicii in A
  R_apart = R_algeb;
  for i = 1:N
  	for j = 1:N
  		if ( R_apart( i ) > R_apart( j ) )
			  aux = R_apart( i );
			  R_apart( i ) = R_apart( j );
			  R_apart( j ) = aux;
        aux1 = I( i, 1 );
        I( i, 1 ) = I( j, 1 );
        I( j, 1 ) = aux1;
		  endif
	  endfor
  endfor

  %afiseaza rezultatul apartenentei
  fprintf( file, '\n' );
  for i=1:N
    fprintf( file, '%d ', i );
    fprintf( file, '%d ', I( i, 1 ) );
    y = Apartenenta( R_apart( i ), val1, val2 );
    fprintf( file, '%f\n', y );
  endfor
  
  fclose(file);

endfunction