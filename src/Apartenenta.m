% Chiciuc, Alisa, 314CC

function y = Apartenenta( x, val1, val2 )

  a = 1/( val2 - val1 );
  b = - val1/( val2 - val1 );
  
  %Determina rezultatul functiei
  if ( x >= 0 && x < val1 )
  	y = 0;
  endif
  
  if ( x >= val1 && x <= val2 )
  	y = a*x + b;
  endif
  
  if ( x > val2 && x < 1 )
  	y = 1;
  endif
  
endfunction