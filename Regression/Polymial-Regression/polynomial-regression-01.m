clear all; close all; clc;
dt = load('hwa.dat');
x1 = dt(:,1); % Altura em cm
x2 = dt(:,3); % Idade
x = [x1 x2];
y = dt(:,2); % Peso em Kg

m = length(y);
x = x./m;
y = y./m;
X = [ones(m,1) x];

alpha = 0.07;
epochs = 30000;
theta = zeros(3,1);

for epoch=1:epochs
  theta = theta - ((1/m)*( ((X.^2)*theta) -y)'*X)'*alpha; % Gradient Descent
  %if mod(epoch,10) == 0
    %disp(theta);
    %disp('_______________________');
    %endif
endfor

disp(char("Theta0: ", disp(theta(1)) ));
disp(char("Theta1: ", disp(theta(2)) ));
disp(char("Theta2: ", disp(theta(3)) ));
disp("h(x) = Theta0 + Theta1*x1^2 + Theta2*x2^2");

plot(x2,y.*m,'.');
hold on;
plot(x2, ((X.^2)*theta).*m, 'o');
xlabel('Idade');
ylabel('Peso (Kg)');
legend('Dados reais', 'Estimativa');
hold off;

figure;
hold on;
plot(x1,y.*m,'.');
plot(x1, ((X.^2)*theta).*m, 'o');
xlabel('Altura (cm)');
ylabel('Peso (Kg)');
legend('Dados reais', 'Estimativa');
hold off;

%figure;
%plot3(((X.^2)*theta).*m, x2, x1, 'x');