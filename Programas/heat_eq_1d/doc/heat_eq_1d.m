clear all;
  % Inicializo el vector de temperaturas
  M = 16;
  u(1) = 32767;
  u(2:M) = 0;

  % Iteración principal
  N = 150;
  for( k = 1 : N )
	  % Sub Iteración
	  for( i = 2 : M - 1 )
		  %u(i)=( u(i+1) + u(i-1) ) / 2;
		  u(i)=( u(i+1) + u(i-1) );
	  end
  end
  plot(u);