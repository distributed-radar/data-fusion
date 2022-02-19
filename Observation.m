
classdef Observation
   properties
      position_angle
      position_distance
      doppler_angle
      doppler_distance
   end
   methods
       function obj = Observation(position_angle, position_distance, doppler_angle, doppler_distance)
           obj.position_angle = position_angle;
           obj.position_distance = position_distance;
           obj.doppler_angle = doppler_angle;
           obj.doppler_distance = doppler_distance;
       end
   end
end
