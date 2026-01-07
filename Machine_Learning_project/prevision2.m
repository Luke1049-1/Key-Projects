function [train,test,real_ID] = prevision(features)

%creazione randomica degli indici da utilizzare nel set dati per il train
index80 = randperm(length(features),floor(0.8*length(features)));
train = features(index80,:);      %set di dati utilizzati per il train 

%ciclo for per trovare gli indici non utilizzati nel train
index20 = zeros(length(features),1);

for i = 1:length(features)
    for j = 1:length(index80)
        if i == index80(1,j)
            index20(i,1) = 0;
            break
        else
            index20(i,1) = 1;
        end
    end
end

ii = index20(:,1)>0; 
t = features(ii,:); %set dati utilizzati per la previsione
test = t(:,1:21);   % 21
real_ID = t(:,22);  % 22

end