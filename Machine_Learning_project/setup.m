function [fl,jj,o,b] = setup(flessioni,jumping_jacks,obliqui,burpees)

t = timetable2table(flessioni,'ConvertRowTimes',false);
fl = table2array(t);

t = timetable2table(jumping_jacks,'ConvertRowTimes',false);
jj = table2array(t);
%A = riorganizza_dati(jj);

t = timetable2table(obliqui,'ConvertRowTimes',false);
o = table2array(t);
%eX = riorganizza_dati(o); 

t = timetable2table(burpees,'ConvertRowTimes',false);
b= table2array(t);
%U = riorganizza_dati(b);

end
