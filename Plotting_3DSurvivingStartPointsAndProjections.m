%% Start points of patients that survived for each treatment

% Uncomment for desired treatment protocol.
% data = importdata('AllTreatmentResults/MTD.mat');
% data = importdata('AllTreatmentResults/AT.mat');
% data = importdata('AllTreatmentResults/Va_1.mat');
% data = importdata('AllTreatmentResults/Va_0.mat');
% data = importdata('AllTreatmentResults/Vb_1.mat');
data = importdata('AllTreatmentResults/Vb_0.mat');

% Parse out trajectories that do not breach the patient viability
% constraint.
notDeadIndeces = find([data.deadFlag] == 0);
notDead = data(notDeadIndeces);

% Extract starting points.
x1_start = [notDead.x1_start];
x2_start = [notDead.x2_start];
x3_start = [notDead.x3_start];


%% %%%%%%%%%% 3D view %%%%%%%%%% %%
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot3
plot3(x1_start, x2_start, x3_start,'Marker','.','MarkerSize', 9,'LineStyle','none','Color',[0 0 0]);

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
view(axes1,[22 12]);
box(axes1,'on');
grid(axes1,'on');
axis(axes1,'square');
% Set the remaining axes properties
set(axes1,'FontName','times new roman','FontSize',22,'XTick',[0 5000 10000],...
    'ZTick',[0 5000 10000]);
set(figure1, 'Position',  [100, 100, 500, 400])


%% %%%%%%%%%% Projections %%%%%%%%%% %%
figure2 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes1 = subplot(1,3,1,'Parent',figure2);
hold(axes1,'on');

% Create plot3
plot3(x1_start, x2_start, x3_start,'Marker','.','MarkerSize', 9, 'LineStyle','none','Color',[0 0 0]);

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
plot3(x1_start, x2_start, x3_start,'Marker','.','MarkerSize', 9,'LineStyle','none','Color',[0 0 0]);

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
plot3(x1_start, x2_start, x3_start,'Marker','.','MarkerSize', 9,'LineStyle','none','Color',[0 0 0]);

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

