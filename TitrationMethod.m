
%% State dynamics parameters
params.A12 = 0.7;
params.A13 = 0.8;
params.A21 = 0.4;
params.A23 = 0.6;
params.A31 = 0.5;
params.A32 = 2.0;

params.a = 1/10000;
params.b = 0.5;
params.r1 = 2.7726E-3;
params.r2 = 3.4657E-3;
params.r3 = 6.6542E-3;
params.K3 = 10000;

tf = 10000;

%% Treatment bounds
minDose = 10000;
maxDose = 1000;

%% Set titration parameters
checkInterval = 100;

% Load starting points
load x0_all.mat

% Uncomment for desired treatment protocol.
treatment = 'MTD';
% treatment = 'AT';
% treatment = 'Va_1'; 
% treatment = 'Va_0';
% treatment = 'Vb_1';
% treatment = 'Vb_0';

%% Preallocate for each case.
results(size(x0_all, 1)) = struct('x1_end', zeros(1,1), 'x2_end', zeros(1,1), 'x3_end', zeros(1,1),'x1_start', zeros(1,1), 'x2_start', zeros(1,1), 'x3_start', zeros(1,1), 'u', zeros(1, tf), 'deadFlag', zeros(1, 1), 'deathTime', zeros(1, 1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Uncommment below for recreation of specific manuscript figures and data %%

%% For all 10000 start points
for allStartPointIndex = 1:size(x0_all, 1)
    plottingFlag = 0;

%% For MTD manuscript figure only using FBS 100 start points and single example
% for allStartPointIndex = [5068,3459,7905,4405,3159,2207,5248,5634,4259,2149,812,8892,5311,4598,3199,7858,203,1106,8906,7499,8900,1774,6975,6544,5550,3628,2757,9534,2795,3057,1772,8779,2716,1569,1527,9909,587,7879,8046,7998,998,9205,2933,2127,5360,8157,1221,9764,4327,3473,7842,4120,7910,808,2125,1817,151,5041,4370,9703,3992,2803,3911,7064,5462,6299,3399,7108,1251,9744,6795,8650,5332,699,7622,293,5908,945,8567,2156,5323,5288,5844,744,3456,4719,3452,6127,5331,3582,6626,2137,2267,6400,5471,4904,7451,5326,2163,5840];
%     plottingFlag = 0;
%     treatment = 'MTD'

%% For MTD manuscript figure single example
% for allStartPointIndex = 55
%     plottingFlag = 1;
%     treatment = 'MTD'


%% For AT manuscript figure
% for allStartPointIndex = 92
%     plottingFlag = 1;
%     treatment = 'AT'

    
%% For Titration examples manuscript figure
% for allStartPointIndex = 55
%     plottingFlag = 1;
    
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp(allStartPointIndex);
    
    % Set x(0)
    x1 = x0_all(allStartPointIndex, 1);
    x2 = x0_all(allStartPointIndex, 2);
    x3 = x0_all(allStartPointIndex, 3);
    
    % Set deadFlag to false
    deadFlag = 0;
    
    % Set treatment specific initial conditions
    switch treatment
        case 'MTD'
            u(1:tf) = maxDose;
            
        case 'AT'
            stabilizationVolume = x1(1) + x2(1) + x3(1);
            
        case 'Va_1'
            stabilizationVolume = x1(1) + x2(1) + x3(1);
            u(1:tf) = maxDose;
            
        case 'Va_0'
            stabilizationVolume = x1(1) + x2(1) + x3(1);
            u(1:tf) = minDose;
            
        case 'Vb_1'
            stabilizationVolume = 7000;
            u(1:tf) = maxDose;
            
        case 'Vb_0'
            stabilizationVolume = 7000;
            u(1:tf) = minDose;
            
    end
    
    % Run simulation from t0 - tf
    for time = 1:1:tf - 1
        
        % Update tumor volume.
        newTumorVolume = x1(time) + x2(time) + x3(time);
        
        % Check patient viability constraint
        if (newTumorVolume >= 9000)
            deadFlag = 1;
            break;
        end
        
        switch treatment
            
            case 'AT' %% Adaptive Therapy
                
                if (newTumorVolume >= stabilizationVolume)
                    % Start Abi
                    u(time:tf) = maxDose;
                    
                elseif (newTumorVolume <= stabilizationVolume * 0.5)
                    % Stop Abi
                    u(time:tf) = minDose;
                end
                
                
            case  {'Va_1', 'Va_0', 'Vb_1', 'Vb_0'} %% Stabilizization
                
                % Is it time to make treatment changes?
                if(mod(time, checkInterval) == 0)
                    
                    if (newTumorVolume < 0.9 * stabilizationVolume)
                        u(time:tf) = min([u(time) + 1000, 10000]);
                        
                    elseif (newTumorVolume > 1.1 * stabilizationVolume)
                        u(time:tf) = max([u(time) - 1000, 1000]);
                        
                    end
                    
                end
                
        end % treatment case
        
        % Update states.
        dx1dt = x1(time) * params.r1 * (1 - ( ( x1(time) + params.A12 * x2(time) + params.A13 * x3(time) ) / (x2(time) * (params.a * u(time) + params.b) ) ) );
        dx2dt = x2(time) * params.r2 * (1 - ( ( params.A21 * x1(time) + x2(time) + params.A23 * x3(time) ) / u(time) ) );
        dx3dt = x3(time) * params.r3 * (1 - ( ( params.A31 * x1(time) + params.A32 * x2(time) + x3(time) ) / params.K3 ) );
        
        x1(time+1) = max([x1(time) + dx1dt, 1]);
        x2(time+1) = max([x2(time) + dx2dt, 1]);
        x3(time+1) = max([x3(time) + dx3dt, 1]);
        
    end % t0 - tf
    
    %% Gather all results.
    results(allStartPointIndex).x1_start = x1(1);
    results(allStartPointIndex).x2_start = x2(1);
    results(allStartPointIndex).x3_start = x3(1);
    
    results(allStartPointIndex).x1 = x1;
    results(allStartPointIndex).x2 = x2;
    results(allStartPointIndex).x3 = x3;
    
    results(allStartPointIndex).x1_end = x1(end);
    results(allStartPointIndex).x2_end = x2(end);
    results(allStartPointIndex).x3_end = x3(end);
    
    results(allStartPointIndex).u  = u;
    results(allStartPointIndex).deadFlag  = deadFlag;
    results(allStartPointIndex).deathTime = time/tf;
    
end % current start point

%% Name the output structure appropriately.
switch treatment
    case 'MTD'
        MTD = results;
        
    case 'AT'
        AT = results;
        
    case 'Va_1'
        Va_1 = results;
        
    case 'Va_0'
        Va_0 = results;
        
    case 'Vb_1'
        Vb_1 = results;
        
    case 'Vb_0'
        Vb_0 = results;
end


%% Plotting of singular examples. (DO NOT USE FOR MORE THAN ONE START POINT. DISASTER.)
if plottingFlag == 1
    
    % Plot state dynamics and Abiraterone dose over time
    figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);
    
    subplot(2, 1, 1)
    plot(x1, 'b', 'LineWidth', 2, 'DisplayName', 'T+')
    hold on
    plot(x2, 'g', 'LineWidth', 2, 'DisplayName', 'TP')
    plot(x3, 'r', 'LineWidth', 2, 'DisplayName', 'T-')
    plot(x1 + x2 + x3, '--k', 'LineWidth', 2, 'DisplayName', 'TTV')
    
    xlabel('Time (units)','FontWeight','bold','FontSize',22,'FontName','times new roman');
    ylabel('Population Density','FontWeight','bold','FontSize',22,'FontName','times new roman');
    
    ylim([0 10000])
    xlim([0 10000])
    
    set(gca,'FontSize',22,'FontName','times new roman');
    legend show
    
    subplot(2, 1, 2)
    plot((10000 - u)./10000, 'k', 'LineWidth', 2, 'DisplayName', 'u')
    
    xlabel('Time (units)','FontWeight','bold','FontSize',22,'FontName','times new roman');
    ylabel('Abiraterone Dose','FontWeight','bold','FontSize',22,'FontName','times new roman');
    
    ylim([0 1])
    xlim([0 10000])
    
    set(gca, 'FontWeight','bold','FontSize',22,'FontName','times new roman');
    set(figure1, 'Position',  [100, 100, 700, 700])
    
    
    % Plot 3D path and equilibrium points
    figure2 = figure('InvertHardcopy','off','Color',[1 1 1]);
    
    if results(allStartPointIndex).deadFlag == 0
        plot3(x1, x2, x3,'Marker','none','LineStyle','-','Color',[0 0 0]);
    else
        plot3(x1, x2, x3,'Marker','none','LineStyle','-','Color',[1 0 0]);
    end
    
    hold on
    plot3(863.45, 4436.73, 694.82,'Marker','.','MarkerSize', 20, 'LineStyle','none','Color',[0 0 1]);
    plot3(2082.76, 5206.90, 1,'Marker','.','MarkerSize', 20, 'LineStyle','none','Color',[0 0 1]);
    
    xlabel('x_{T+}','FontWeight','bold','FontSize',22,'FontName','times new roman');
    zlabel('x_{T-}','FontWeight','bold','FontSize',22,'FontName','times new roman');
    ylabel('x_{TP}','FontWeight','bold','FontSize',22,'FontName','times new roman');
    
    xlim([0 10000]);
    ylim([0 10000]);
    zlim([0 10000]);
    
    view([24 12]);
    box('on');
    grid('on');
    axis('square');
    set(gca,'FontName','times new roman','FontSize',22,'XTick',[0 5000 10000], 'ZTick',[0 5000 10000]);
    
    set(figure2, 'Position',  [100, 100, 500, 400])
    
end

