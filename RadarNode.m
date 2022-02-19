
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
    end
end
