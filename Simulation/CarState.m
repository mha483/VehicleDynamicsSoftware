classdef CarState % CURRENTLY UNUSED!
    properties
        body_xd
        body_yd
        body_phid
        iner_xd
        iner_yd
        iner_phid
        iner_x
        iner_y
        iner_psi
    end
    
    methods
        function state = CarState(stateObj)
            if nargin > 0
                stateObj.body_xd             = body_xd;
                stateObj.body_yd             = body_yd;
                stateObj.body_phid           = body_phid;
                stateObj.iner_xd             = iner_xd;
                stateObj.iner_yd             = iner_yd;
                stateObj.iner_phid           = iner_phid;
                stateObj.iner_x              = iner_x;
                stateObj.iner_y              = iner_y;
                stateObj.iner_psi            = iner_psi;
            else % default vals if no input args given
                stateObj.body_xd             = 0;
                stateObj.body_yd             = 0;
                stateObj.body_phid           = 0;
                stateObj.iner_xd             = 0;
                stateObj.iner_yd             = 0;
                stateObj.iner_phid           = 0;
                stateObj.iner_x              = 0;
                stateObj.iner_y              = 0;
                stateObj.iner_psi            = 0;
            end
        end
    end
end
        