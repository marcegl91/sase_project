clear all;

x = 0:10:150;
y = -(100/150) .*  x .+ 100.;
points = load('result_dec.dat');

scatter(x,y);
hold on;
plot(x,y);
xlabel("distancia  \\  cm");
ylabel("u  \\  °C");
axis([0 150 0 100])
print "u.png";

hold off;

figure;
scatter(x,points);
hold on;
plot(x,points);
xlabel("distancia  \\  cm");
ylabel("u'  \\  °C");
axis([0 150 0 32767])
print "u_prima.png";