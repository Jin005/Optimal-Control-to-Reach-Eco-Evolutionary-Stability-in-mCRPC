%% FBS 3D Paths and 2D path projections.

% Trajectories that breach patient viability constraint.
% [10,12,18,27,28,34,38,48,61,72,73,80,92];

%% Uncomment one below for two or three species equilibrium results.
% data = importdata('FBSResults_2SpeciesEquilibria.mat');
data = importdata('FBSResults_3SpeciesEquilibria.mat');

% Create figure
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Plot each path of simulated patients that lived.
for i = [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,71,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,93,94,95,96,97,98,99,100]
    plot3(data(i).x1(1), data(i).x2(1), data(i).x3(1),'Marker','.','MarkerSize', 6,'LineStyle','none','Color',[1 0 0]);
    plot3(data(i).x1, data(i).x2, data(i).x3,'Marker','none','LineStyle','-','Color',[0 0 0],'DisplayName', mat2str(i));
    plot3(data(i).x1(end), data(i).x2(end), data(i).x3(end),'Marker','.','MarkerSize', 6,'LineStyle','none','Color',[0 1 0]);
end

% Plot each path of simulated patients that breached viability constraint.
for i = [12,18,27,28,34,48,73,80]
    plot3(data(i).x1, data(i).x2, data(i).x3,'Marker','none','LineStyle','-','Color',[1 0 0]);
end


% Create xlabel
xlabel('x_{T+}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create zlabel
zlabel('x_{T-}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create ylabel
ylabel('x_{TP}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0 10000]);
% Uncomment the following line to preserve the Z-limits of the axes
zlim(axes1,[0 10000]);
view(axes1,[24 12]);
box(axes1,'on');
grid(axes1,'on');
axis(axes1,'square');
% Set the remaining axes properties
set(axes1,'FontName','times new roman','FontSize',22,'XTick',[0 5000 10000],...
    'ZTick',[0 5000 10000]);
set(figure1, 'Position',  [100, 100, 500, 400])



% Create figure
figure2 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes1 = subplot(1,3,1,'Parent',figure2);
hold(axes1,'on');

% Create plot3
for i = [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,71,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,93,94,95,96,97,98,99,100]
    plot3(data(i).x1(1), data(i).x2(1), data(i).x3(1),'Marker','.','MarkerSize', 6,'LineStyle','none','Color',[1 0 0]);
    plot3(data(i).x1, data(i).x2, data(i).x3,'Marker','none','LineStyle','-','Color',[0 0 0]);
    plot3(data(i).x1(end), data(i).x2(end), data(i).x3(end),'Marker','.','MarkerSize', 6,'LineStyle','none','Color',[0 1 0]);
end

for i = [12,18,27,28,34,48,73,80]
    plot3(data(i).x1, data(i).x2, data(i).x3,'Marker','none','LineStyle','-','Color',[1 0 0]);
end

% Create xlabel
xlabel('x_{T+}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create zlabel
zlabel('x_{T-}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create ylabel
ylabel('x_{TP}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0 10000]);
% Uncomment the following line to preserve the Z-limits of the axes
zlim(axes1,[0 10000]);
view(axes1,[0 90]);
box(axes1,'on');
grid(axes1,'on');
axis(axes1,'square');
% Set the remaining axes properties
set(axes1,'FontName','times new roman','FontSize',22,'XTick',[0 5000 10000],...
    'YTick',[0 5000 10000], 'ZTick',[0 5000 10000]);


% Create axes
axes2 = subplot(1,3,2,'Parent',figure2);

hold(axes2,'on');

% Create plot3
for i = [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,71,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,93,94,95,96,97,98,99,100]
    plot3(data(i).x1(1), data(i).x2(1), data(i).x3(1),'Marker','.','MarkerSize', 6,'LineStyle','none','Color',[1 0 0]);
    plot3(data(i).x1, data(i).x2, data(i).x3,'Marker','none','LineStyle','-','Color',[0 0 0]);
    plot3(data(i).x1(end), data(i).x2(end), data(i).x3(end),'Marker','.','MarkerSize', 6,'LineStyle','none','Color',[0 1 0]);
end

for i = [12,18,27,28,34,48,73,80]
    plot3(data(i).x1, data(i).x2, data(i).x3,'Marker','none','LineStyle','-','Color',[1 0 0]);
end

% Create xlabel
xlabel('x_{T+}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create zlabel
zlabel('x_{T-}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create ylabel
ylabel('x_{TP}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes2,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes2,[0 10000]);
% Uncomment the following line to preserve the Z-limits of the axes
zlim(axes2,[0 10000]);
view(axes2,[0 0]);
box(axes2,'on');
grid(axes2,'on');
axis(axes2,'square');
% Set the remaining axes properties
set(axes2,'FontName','times new roman','FontSize',22,'XTick',[0 5000 10000],...
    'YTick',[0 5000 10000], 'ZTick',[0 5000 10000]);


% Create axes
axes3 = subplot(1,3,3,'Parent',figure2);

hold(axes3,'on');

% Create plot3
for i = [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,71,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,93,94,95,96,97,98,99,100]
    plot3(data(i).x1(1), data(i).x2(1), data(i).x3(1),'Marker','.','MarkerSize', 6,'LineStyle','none','Color',[1 0 0]);
    plot3(data(i).x1, data(i).x2, data(i).x3,'Marker','none','LineStyle','-','Color',[0 0 0]);
    plot3(data(i).x1(end), data(i).x2(end), data(i).x3(end),'Marker','.','MarkerSize', 6,'LineStyle','none','Color',[0 1 0]);
end

for i = [12,18,27,28,34,48,73,80]
    plot3(data(i).x1, data(i).x2, data(i).x3,'Marker','none','LineStyle','-','Color',[1 0 0]);
end

% Create xlabel
xlabel('x_{T+}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create zlabel
zlabel('x_{T-}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create ylabel
ylabel('x_{TP}','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes3,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes3,[0 10000]);
% Uncomment the following line to preserve the Z-limits of the axes
zlim(axes3,[0 10000]);
view(axes3,[90 0]);
box(axes3,'on');
grid(axes3,'on');
axis(axes3,'square');
% Set the remaining axes properties
set(axes3,'FontName','times new roman','FontSize',22,'XTick',[0 5000 10000],...
    'YTick',[0 5000 10000], 'ZTick',[0 5000 10000]);

set(figure2, 'Position',  [100, 100, 1200, 350])

