function [flessioni,jumping_jacks,obliqui,burpees] = unione()

a1 = load('flessioni.mat');
a2 = load('flessioni2.mat');
a3 = load('flessioni3.mat');


flessioni = [a1.Acceleration;a2.Acceleration;a3.Acceleration];

u1 = load('jumping_jacks.mat');
u2 = load('jumping_jacks2.mat');


jumping_jacks= [u1.Acceleration;u2.Acceleration];

ts1 = load('obliqui.mat');


obliqui = [ts1.Acceleration];

eu1 = load('burpees.mat');

burpees = [eu1.Acceleration];

end