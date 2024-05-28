function Newton_f(polynomial, max_iter, tol, n, xlim, ylim)

    x = linspace(xlim(1), xlim(2), n);
    y = linspace(ylim(1), ylim(2), n);
    [X, Y] = meshgrid(x, y);
    Z = X + 1i * Y;

    f = @(z) polyval(polynomial, z);
    df = @(z) polyval(polyder(polynomial), z);

    for k = 1:max_iter
        Z = Z - f(Z) ./ df(Z);
    end

    roots_polynomial = roots(polynomial);

    result = zeros(size(Z));

    for k = 1:length(roots_polynomial)
        result(abs(Z - roots_polynomial(k)) < tol) = k;
    end

    imagesc(x, y, result);
    axis xy;
    title(['Бассейн Ньютона для полинома: ', poly2str(polynomial, 'z')]);
    xlabel('Re(z)');
    ylabel('Im(z)');
    colormap(jet(length(roots_polynomial)));
    colorbar;
end

polynomial = [1, 0, 0, -1]; % Полином z^3 - 1
max_iter = 50;           % Максимальное количество итераций
tol = 1e-6;              % Пороговое значение для близости к корню
n = 500;                 % Количество точек в сетке
xlim = [-2, 2];          % Диапазон по оси x
ylim = [-2, 2];          % Диапазон по оси y

Newton_f(polynomial, max_iter, tol, n, xlim, ylim);
