function [B, A] = Filtro_low(acceleration_w, fs,order,tau)

%creo un filtro secondo le caratteristiche fornite in ingresso
[B, A] = butter(order, tau, 'low');

%asse dei tempi
t = (1/fs)*(0:length(acceleration_w)-1);
%filtro il segnale secondo i coefficienti trovati e lo plotto
acc_filt = filter(B,A,acceleration_w);
figure;
plot(t,acceleration_w,'c')
hold on
plot(t,acc_filt,'b')
title('Confronto segnali')
xlabel('tempo (s)');
ylabel('Acceleration [m\cdot s^{-2}]')
legend('Segnale originario','Segnale filtrato - passa basso')
hold off

end