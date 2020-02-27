% Create figure
figure('InvertHardcopy','off','Color',[1 1 1]);
hold on


%% x(*,2) - Second equilibrium. T+ and TP
x_1 = [];
x_2 = [];
x_3 = [];

% Set lambda
lambda = linspace(0, 0.4828, 1000);

% Calculate equilibria
x_1 = (448000 .* lambda - 247500 .* lambda.^2 - 200000)./(10 .* lambda - 33);
x_2 = (247500 .* lambda - 250000)./(10 .* lambda - 33);
x_3 = 0;

% Plot T+, TP, and TTV
plot(lambda, x_1, 'b', 'LineWidth', 2)
plot(lambda, x_2, 'g', 'LineWidth', 2)
plot(lambda, x_1 + x_2 + x_3, ':k', 'LineWidth', 2)

% Add star for equilibrium used in manuscript for optimal control
plot(lambda(829), x_1(829) + x_2(829), 'pk', 'MarkerSize', 12, 'MarkerFaceColor', 'k')



%% x(*,6) - Sixth equilibrium. T+, TP, and T-
x_1 = [];
x_2 = [];
x_3 = [];

% Set lambda
lambda = [];
lambda = linspace(0.4828, 0.4877, 100);

% Calculate equilibria
x_1 = (1388000 .* lambda - 495000 .* lambda.^2 -560000)./(5 .* lambda - 6);
x_2 = (297000 .* lambda - 160000)./(5 .* lambda - 6);
x_3 = (247500 .* lambda.^2 - 1238000 .* lambda + 540000)./(5 .* lambda - 6);

% Plot T+, TP, T-, and TTV
p1 = plot(lambda, x_1, 'b', 'LineWidth', 2, 'DisplayName', 'T+');
p2 = plot(lambda, x_2, 'g', 'LineWidth', 2, 'DisplayName', 'TP');
p3 = plot(lambda, x_3, 'r', 'LineWidth', 2, 'DisplayName', 'T-');
p4 = plot(lambda, x_1 + x_2 + x_3, ':k', 'LineWidth', 2, 'DisplayName', 'TTV');

% Add star for equilibrium used in manuscript for optimal control
plot(lambda(41), x_1(41) + x_2(41) + x_3(41), 'pk', 'MarkerSize', 12, 'MarkerFaceColor', 'k')



%% x(*,5) - Fifth equilibrium. T- only
x_1 = [];
x_2 = [];
x_3 = [];

% Set lambda
lambda = [];
lambda = linspace(0.4877, 1, 100);

% Calculate equilibria - all T- = 10000;
x_3 = 10000 + 0 .* lambda;

% Plot T- and TTV
plot(lambda, x_3, 'r', 'LineWidth', 2)
plot(lambda, x_3, ':k', 'LineWidth', 2)



%% Plot patient viability constraint
plot([0, 1], [9000, 9000], 'k', 'LineWidth', 3)



%% Add region highlights
% Create textarrow
annotation('textarrow',[0.53835800807537 0.51278600269179],...
    [0.194620253164557 0.169303797468354],'String',{'x^{(*,6)}'},'FontSize',22,...
    'FontName','times new roman');

% Create textbox
annotation('textbox',...
    [0.511440107671602 0.110759493670886 0.393321797090302 0.053869801084991],...
    'String','x^{(*,5)}',...
    'HorizontalAlignment','center',...
    'FontSize',22,...
    'FontName','times new roman',...
    'FitBoxToText','off',...
    'BackgroundColor',[0.800000011920929 0.800000011920929 0.800000011920929]);

% Create rectangle
annotation('rectangle',...
    [0.501 0.110759493670886 0.0104401076716014 0.0537974683544304]);

% Create textbox
annotation('textbox',...
    [0.130443334443335 0.110759493670886 0.370428571428571 0.053869801084991],...
    'String','x^{(*,2)}',...
    'HorizontalAlignment','center',...
    'FontSize',22,...
    'FontName','times new roman',...
    'FitBoxToText','off',...
    'BackgroundColor',[0.831372559070587 0.815686285495758 0.7843137383461]);


%% Make it pretty
box on

xlim([0, 1])
ylim([0 10000])

xlabel('\Lambda','FontWeight','bold','FontSize',22,'FontName','times new roman');
ylabel('Population Density','FontWeight','bold','FontSize',22,'FontName','times new roman');

set(gca,'FontName','times new roman','FontSize',22)
set(gcf, 'Position',  [100, 100, 1000, 600])

legend([p1 p2 p3 p4], {'T+', 'TP', 'T-', 'TTV'})
