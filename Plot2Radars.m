
% Generate figures
figure(1);
hold on;
title('Radar 1 POV');
scatter(0,0,'DisplayName','R1 Location');
quiver(0,0,0,1,'DisplayName','R1 View');
[observations_x, observations_y] = r1.getObservationPositions();
scatter(observations_x,observations_y,'DisplayName','R1 Observations');
[neighbor_x,neighbor_y] = pol2cart(r1.neighbors(1).position_angle,r1.neighbors(1).position_distance);
scatter(neighbor_x,neighbor_y,'DisplayName','Neighbor Location');
[view_x,view_y] = pol2cart(r1.neighbors(1).view_angle,1);
disp(neighbor_x);
disp(neighbor_y);
disp(view_x);
disp(view_y);
quiver(neighbor_x,neighbor_y,view_x,view_y,'DisplayName','Neighbor View');
[observations_x, observations_y] = r1.getNeighborObservationPositions();
scatter(observations_x,observations_y,'DisplayName','Neighbor Observations');
legend();
xlabel('x');
ylabel('y');
xlim([-20 20]);
ylim([-20 20]);
hold off;


figure(2);
hold on;
title('Radar 2 POV');
scatter(0,0,'DisplayName','R2 Location');
quiver(0,0,0,1,'DisplayName','R2 View');
[observations_x, observations_y] = r2.getObservationPositions();
scatter(observations_x,observations_y,'DisplayName','R2 Observations');
[neighbor_x,neighbor_y] = pol2cart(r2.neighbors(1).position_angle,r2.neighbors(1).position_distance);
scatter(neighbor_x,neighbor_y,'DisplayName','Neighbor Location');
[view_x,view_y] = pol2cart(r2.neighbors(1).view_angle,1);
quiver(neighbor_x,neighbor_y,view_x,view_y,'DisplayName','Neighbor View');
[observations_x, observations_y] = r2.getNeighborObservationPositions();
scatter(observations_x,observations_y,'DisplayName','Neighbor Observations');
legend();
xlabel('x');
ylabel('y');
xlim([-20 20]);
ylim([-20 20]);
hold off;
