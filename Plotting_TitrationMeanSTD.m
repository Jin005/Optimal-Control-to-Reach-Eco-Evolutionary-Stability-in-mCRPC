%% Mean and STD Analysis of Titration Protocols.

tf = 10000;

%% Set titration parameters
checkInterval = 100;

%% Uncomment for each of the titration protocols.
data = importdata('AllTreatmentResults/Va_1.mat');
% data = importdata('AllTreatmentResults/Va_0.mat');
% data = importdata('AllTreatmentResults/Vb_1.mat');
% data = importdata('AllTreatmentResults/Vb_0.mat');

% Parse out trajectories that do not breach the patient viability
% constraint.
notDeadIndeces = find([data.deadFlag] == 0);
notDead = data(notDeadIndeces);

% Extract all optimized treatments. (Slow, but it works)
for i = 1:1:size(notDeadIndeces, 2)
    u(i,:) = (10000 - notDead(i).u)./10000;
end

% Calculate mean and STD
mean_u = mean(u, 1);
STD_u = std(u, 0, 1);

% Create figure
figure1 = figure('InvertHardcopy','off','Color',[1 1 1]);

% Create axes
axes1 = axes('Parent',figure1);
hold(axes1,'on');

% Create plot
plot(mean_u,'LineWidth',4,'Color',[0 0 0]);

% Create errorbar
errorbar(1:checkInterval:tf, mean_u(1:checkInterval:tf), STD_u(1:checkInterval:tf),'LineStyle','none',...
    'Color',[0.501960813999176 0.501960813999176 0.501960813999176]);

% Create xlabel
xlabel('Time (units)','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Create zlabel
ylabel('Abiraterone Dose','FontWeight','bold','FontSize',22,'FontName','times new roman');

% Uncomment the following line to preserve the X-limits of the axes
xlim(axes1,[0 10000]);
% Uncomment the following line to preserve the Y-limits of the axes
ylim(axes1,[-0.1 1.09]);
box on

set(axes1,'FontName','times new roman','FontSize',22)
set(figure1, 'Position',  [100, 100, 700, 350])
