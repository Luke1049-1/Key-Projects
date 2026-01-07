function [ff,s_FFT] = Plot_FFT(acc, fs)

     % numero di campioni
     N = length(acc);
     
     s_FFT = fft(acc)/length(acc);  
     %frequenza di Nyquist = sampling frequency / 2
     fN = fs/2;  
     Tc = 1/fs;
     ff = 0:1/(Tc*N*fN):1;    %asse delle frequenze
     %ff = (0:N-1)*fN/N;
     
     plot(ff,abs(s_FFT(1:floor(N/2)+1)));
     grid on
     title('Fourier transform');
     ylabel('|FFT|');    xlabel('frequenza normalizzata');
end