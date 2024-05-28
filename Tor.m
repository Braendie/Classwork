function Tor()
  R = 3;
  r = 1;

  theta = linspace(0, 2*pi, 50);
  phi = linspace(0, 2*pi, 50);
  [Theta, Phi] = meshgrid(theta, phi);

  X = @(Theta, Phi, t) (R + r * cos(Theta + t)) .* cos(Phi);
  Y = @(Theta, Phi, t) (R + r * cos(Theta + t)) .* sin(Phi);
  Z = @(Theta, Phi, t) r * sin(Theta + t);

  figure;
  axis equal;

  for t = linspace(0, 2*pi, 100)
    X_t = X(Theta, Phi, t);
    Y_t = Y(Theta, Phi, t);
    Z_t = Z(Theta, Phi, t);

    C = sin(Theta + t) .* cos(Phi + t);

    surf(X_t, Y_t, Z_t, C, 'EdgeColor', 'none');

    colormap(jet);

    axis([-4 4 -4 4 -2 2]);
    caxis([-1 1]);
    colorbar;

    drawnow;

    pause(0.005);
  end
end

Tor();
