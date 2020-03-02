% Chiciuc, Alisa, 314CC

function Inverse = GramSchmidt( A )
  [ M N ] = size( A );

  %initializeaza matricile
  q = zeros( M, N );
  r = zeros( N, N );

  %determina q si r 
  for i = 1:N
	  r( i, i ) = norm( A( :, i ) );
	  q( :, i ) = A(:,i)/r( i, i );
    r( i, i+1:N ) = q( :, i )' * A( :, i+1:N );
	  A( :, i+1:N ) = A( :, i+1:N ) - q( :, i )*r( i, i+1:N );
  end

  %determina inversa
  I = eye(N, N);
  for i = 1:N
	 	M = I(:, i);
		aux = SST(r, q' * M);
		Inverse(:, i) = aux;
	endfor

endfunction