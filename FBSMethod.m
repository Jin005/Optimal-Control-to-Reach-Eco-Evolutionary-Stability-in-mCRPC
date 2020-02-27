%% Forwards Backwards Sweep Method


%% Uncomment one of the following to set t0 and tf (final). The algorithm can be sped up with more coarse state dynamics time steps with increased growth rates.
% t0 = 0;
% tf = 10000;
% r_scale = 1;

% t0 = 0;
% tf = 5000;
% r_scale = 2;

t0 = 0;
tf = 4000;
r_scale = 2.5;

% t0 = 0;
% tf = 2000;
% r_scale = 5;

% t0 = 0;
% tf = 1000;
% r_scale = 10;


%% Convergence / stopping criteria
convergenceTolerance = 1E-5;
max_iteration = 5000;

%% State dynamics parameters
params.A12 = 0.7;
params.A13 = 0.8;
params.A21 = 0.4;
params.A23 = 0.6;
params.A31 = 0.5;
params.A32 = 2.0;

params.a = 1/10000;
params.b = 0.5;
params.r1 = 2.7726E-3 * r_scale;
params.r2 = 3.4657E-3 * r_scale;
params.r3 = 6.6542E-3 * r_scale;
params.K3 = 10000;


%% Choose equilibria
% Uncomment below for 2-species equilibrium
params.x1star = 2082.76;
params.x2star = 5206.90;
params.x3star = 1; %Analytically 0, but here set to 1.

% Uncomment below for 3-species equilibrium
% params.x1star = 863.45;
% params.x2star = 4436.73;
% params.x3star = 694.82;


%% Preallocate
J = zeros(1, length(t0:tf-1));
u_convergenceTest = ones(1, length(t0:tf-1));
results = struct([]);


%% Load all starting points
load x0_all.mat
randomStartIndex = [5068,3459,7905,4405,3159,2207,5248,5634,4259,2149,812,8892,5311,4598,3199,7858,203,1106,8906,7499,8900,1774,6975,6544,5550,3628,2757,9534,2795,3057,1772,8779,2716,1569,1527,9909,587,7879,8046,7998,998,9205,2933,2127,5360,8157,1221,9764,4327,3473,7842,4120,7910,808,2125,1817,151,5041,4370,9703,3992,2803,3911,7064,5462,6299,3399,7108,1251,9744,6795,8650,5332,699,7622,293,5908,945,8567,2156,5323,5288,5844,744,3456,4719,3452,6127,5331,3582,6626,2137,2267,6400,5471,4904,7451,5326,2163,5840];

for startPointIndex = 1:1:100
    disp(startPointIndex)
    tic
    
    % Clear out variables.
    x1 = zeros(1, tf);
    x2 = zeros(1, tf);
    x3 = zeros(1, tf);
    
    p1 = [];
    p2 = [];
    p3 = [];
    
    u_old = zeros(1, tf);
    dH = zeros(1, tf);
    J = zeros(1, tf);
    
    % Set initial guess
    u = ones(1, tf) .* 5000;
    
    %     figure
    for iteration = 1:max_iteration
        disp(iteration)
        
        % Gather up the last iterations values for convergence test.
        u_old = u;
        x1_old = x1;
        x2_old = x2;
        x3_old = x3;
        
        % Set x(0)
        x1 = x0_all(randomStartIndex(startPointIndex), 1);
        x2 = x0_all(randomStartIndex(startPointIndex), 2);
        x3 = x0_all(randomStartIndex(startPointIndex), 3);
        
        %% 1) Update system state with current u forward in time.
        for time = 1:1:tf - 1
            dx1dt = x1(time) * params.r1 * (1 - ( ( x1(time) + params.A12 * x2(time) + params.A13 * x3(time) ) / (x2(time) * (params.a * u(time) + params.b) ) ) );
            dx2dt = x2(time) * params.r2 * (1 - ( ( params.A21 * x1(time) + x2(time) + params.A23 * x3(time) ) / u(time) ) );
            dx3dt = x3(time) * params.r3 * (1 - ( ( params.A31 * x1(time) + params.A32 * x2(time) + x3(time) ) / params.K3 ) );
            
            x1(time+1) = max([x1(time) + dx1dt, 1]);
            x2(time+1) = max([x2(time) + dx2dt, 1]);
            x3(time+1) = max([x3(time) + dx3dt, 1]);
        end
        
        
        %% 2) Move backward to get the trajectory of costates
        p1(tf) = 0;
        p2(tf) = 0;
        p3(tf) = 0;
        
        for time = tf:-1:1+1
            dp1dt = p1(time).*params.r1.*((x1(time) + params.A12.*x2(time) + params.A13.*x3(time))./(x2(time).*(params.b + params.a .* u(time))) - 1) - (2.*x1(time) - 2.*params.x1star)./(2.*((x1(time) - params.x1star).^2 + (x2(time) - params.x2star).^2 + (x3(time) - params.x3star).^2).^(1/2)) + (params.A31.*p3(time).*params.r3.*x3(time))./params.K3 + (params.A21.*p2(time).*params.r2.*x2(time))./u(time) + (p1(time).*params.r1.*x1(time))./(x2(time).*(params.b + params.a.*u(time)));
            dp2dt = p2(time).*params.r2.*((x2(time) + params.A21.*x1(time) + params.A23.*x3(time))./u(time) - 1) - (2.*x2(time) - 2.*params.x2star)./(2.*((x1(time) - params.x1star).^2 + (x2(time) - params.x2star).^2 + (x3(time) - params.x3star).^2).^(1/2)) - p1(time).*params.r1.*x1(time).*((x1(time) + params.A12.*x2(time) + params.A13.*x3(time))./(x2(time)^2.*(params.b + params.a.*u(time))) - params.A12./(x2(time).*(params.b + params.a.*u(time)))) + (p2(time).*params.r2.*x2(time))./u(time) + (params.A32.*p3(time).*params.r3.*x3(time))./params.K3;
            dp3dt = p3(time).*params.r3.*((x3(time) + params.A31.*x1(time) + params.A32.*x2(time))./params.K3 - 1) - (2.*x3(time) - 2.*params.x3star)./(2.*((x1(time) - params.x1star).^2 + (x2(time) - params.x2star).^2 + (x3(time) - params.x3star).^2).^(1/2)) + (p3(time).*params.r3.*x3(time))./params.K3 + (params.A23.*p2(time).*params.r2.*x2(time))./u(time) + (params.A13.*p1(time).*params.r1.*x1(time))./(x2(time).*(params.b + params.a.*u(time)));
            
            p1(time-1) = p1(time) - dp1dt;
            p2(time-1) = p2(time) - dp2dt;
            p3(time-1) = p3(time) - dp3dt;
        end
        
        % 3) Calculate deltaH with x1(t), x2(t), x3(t), p1(t), p2(t), p3(t)
        dH = (p2*params.r2.*x2.*(x2 + params.A21*x1 + params.A23.*x3))./u.^2 + (params.a.*p1.*params.r1.*x1.*(x1 + params.A12.*x2 + params.A13.*x3))./(x2.*(params.b + params.a.*u).^2);
        
        % Calculate the cost function
        J(iteration,1) = sum(sqrt((x1-params.x1star).^2 + (x2-params.x2star).^2 + (x3-params.x3star).^2));
        
        %% 4) Adjust control for next iteration
        u = u_old - dH;
        
        % Bound u
        u(u > 10000) = 10000;
        u(u < 0) = 0;
        
        % Test Convergence
        u_convergenceTest(iteration) = sum(abs(u_old - u)) / sum(abs(u));
        
        if u_convergenceTest(iteration) < convergenceTolerance
            break;
        end
        
    end % current iteration
    
    %% When convergence test succeeds or max_iterations occur gather all results.
    results(startPointIndex).startPointIndex = randomStartIndex(startPointIndex);
    results(startPointIndex).x1_start = x1(1);
    results(startPointIndex).x2_start = x2(1);
    results(startPointIndex).x3_start = x3(1);
    
    results(startPointIndex).x1 = x1;
    results(startPointIndex).x2 = x2;
    results(startPointIndex).x3 = x3;
    
    results(startPointIndex).x1_end = x1(end);
    results(startPointIndex).x2_end = x2(end);
    results(startPointIndex).x3_end = x3(end);
    
    results(startPointIndex).u  = u;
    results(startPointIndex).objectiveValue = J;
    results(startPointIndex).u_convergenceTest = u_convergenceTest;
    results(startPointIndex).plottingTime = linspace(1, 10000, tf);
    
    toc
    
end % current start point


