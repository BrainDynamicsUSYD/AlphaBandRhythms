% Function to estimate the surface area of a closed patch of cortex, this is done by
% calcuating the areas of each triangle then summing.

function surf_integral = calc_surf_integral(surface,data)

vert = surface.vertices;
faces = surface.faces;

if(min(faces(:)) < 0)
    faces = faces + 2;
elseif(min(faces(:)) < 1)
    faces = faces + 1;
end

value_on_faces = [data(faces(:, 1)) + data(faces(:, 2)) + data(faces(:, 3))]/3;


a = vert(faces(:, 2), :) - vert(faces(:, 1), :);
b = vert(faces(:, 3), :) - vert(faces(:, 1), :);
c = cross(a, b, 2);
areaTri = 1/2 *(sqrt(sum(c.^2, 2)));

surf_integral = sum(areaTri.*value_on_faces);

end