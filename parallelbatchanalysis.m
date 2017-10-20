PathName = uigetdir;

listing = dir([PathName '/Pos*']);

for i = 1:length(listing)
    num(i) = str2double(listing(i).name(4:end));
end

keep = num <30;

num = num(keep);


parfor i = 1:length(num)
    
    fprintf('Analyzing Field %d\r', num(i))
    
    hybnum =  load_for_parfor(PathName, num(i));
    
    %disp('Correcting Illumination')
    
    %hybnumcor = correctbackground(hybnum, corrections);
    
    [ foundbarcodes, points, copynumfinal, rawfound, hybnum, copynumfinalsum, totdropped ] = BarcodeNoMiji_v5( channels, hybnum, hyb, multiplier, HCRorFISH, barcodekey, PathName, num(i), 'roi', [], [],[],6,1,1,0, 0 );
    %( channels, hybnum, hyb, multiplier, HCRorFISH, barcodekey, PathName, posnum, segmentation, regvec, mask,mask2,radius,conthresh,alloweddiff,scaledonoff, debug )
    
    fprintf('Correcting Field %d\r', num(i))
    
    [dotlocations,copynumfinalrevised,PosList] = PointLocations(PathName,num(i),hyb, length(channels), points, foundbarcodes,barcodekey,copynumfinal,[0 0],6);
    %PosList = FirstHybPoints(PathName,num(i),length(channels), points, foundbarcodes,barcodekey,copynumfinal,regvec{i},radius)
    
    [seeds] = numseeds(PosList,dotlocations);
    
    save_for_parfor(PathName,num(i),foundbarcodes,points,copynumfinal,copynumfinalsum,totdropped,rawfound,PosList,dotlocations,copynumfinalrevised,seeds)

end

%save([PathName '\3315runVariables.mat'])

disp('Analysis Complete')
