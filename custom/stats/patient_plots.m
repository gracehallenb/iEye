function patient_plots()
%PATIENT_PLOTS Summary of this function goes here
%   Detailed explanation goes here

% COMPARISON PLOTS
% PRIMARY ERROR
% 
colz = [1 1 1 1 1 1 1 1 1 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 2 2 2 2 2 2 2 2];
valz = [1.132 1.351 1.637 1.159 1.578 0.901 1.421 1.319 1.101 1.005 1.037 1.077 1.226 2.160 1.222 2.077 3.619 1.309 0.972 1.411 1.417 1.957 1.022 1.906 2.878];
p1 = [1.005 1.309];
p2 = [1.037	0.972];
p3 = [1.077 1.411];
p4 = [1.226	1.417];
p5 = [2.160	1.957];
p6 = [1.222	1.022];
p7 = [2.077	1.906];
p8 = [3.619 2.878];
col2 = [1.5 2];

figure('Name','No break trials primary error','NumberTitle','off')
plot(colz,valz,'.k','MarkerSize',25);
hold all
plot(col2,p1,'k')
plot(col2,p2,'k')
plot(col2,p3,'k')
plot(col2,p4,'k')
plot(col2,p5,'r')
plot(col2,p6,'k')
plot(col2,p7,'g')
plot(col2,p8,'b')
axis([.5,2.5,.0,4])

% % PRIMARY GAIN

colz = [1 1 1 1 1 1 1 1 1 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 2 2 2 2 2 2 2 2];
valz = [0.970 0.970 0.903 0.942 0.967 0.990 0.920 0.968 0.992 1.042 0.996 0.955 0.923 0.803 0.924 0.835 0.654 1.053 1.006 0.982 1.010 0.887 0.976 0.883 0.739];

p1 = [1.042 1.053];
p2 = [0.996	1.006];
p3 = [0.955 0.982];
p4 = [0.923	1.010];
p5 = [0.803	0.887];
p6 = [0.924	0.976];
p7 = [0.835	0.883];
p8 = [0.654 0.739];
col2 = [1.5 2];

figure('Name','No break trials primary gain','NumberTitle','off')
plot(colz,valz,'.k','MarkerSize',25);
hold all
plot(col2,p1,'k')
plot(col2,p2,'k')
plot(col2,p3,'k')
plot(col2,p4,'k')
plot(col2,p5,'r')
plot(col2,p6,'k')
plot(col2,p7,'g')
plot(col2,p8,'b')
axis([.5,2.5,.5,1.1]) 

% % FINAL ERROR
% 
colz = [1 1 1 1 1 1 1 1 1 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 2 2 2 2 2 2 2 2];
valz = [0.880 1.034 1.204 0.910 1.464 0.688 1.058 1.214 1.017 0.365 0.856 0.662 1.067 1.000 1.178 1.698 1.875 0.487 0.712 0.619 1.302 1.008 0.803 1.453 1.962];

p1 = [0.365 0.487];
p2 = [0.856 0.712];
p3 = [0.662 0.619];
p4 = [1.067 1.302];
p5 = [1.000 1.008];
p6 = [1.178 0.803];
p7 = [1.698 1.453];
p8 = [1.875 1.962];
col2 = [1.5 2];

figure('Name','No break trials final error','NumberTitle','off')
plot(colz,valz,'.k','MarkerSize',25);
hold all
plot(col2,p1,'k')
plot(col2,p2,'k')
plot(col2,p3,'k')
plot(col2,p4,'k')
plot(col2,p5,'r')
plot(col2,p6,'k')
plot(col2,p7,'g')
plot(col2,p8,'b')
axis([.5,2.5,.0,4])

% % Final GAIN

colz = [1 1 1 1 1 1 1 1 1 1.5 1.5 1.5 1.5 1.5 1.5 1.5 1.5 2 2 2 2 2 2 2 2];
valz = [0.980 1.001 0.986 0.966 0.978 1.009 0.978 0.954 0.952 1.013 0.980 1.003 0.953 0.997 0.925 0.887 0.846 1.002 1.006 0.981 1.027 1.000 0.989 0.924 0.849];

p1 = [1.013 1.002];
p2 = [0.980 1.006];
p3 = [1.003 0.981];
p4 = [0.953 1.027];
p5 = [0.997 1.000];
p6 = [0.925 0.989];
p7 = [0.887 0.924];
p8 = [0.846 0.849];
col2 = [1.5 2];

figure('Name','No break trials final gain','NumberTitle','off')
plot(colz,valz,'.k','MarkerSize',25);
hold all
plot(col2,p1,'k')
plot(col2,p2,'k')
plot(col2,p3,'k')
plot(col2,p4,'k')
plot(col2,p5,'r')
plot(col2,p6,'k')
plot(col2,p7,'g')
plot(col2,p8,'b')
axis([.5,2.5,.5,1.1]) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SIGNIFANCE TESTING AND PLOTS %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % PRIMARY ERROR

grp = {'control' 'control' 'control' 'control' 'control' 'control' 'control' 'control' 'control' 'dlpfcc' 'dlpfcc' 'dlpfcc' 'dlpfcc' 'fefc' 'dlpfcc' 'dlpfcc' 'fefc' 'dlpfci' 'dlpfci' 'dlpfci' 'dlpfci' 'fefi' 'dlpfci' 'dlpfci' 'fefi'};
valz = [1.132 1.351 1.637 1.159 1.578 0.901 1.421 1.319 1.101 1.005 1.037 1.077 1.226 2.160 1.222 2.077 3.619 1.309 0.972 1.411 1.417 1.957 1.022 1.906 2.878];
cont = [1.132 1.351 1.637 1.159 1.578 0.901 1.421 1.319 1.101];
dlpfci = [1.005 1.037 1.077 1.226 1.222 2.077];
fefi = [2.160 3.619];
dlpfcc = [1.309 0.972 1.411 1.417 1.022 1.906];
fefc = [1.957 2.878];

p = kruskalwallis(valz,grp)
pdlpfci = ranksum(cont,dlpfci)
pdlpfcc = ranksum(cont,dlpfcc)
pfefi = ranksum(cont,fefi)
pfefc = ranksum(cont,fefc)

% figure('Name','Primary error','NumberTitle','off')
% meds = [median(cont); median(dlpfci); median(dlpfcc); median(fefi); median(fefc)];
% errs = [iqr(cont); iqr(dlpfci); iqr(dlpfcc); iqr(fefi); iqr(fefc)];
% h = barwitherr(errs,meds);

figure('Name','Primary error','NumberTitle','off')
gp = [1 1 1 1 1 1 1 1 1 2 2 2 2 4 2 2 4 3 3 3 3 5 3 3 5];
boxplot(valz,gp,'whisker',5,'plotstyle','compact');
ylim([0 4.5])

% % PRIMARY GAIN

grp = {'control' 'control' 'control' 'control' 'control' 'control' 'control' 'control' 'control' 'dlpfcc' 'dlpfcc' 'dlpfcc' 'dlpfcc' 'fefc' 'dlpfcc' 'dlpfcc' 'fefc' 'dlpfci' 'dlpfci' 'dlpfci' 'dlpfci' 'fefi' 'dlpfci' 'dlpfci' 'fefi'};
valz = [0.970 0.970 0.903 0.942 0.967 0.990 0.920 0.968 0.992 1.042 0.996 0.955 0.923 0.803 0.924 0.835 0.654 1.053 1.006 0.982 1.010 0.887 0.976 0.883 0.739];
cont = [0.970 0.970 0.903 0.942 0.967 0.990 0.920 0.968 0.992];
dlpfci = [1.042 0.996 0.955 0.923 0.924 0.835];
fefi = [0.803 0.654];
dlpfcc = [1.053 1.006 0.982 1.010 0.976 0.883];
fefc = [0.887 0.739];

p = kruskalwallis(valz,grp)
pdlpfci = ranksum(cont,dlpfci)
pdlpfcc = ranksum(cont,dlpfcc)
pfefi = ranksum(cont,fefi)
pfefc = ranksum(cont,fefc)

figure('Name','Primary gain','NumberTitle','off')
gp = [1 1 1 1 1 1 1 1 1 2 2 2 2 4 2 2 4 3 3 3 3 5 3 3 5];
boxplot(valz,gp,'whisker',5,'plotstyle','compact');
ylim([.5 1.1])

% % FINAL ERROR
% 
grp = {'control' 'control' 'control' 'control' 'control' 'control' 'control' 'control' 'control' 'dlpfcc' 'dlpfcc' 'dlpfcc' 'dlpfcc' 'fefc' 'dlpfcc' 'dlpfcc' 'fefc' 'dlpfci' 'dlpfci' 'dlpfci' 'dlpfci' 'fefi' 'dlpfci' 'dlpfci' 'fefi'};
valz = [0.880 1.034 1.204 0.910 1.464 0.688 1.058 1.214 1.017 0.365 0.856 0.662 1.067 1.000 1.178 1.698 1.875 0.487 0.712 0.619 1.302 1.008 0.803 1.453 1.962];

p = kruskalwallis(valz,grp)

figure('Name','Final error','NumberTitle','off')
gp = [1 1 1 1 1 1 1 1 1 2 2 2 2 4 2 2 4 3 3 3 3 5 3 3 5];
boxplot(valz,gp,'whisker',5,'plotstyle','compact');
ylim([0 4.5])

% % Final GAIN

grp = {'control' 'control' 'control' 'control' 'control' 'control' 'control' 'control' 'control' 'dlpfcc' 'dlpfcc' 'dlpfcc' 'dlpfcc' 'fefc' 'dlpfcc' 'dlpfcc' 'fefc' 'dlpfci' 'dlpfci' 'dlpfci' 'dlpfci' 'fefi' 'dlpfci' 'dlpfci' 'fefi'};
valz = [0.980 1.001 0.986 0.966 0.978 1.009 0.978 0.954 0.952 1.013 0.980 1.003 0.953 0.997 0.925 0.887 0.846 1.002 1.006 0.981 1.027 1.000 0.989 0.924 0.849];

p = kruskalwallis(valz,grp)

figure('Name','Final gain','NumberTitle','off')
gp = [1 1 1 1 1 1 1 1 1 2 2 2 2 4 2 2 4 3 3 3 3 5 3 3 5];
boxplot(valz,gp,'whisker',5,'plotstyle','compact');
ylim([.5 1.1])

end

