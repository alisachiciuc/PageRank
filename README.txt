PageRank:
	-Deschide fisierul pentru citire
	-Citeste fisierul si creeaza matricea
	-Citeste valorile
	-Apeleaza functia Iterative
	-Apeleaza functia Algebraic
	-Afiseaza rezultatele pentru ambele metode
	-Creeaza matricea I in care adauga indicii
	-Sorteaza rezultatele, schimband si indicii in I
	-Afiseaza rezultatele apartenentei.

Iterative:
	-Deschide fisierul pentru citire
	-Citeste fisierul si creeaza matricea
	-Creeaza vectorul L si matricea M
	-Executa algoritmul de determinare a rezultatului
	 pana cand diferenta dintre rezultate devine mai 
	 mica decat eps
	
Algebraic:
	-Deschide fisierul pentru citire
	-Citeste fisierul si creeaza matricea
	-Creeaza vectorul L si matricea M
	-Determina inversa prin metoda Gram-Schmidt
	-Determina rezultatul

GramSchmidt:
	-initializeaza r si q cu zerouri
	-determina r si q in baza algoritmului
	-creeaza inversa

Apartenenta:
	-[a b] : ( a*val1 + b = 0 ) && ( a*val2 + b = 1)
		(b = - a*val1 ) && ( b = 1 - a * val2 )
		a*val2 - a*val1 = 1 
		a*(val2 - val1) = 1
		a = 1/(val2-val1)
		b = -a*val1 = 1/(val2 - val1) * val1 = val1 / (val2 - val1);
	-determina rezultatul in dependenta de caz