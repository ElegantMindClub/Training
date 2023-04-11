%% import data

clear all;
close all;

%Get paths to your .csv files using cmd/terminal
path1="/Users/Mingda/Library/Mobile Documents/com~apple~CloudDocs/Documents/UCLA/Research/Github/Test/Josh_01_24_EPB Covert and 3 Sizes.csv";

%Reading In Data
OneDec=readtable(path1);



%% Plotting Reflex

figure()
hold on
    
    %Changing data type and specifying row containing RTs
    xvals = OneDec{OneDec.('Eccentricity')==24,{'ReactionTime_s_'}}*1000;
    avals = rmoutliers(xvals,'quartiles');
    
    %Plot avals in a histogram and toggle bar & edge color
    histogram(avals,'FaceColor','#0072BD', 'EdgeColor', 'w', 'BinWidth',20);    
     
    mn = mean(avals,'omitnan');
    stdv = std(avals,'omitnan');

    namelabel = '24 degrees';
    mnlabel = sprintf('Mean: %4.2f ms', mn);
    stdlabel = sprintf('Std Deviation: %4.2f ms', stdv);
    
    n = annotation('textbox',[0.62 0.65 0.1 0.1]);

    set(n,'String',{namelabel, mnlabel,stdlabel});

    %% Plotting Two Decision

    xvals = OneDec{OneDec.('Eccentricity')==16,{'ReactionTime_s_'}}*1000;
    avals = rmoutliers(xvals,'quartiles');
    
    histogram(avals,'FaceColor', '[0.6350, 0.0780, 0.1840]', 'EdgeColor', 'w', 'BinWidth',20);    
     
    mn = mean(avals,'omitnan');
    stdv = std(avals,'omitnan');

    namelabel = '16 degrees';
    mnlabel = sprintf('Mean: %4.2f ms', mn);   
    stdlabel = sprintf('Std Deviation: %4.2f ms', stdv);
    
    n = annotation('textbox',[0.62 0.50 0.1 0.1]);

    set(n,'String',{namelabel, mnlabel,stdlabel});

    %% Plotting Three Decision
    %Write code to plot your 3 Dec data
    xvals = OneDec{OneDec.('Eccentricity')==8,{'ReactionTime_s_'}}*1000;
    avals = rmoutliers(xvals,'quartiles');
    
    histogram(avals,'FaceColor', '[0.1450, 0.4780, 0.32]', 'EdgeColor', 'w', 'BinWidth',20);    
     
    mn = mean(avals,'omitnan');    
    stdv = std(avals,'omitnan');

    namelabel = '8 degrees';

    mnlabel = sprintf('Mean: %4.2f ms', mn);   
    stdlabel = sprintf('Std Deviation: %4.2f ms', stdv);
    
    n = annotation('textbox',[0.62 0.35 0.1 0.1]);

    set(n,'String',{namelabel, mnlabel,stdlabel});

    %%
    legend('Reflex', 'Two Decision', 'Three Decision');
    axis([150 1200 0 20])
    %[ymin ymax xmin xmax]

    xlabel("Reaction Time (ms)");
    ylabel("Frequency");

    title("Reaction Time Distribution for 1, 2, 3 Decision-Making");