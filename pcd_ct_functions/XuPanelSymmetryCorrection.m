function SinogramC=XuPanelSymmetryCorrection(Sinogram,viewNum,detectorPanelWidth,centerIdx,panelIdxBegin,panelIdxEnd,bad_width)
%SinogramC=PanelSymmetryCorrection(Sinogram,viewNum,detectorPanelWidth,centerIdx,panelIdxBegin,panelIdxEnd,bad_width)
AA=mean(Sinogram(:,1:viewNum),2);
SinogramC=Sinogram;
for PanelIdx=[panelIdxBegin:panelIdxEnd]
    tempIdx=[detectorPanelWidth*PanelIdx-bad_width:detectorPanelWidth*PanelIdx+bad_width];
    valTempIdx=interp1(1:5120,AA,centerIdx*2-tempIdx,'linear');
    corrTempIdx=mean(Sinogram(tempIdx,:),2)-valTempIdx';
    SinogramC(tempIdx,:)=Sinogram(tempIdx,:)-repmat(corrTempIdx,[1,size(Sinogram,2)]);
end