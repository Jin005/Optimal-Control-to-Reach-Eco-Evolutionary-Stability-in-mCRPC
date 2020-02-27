%% 100 start points for Forwards Backwards Sweep Method

% Load all 10,000 starting points
load x0_all.mat;

% These are the random indeces for the 100 start points for the FBS method
randomStartIndex = [5068,3459,7905,4405,3159,2207,5248,5634,4259,2149,812,8892,5311,4598,3199,7858,203,1106,8906,7499,8900,1774,6975,6544,5550,3628,2757,9534,2795,3057,1772,8779,2716,1569,1527,9909,587,7879,8046,7998,998,9205,2933,2127,5360,8157,1221,9764,4327,3473,7842,4120,7910,808,2125,1817,151,5041,4370,9703,3992,2803,3911,7064,5462,6299,3399,7108,1251,9744,6795,8650,5332,699,7622,293,5908,945,8567,2156,5323,5288,5844,744,3456,4719,3452,6127,5331,3582,6626,2137,2267,6400,5471,4904,7451,5326,2163,5840];

% Extract x,y,z coordinates
data(:,1) = x0_all(randomStartIndex, 1);
data(:,2) = x0_all(randomStartIndex, 2);
data(:,3) = x0_all(randomStartIndex, 3);

%% %%%%%%%%%% 3D view %%%%%%%%%% %%
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot3
plot3(data(:,1), data(:,2), data(:,3),'Marker','.','MarkerSize', 12,'LineStyle','none','Color',[0 0 0]);

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
plot3(data(:,1), data(:,2), data(:,3),'Marker','.','MarkerSize', 12, 'LineStyle','none','Color',[0 0 0]);

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
plot3(data(:,1), data(:,2), data(:,3),'Marker','.','MarkerSize', 12,'LineStyle','none','Color',[0 0 0]);

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
plot3(data(:,1), data(:,2), data(:,3),'Marker','.','MarkerSize', 12,'LineStyle','none','Color',[0 0 0]);

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

