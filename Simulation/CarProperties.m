classdef CarProperties % CURRENTLY UNUSED!
    properties % All SI units
        mass
        lift_coeff
        drag_coeff
        frontal_area
        tire_radius
        roll_resistance
        lon_friction
        lat_friction
        torque           % From all 4 wheels
        brake_force
    end
    
    methods
        function car = Car(m,Cl,Cd,A,r,Crr,Ux,Uy,T,Fbrake)
            if nargin > 0
                car.mass                = m;
                car.lift_coeff          = Cl;
                car.drag_coeff          = Cd;
                car.frontal_area        = A;
                car.tire_radius         = r;
                car.roll_resistance     = Crr;
                car.lon_friction        = Ux;
                car.lat_friction        = Uy;
                car.torque              = T;
                car.brake_force         = Fbrake;
            else % default vals if no input args given
                car.mass                = 1;
                car.lift_coeff          = 1;
                car.drag_coeff          = 1;
                car.frontal_area        = 1;
                car.tire_radius         = 0.25;
                car.roll_resistance     = 0.03;
                car.lon_friction        = 1;
                car.lat_friction        = 1;
                car.torque              = 400;
                car.brake_force         = 800;
            end
        end
    end
end