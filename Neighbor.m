
classdef Neighbor
   properties
      position_angle
      position_distance
      view_angle
      radar
   end
   methods
       function obj = Neighbor(position_angle, position_distance, view_angle, radar)
           obj.position_angle = position_angle;
           obj.position_distance = position_distance;
           obj.view_angle = view_angle;
           obj.radar = radar;
       end
       function transformedObservations = transformObservations(obj)
           transformedObservations = [];
           [neighbor_x,neighbor_y] = pol2cart(obj.position_angle, obj.position_distance);
           for obs = obj.radar.observations
               % https://www.desmos.com/calculator/ac43ej7wgc
               new_x = obs.position_distance*cos(obs.position_angle+obj.view_angle) + neighbor_x;
               new_y = obs.position_distance*sin(obs.position_angle+obj.view_angle) + neighbor_y;
               [new_position_angle, new_position_distance] = cart2pol(new_x,new_y);
               new_doppler_angle = obs.doppler_angle + obj.view_angle;
               new_doppler_distance = obs.doppler_distance;
               new_obs = Observation(new_position_angle, new_position_distance, new_doppler_angle, new_doppler_distance);
               transformedObservations = [transformedObservations, new_obs];
           end
       end
   end
end
