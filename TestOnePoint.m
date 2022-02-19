
r1 = RadarNode([], []);
r2 = RadarNode([], []);

% Change parameters as desired
r1.observations = [Observation((3*pi/4),10,0,0)];
r2.observations = [Observation((pi/2),5,0,0)];
r1.neighbors = [Neighbor((pi/2),15,pi,r2)];
r2.neighbors = [Neighbor(pi,15,0,r1)];
%

run Plot2Radars.m
