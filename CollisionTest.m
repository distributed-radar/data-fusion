
r1 = RadarNode([], []);
r2 = RadarNode([], []);

r1_obs_coords = [
    3.5     5.5 ;
    -6      7 ;
    -4      7 ;
    -1      6.5 ;
    1       6.5 ;
];
for i = 1:size(r1_obs_coords,1)
    [t,d] = cart2pol(r1_obs_coords(i,1),r1_obs_coords(i,2));
    r1.observations = [r1.observations, Observation(t,d,0,0)];
end

r2_obs_coords = [
    -14     4 ;
    -13     8 ;
    -1      12 ;
    -7      11 ;
    -3.5    11 ;
    0       11 ;
    1       9 ;
    1       7 ;
    1       5 ;
    1       3 ;
];
for i = 1:size(r2_obs_coords,1)
    [t,d] = cart2pol(r2_obs_coords(i,1),r2_obs_coords(i,2));
    r2.observations = [r2.observations, Observation(t,d,0,0)];
end

[t,d] = cart2pol(2.75,5.4);
r1.neighbors = [Neighbor(t,d,(pi),r2)];
[t,d] = cart2pol(-5.4,2.75);
r2.neighbors = [Neighbor(t,d,0,r1)];

r1_neighbor_observations = r1.getNeighborObservations();
r2_neighbor_observations = r2.getNeighborObservations();

clear d i t

run Plot2Radars.m
