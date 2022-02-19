
classdef RadarNode
   properties
      observations
      neighbors
   end
   methods
       function obj = RadarNode(observations, neighbors)
           obj.observations = observations;
           obj.neighbors = neighbors;
       end
        function neighborObservations = getNeighborObservations(obj)
            neighborObservations = [];
            for n = obj.neighbors
                neighborObservations = [neighborObservations, n.transformObservations()]
            end
        end
        function [observations_x, observations_y] = getObservationPositions(obj)
            observations_x = [];
            observations_y = [];
            for obs = obj.observations
                [x,y] = pol2cart(obs.position_angle,obs.position_distance);
                observations_x = [observations_x,x];
                observations_y = [observations_y,y];
            end
        end
        function [observations_x, observations_y] = getNeighborObservationPositions(obj)
            observations_x = [];
            observations_y = [];
            for obs = obj.getNeighborObservations()
                [x,y] = pol2cart(obs.position_angle,obs.position_distance);
                observations_x = [observations_x,x];
                observations_y = [observations_y,y];
            end
        end
    end
end
