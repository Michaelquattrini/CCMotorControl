% MOTOR DATA %
nominal_speed = 6930*2*pi/60;           % [r/s] %
winding_resistance = 0.32;              % [Ohm] %
winding_inductance = 0.082 * 10^(-3);   % [Henry] %
rotor_inertia = 138;                    % [g⋅cm2] %
load_torque_slope = 5.856e-5;      % [Nm/(rad/s)] ≡ [Nm⋅s] %
% kfi = 1/581;                          % [V/rpm] %
kfi = 1/317 * (60/(2*pi));              % [V/(rad/s)] ≡ [Nm/A] %

% SUPPLY SYSTEM %
supply_voltage = 30;                            % [Volt] %
source_internal_resistance = 0.30;              % [Ohm] %
source_internal_inductance = 0.30 * 10^(-3);    % [Henry] %
filter_capacitance = 1e-2;                      % [Farad] %
filter_capacitance_serie_resistance = 0.001;    % [Ohm] %

% 4Q CONVERTER %
current_saturation = 9.2;   % [A] %

% LOAD DATA % 
load_inertia = 200;                                         % [g⋅cm2] %
total_inertia = (rotor_inertia + load_inertia) * 10^(-7);   % [kg⋅m2] %

s = tf('s');

% CARRIER & SAMPLING TIME %
carrier_frequency = 400 * 10^3;                    % [Hertz] %
carrier_period = 1/carrier_frequency;             % [seconds] %
sampling_time = carrier_period / 50; %5e-7;       % [seconds]%

% CURRENT REGULATION %
Gc = 1/(winding_inductance*s + winding_resistance);  % Motor Eq Circuit Transfer Function. %                                      
ki_c = 3050;                                         % PI Current Regulator ki costant %                                          % PI Current Regulator zero. %
kp_c = 18;                                           % PI Current Regulator kp costant %

% SPEED REGULATION %
Gw = 1/(total_inertia*s + load_torque_slope);   % Load Eq Circuit Transfer Function. %                                  
ki_w = 0.0001;                                  % PI Speed Regulator ki costant. %                                     % PI Speed Regulator zero %
kp_w = 0.150;                                   % PI Speed Regulator kp costant. %                         

