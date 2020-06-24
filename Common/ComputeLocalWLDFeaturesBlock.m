function [LocalWLDfeatues, Lables] = ComputeLocalWLDFeaturesBlock(data1, data2, param)

nr1 = size(data1, 1);
nr2 = size(data2, 1);
nr  = nr1+nr2;
fprintf('Creating WLD matrix\n');
% ---------------------------------------
% Set-up the parameters for WLD histogram
% ---------------------------------------
blockNum = param.NumBlock;  % Number of blocks 
T = param.T;   % Number of orientations :=> 4, 6, 8, 12, 16
M = param.M;   % Levels of differential excitation :=> 4, 6, 8
S = param.S;   % The number of bins in each excitation level :=> 5, 10, 15, 20
c = 0;         % Initialize the class counter        
% ---------------------------------------
% Reserve Space for WLD Histograms
% ---------------------------------------
WLDsize    = 3*blockNum*blockNum*T*M*S;
nc = WLDsize*2;
LocalWLDfeatues = zeros(nc, nr);
%%
%%==========================================
LocalWLDfeatues1 = zeros(WLDsize, nr);
LocalWLDfeatues2 = zeros(WLDsize, nr);
%%==========================================
%%
Lables     = zeros(1,nr)-1; 
% ---------------------------------------
% Creating WLD Histogram matrix
% ---------------------------------------
% For Data1
for i = 1 : nr1
    nameIm = char(data1(i));
    if(strcmp(nameIm(1, 1:3), 'Au_' )); Lables(1, i) = 1; end; % ROI_Authentic:-1, ROI_Spliced:1

    im = imread (char(data1(i)));
    YCBCR = rgb2ycbcr(im);
    Cb= YCBCR(:,:,2);
    Cr= YCBCR(:,:,3);
    LocalWLDfeatues1(:,i)=LocalWLDFeature(Cb, param); 
    LocalWLDfeatues2(:,i)=LocalWLDFeature(Cr, param);
    LocalWLDfeatues(1:WLDsize,i)=LocalWLDfeatues1(:,i);
    LocalWLDfeatues(WLDsize+1:2*WLDsize,i)=LocalWLDfeatues2(:,i);
    clear im;
end;

% For Data2
for i = nr1+1 : nr
    nameIm = char(data2(i-nr1));
    if(strcmp(nameIm(1, 1:3), 'Sp_')  ); Lables(1, i) = 1; end; % ROI_Authentic:-1, ROI_Spliced:1
    im = imread (char(data2(i-nr1)));
    YCBCR = rgb2ycbcr(im);
    Cb= YCBCR(:,:,2);
    Cr= YCBCR(:,:,3);
    LocalWLDfeatues1(:,i)=LocalWLDFeature(Cb, param); 
    LocalWLDfeatues2(:,i)=LocalWLDFeature(Cr, param);
    LocalWLDfeatues(1:WLDsize,i)=LocalWLDfeatues1(:,i);
    LocalWLDfeatues(WLDsize+1:2*WLDsize,i)=LocalWLDfeatues2(:,i);
    clear im;

end;

