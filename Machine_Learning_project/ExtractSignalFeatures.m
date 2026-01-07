function features = ExtractSignalFeatures(stat_c, fs, a, b)
  l1 = length(stat_c{1}(:,1,1));
  l2 = length(stat_c{2}(:,1,1));
  l3 = length(stat_c{3}(:,1,1));
  l4 = length(stat_c{4}(:,1,1));
  l5 = length(stat_c{5}(:,1,1));
  l6 = length(stat_c{6}(:,1,1));
  lt = l1 + l2 + l3 + l4 + l5 + l6;
  
  features = zeros(lt,13);
  g = 1;
  
  for i = 1 : 6 % indicaotre attività
      for j = 1 : length(stat_c{i}(:,1,1)) % indicatore sample number
          for k = 1 : 3 % indicatore componente
              sampleStat = stat_c{i}(j,:,k); % indivuduo il campione statistico
              Af = mean(sampleStat);                    % --> media
              Bf = std(sampleStat);                     % --> dev. standard
              sampleStat_fil = filter(b,a,sampleStat);  
              sampleStat_FFT = fft(sampleStat_fil);     % trasformata del segnale campionato
              L = length(sampleStat_fil);               
              fn = fs/2;                                % freq di Nyquist
              P2 = abs(sampleStat_FFT/L);               
              P1 = P2(1:L/2+1);                         
              P1(2:end-1) = 2*P1(2:end-1);              
              f =( fs*(0:(L/2))/L)/ fn;                 
              [Mf,Indice] = max(P1);                    % --> valore del max, posizione del max
              Indice_max = f(Indice);                   
              
              if k == 1
                   features(g,1) = Af;
                   features(g,2) = Bf;
                   features(g,3) = Mf;
                   features(g,4) = Indice_max;
              elseif k == 2
                   features(g,5) = Af;
                   features(g,6) = Bf;
                   features(g,7) = Mf;
                   features(g,8) = Indice_max; 
              elseif k == 3
                   features(g,9) = Af;
                   features(g,10) = Bf;
                   features(g,11) = Mf;
                   features(g,12) = Indice_max;   
              end
              
          features(g,13) = i;
          end
          g = g+1;     
      end
  end   
end

