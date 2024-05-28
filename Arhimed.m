a = 0;
b = 0.12;

num_frames = 400;
theta_max = 7 * pi;
theta = linspace(0, theta_max, num_frames);


figure;
hold on;
axis equal;
xlim([-5 5]);
ylim([-5 5]);
xlabel('x');
ylabel('y');
title('Анимация разноцветной спирали Архимеда');

for i = 1:num_frames
    r = a + b * theta(i);
    x = r * cos(theta(i));
    y = r * sin(theta(i));

    plot(x, y, 'o', 'Color', colors(i, :), 'MarkerFaceColor', colors(i, :), 'MarkerSize', 5);
    pause(0.001);
end
axis square;
hold off;
