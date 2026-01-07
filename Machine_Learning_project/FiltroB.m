function Filtro(acceleration_w,fs, A, B, C, D)

%asse dei tempi
t = (1/fs)*(0:length(acceleration_w)-1);
%filtro il segnale secondo i coefficienti trovati e lo plotto
acc_high = filter(B,A,acceleration_w);
acc_filt = filter(D,C,acc_high);
figure;
plot(t,acceleration_w,'c')
hold on
plot(t,acc_filt,'b')
title('Confronto segnali')
xlabel('tempo (s)');
ylabel('Acceleration [m\cdot s^{-2}]')
legend('Segnale originario','Segnale filtrato finale')
hold off

end