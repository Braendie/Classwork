n = 100
w = 1

function Mobius(n, w)

    t = linspace(0, 2*pi, n);

    x = (1 + (w/2) * cos(t/2)) .* cos(t);
    y = (1 + (w/2) * cos(t/2)) .* sin(t);
    z = (w/2) * sin(t/2);

    figure;
    plot3(x, y, z, 'b', 'LineWidth', 2);
    hold on;

    [T, W] = meshgrid(linspace(0, 2*pi, n), linspace(-w/2, w/2, n));
    X = (1 + W .* cos(T/2)) .* cos(T);
    Y = (1 + W .* cos(T/2)) .* sin(T);
    Z = W .* sin(T/2);

    surf(X, Y, Z, 'FaceAlpha', 0.5, 'EdgeColor', 'none');

    colormap(jet);
    shading interp;
    axis equal;
    grid on;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title('Лента Мебиуса');
end

Mobius(n, w);
