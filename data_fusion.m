
% https://www.desmos.com/calculator/zl1srg8kxh
% [xr, yr]  - coordinate of radar node
% ar        - compass value of radar node
% r0        - object's distance from radar node
% a0        - radar's measured angle of object
% [xo, yo]  - coordinate of object
function [xo, yo] = get_global_object_location(xr, yr, ar, ro, ao)
    xo = ro * cos(ao+ar) + xr;
    yo = ro * sin(ao+ar) + yr;
end


% https://www.desmos.com/calculator/ktnci4garn
% aorX          - angle between object and radar X
% dorX          - doppler of object measured by radar X
% [vxo, vyo]    - velocity of object
function [vxo, vyo] = get_object_velocity(aor1, dor1, aor2, dor2)

    % polar to cartesian (ensure y is never 0)
    dxor1 = dor1 * cos(aor1);
    dyor1 = dor1 * max(sin(aor1),realmin('single'));
    dxor2 = dor2 * cos(aor2);
    dyor2 = dor2 * max(sin(aor2),realmin('single'));

    % create 2 lines perpendicular to aor1 and aor2
    m1 = -dxor1 / dyor1;
    b1 = dyor1 + dxor1*dxor1/dyor1;
    m2 = -dxor2 / dyor2;
    b2 = dyor2 + dxor2*dxor2/dyor2;

    % solve for intercept using cramer's rule
    vxo = (b1-b2) / (m2-m1);
    vyo = (b1*m2 - b2*m1) / (m2-m1);

end
