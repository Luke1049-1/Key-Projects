function tD =riorganizza_dati(td)

%la funzione prende in ingresso i dati dalla tabella e li riorganizza in
%set di campioni di 150 elementi

%prealloco la matrice di zeri
tD = zeros(floor(height(td)/150)+1,150,3);

for i = 0:floor(height(td)/150)
    if i < (floor(height(td)/150))
    for j = 1:150
        tD(i+1,j,1) = td((j+i*150),1);
        tD(i+1,j,2) = td(j+i*150,2);
        tD(i+1,j,3) = td(j+i*150,3);
    end 
    else 
    for j = 1:(height(td)-(floor(height(td)/150))*150)
        tD(i+1,j,1) = td((j+i*150),1);
        tD(i+1,j,2) = td(j+i*150,2);
        tD(i+1,j,3) = td(j+i*150,3);
    end
    end
    
end
