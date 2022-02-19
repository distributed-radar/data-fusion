
r1 = RadarNode([], []);
r2 = RadarNode([], []);

r2.observations = [Observation((pi/2),1,0,0)];

r1.neighbors = [Neighbor(0,2,pi,r2)];

figure(2);
title('Radar 2 POV');
scatter(0,0,'DisplayName','R2 Location');
hold on;
[obs_x,obs_y] = pol2cart(r2.observations(1).position_angle,r2.observations(1).position_distance);
scatter(obs_x,obs_y,'DisplayName','R2 Observation');
quiver(0,0,1,0,'DisplayName','View Angle');
legend();
xlabel('x');
ylabel('y');
xlim([-5 5]);
ylim([-5 5]);
hold off;

figure(1);
title('Radar 1 POV');
[neighb_x,neighb_y] = pol2cart(r1.neighbors(1).position_angle,r1.neighbors(1).position_distance);
scatter(neighb_x,neighb_y,'DisplayName','R2 Location');
hold on;
neighbor_observations = r1.getNeighborObservations();
[obs_x,obs_y] = pol2cart(neighbor_observations(1).position_angle,neighbor_observations(1).position_distance);
scatter(obs_x,obs_y,'DisplayName','R2 Observation');
[view_x,view_y] = pol2cart(r1.neighbors(1).view_angle, 1);
quiver(neighb_x,neighb_y,view_x,view_y);
legend();
xlabel('x');
ylabel('y');
xlim([-5 5]);
ylim([-5 5]);
hold off;
