%% Plotting for FBS results

alldata2Species = importdata('FBSResults_2SpeciesEquilibria.mat');
alldata3Species = importdata('FBSResults_3SpeciesEquilibria.mat');

u_2SpeciesTime = alldata2Species.plottingTime;
u_3SpeciesTime = alldata3Species.plottingTime;

%% 2 Species that die first
% [10,12,18,27,28,34,38,48,61,72,73,80,92];

%% 3 Species that die first
% [10,12,18,27,28,34,38,48,61,72,73,80,92];

for i = [1,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,62,63,64,65,66,67,68,69,70,71,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,93,94,95,96,97,98,99,100]
    u2_2Species(i,:) = (10000 - alldata2Species(i).u2)./9900;
    u2_3Species(i,:) = (10000 - alldata3Species(i).u2)./9900;
end


%% Two Species Raw Data

% Create figure
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
for j = 1:1:99
plot(u_2SpeciesTime(1:3950), u2_2Species(j,(1:3950)), 'LineStyle','-','Color',[0 0 0]);
end

% Create xlabel
xlabel('Time (units)','FontWeight','bold','FontSize',16,'FontName','times new roman');

% Create zlabel
ylabel('Abiraterone Dose','FontWeight','bold','FontSize',16,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[0 1]);

set(figure1, 'Position',  [100, 100, 700, 350])



%% Three Species Raw Data

% Create figure
figure2 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes2 = axes('Parent',figure2);
hold(axes2,'on');

% Create plot
for j = 1:1:99
plot(u_3SpeciesTime(1:3950), u2_3Species(j,(1:3950)), 'LineStyle','-','Color',[0 0 0]);
end

% Create xlabel
xlabel('Time (units)','FontWeight','bold','FontSize',16,'FontName','times new roman');

% Create zlabel
ylabel('Abiraterone Dose','FontWeight','bold','FontSize',16,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes2,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes2,[0 1]);

set(figure2, 'Position',  [100, 100, 700, 350])





%% SEM Analysis 
index = 0;
for i = 1:40:3950
    
    index = index + 1;
    SEM_2Species(index) = std(u2_2Species(:,i))/sqrt(99);
    STD_2Species(index) = std(u2_2Species(:,i));
    
    SEM_3Species(index) = std(u2_3Species(:,i))/sqrt(99);
    STD_3Species(index) = std(u2_3Species(:,i));
    
       
end

mean_u2_2Species = mean(u2_2Species, 1);
mean_u2_3Species = mean(u2_3Species, 1);


%% Two Species SEM

% Create figure
figure3 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes3 = axes('Parent',figure3);
hold(axes3,'on');

% Create plot
plot(u_2SpeciesTime(1:3950), mean_u2_2Species(1:3950),'LineWidth',4,'Color',[0 0 0]);

% Create errorbar
errorbar(u_2SpeciesTime(1:40:3950), mean_u2_2Species(1:40:3950), STD_2Species,'LineStyle','none',...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

% Create xlabel
xlabel('Time (units)','FontWeight','bold','FontSize',16,'FontName','times new roman');

% Create zlabel
ylabel('Abiraterone Dose','FontWeight','bold','FontSize',16,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes3,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes3,[-0.1 1]);

set(figure3, 'Position',  [100, 100, 700, 350])



%% Three Species SEM

% Create figure
figure4 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes4 = axes('Parent',figure4);
hold(axes4,'on');

% Create plot
plot(u_3SpeciesTime(1:3950), mean_u2_3Species(1:3950),'LineWidth',4,'Color',[0 0 0]);

% Create errorbar
errorbar(u_3SpeciesTime(1:40:3950), mean_u2_3Species(1:40:3950), STD_3Species,'LineStyle','none',...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

% Create xlabel
xlabel('Time (units)','FontWeight','bold','FontSize',16,'FontName','times new roman');

% Create zlabel
ylabel('Abiraterone Dose','FontWeight','bold','FontSize',16,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes4,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes4,[-0.1 1]);

set(figure4, 'Position',  [100, 100, 700, 350])














