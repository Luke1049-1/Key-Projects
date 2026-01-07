function features = ExtractSignalFeatures2(stat_c, fs, A, B, C, D);
%prealloco gli indici ed i vettori
index = 0;
for activity_ID = 1:4
    for i = 1:length(stat_c{activity_ID}(:,1,1))
            index = index + 1;
            features = zeros(index,22);
    end
end

%loop per ricavare le features
for component = 1:3
    value = (component-1)*7;
    index = 0;
    for activity_ID = 1:4
        for i = 1:length(stat_c{activity_ID}(:,1,1))
            %indice per le righe
            index = index + 1;
            features(index,22) = activity_ID;    %il 13-esimo campo indica l'attività svolta
            
           
            %media
            features(index,1 + value) = mean(stat_c{activity_ID}(i,:,component));
            %si filtra il segnale secondo i coefficienti A e B
            stat_high = filter(B,A,stat_c{activity_ID}(i,:,component));
            stat_filtered = filter(D,C,stat_high);
            %deviazione standard sul segnale filtrato
            features(index,2 + value) = std(stat_filtered);
            
            %si calcola la trasformata di Fourier di ciascun set di dati
            s_FFT = fft(stat_c{activity_ID}(i,:,component))/length(stat_c{activity_ID}(i,:,component)); 
            N = length(stat_c{activity_ID}(i,:,component));
            Tc = 1/fs;
            %frequenza di Nyquist
            fN = fs/2;
            ff = 0:1/(Tc*N):fN;    %asse delle frequenze
            s_FFT = s_FFT(1:floor(N/2)+1); %frequenze positive di fourier;
            
            % tramite findpeaks si ricava il valore e la posizione del
            % picco di ciascun set di dati
            [peak,position] = findpeaks(abs(s_FFT).^2,'NPeaks',1,'SortStr','descend');
            % si assegnano il picco e la posizione a ciascuna colonna di
            % riferimento
            features(index,3 + value) = peak;
            features(index,4 + value) = ff(position);
            
            %media dei 6 picchi principali e delle loro posizione
            [peak,position2] = findpeaks(abs(s_FFT).^2,'NPeaks',6,'SortStr','descend');
            features(index,5 + value) =mean(peak);
            features(index,6 + value) = mean(ff(position2));
            
            %differenza media fra i primi 4 picchi 
            pk = findpeaks(abs(s_FFT).^2,'NPeaks',4,'SortStr','descend');
            features(index,7 + value) = mean(diff(transpose(pk)));
           
        end 
    end
end
end
