% Function to estimate the surface area of a closed patch of cortex, this is done by
% calcuating the areas of each triangle then summing.

function area = calc_surf_area(surface)

vert = surface.vertices;
faces = surface.faces;

a = vert(faces(:, 2), :) - vert(faces(:, 1), :);
b = vert(faces(:, 3), :) - vert(faces(:, 1), :);
c = cross(a, b, 2);
area = 1/2 * sum(sqrt(sum(c.^2, 2)));

end
