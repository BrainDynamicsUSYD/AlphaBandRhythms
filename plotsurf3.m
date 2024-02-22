function plotsurf3(surf,zvals,ti)

fig=figure
%PLOT
    if nargin < 2
    trisurf(surf.faces,surf.vertices(:,1),surf.vertices(:,2),surf.vertices(:,3));
    else
    trisurf(surf.faces,surf.vertices(:,1),surf.vertices(:,2),surf.vertices(:,3),zvals);
    end




%VIEW
shading interp; 
grid off;
camlight; 
%lighting phong; 
%ax=axes;
lighting gouraud;
axis tight;
material shiny; 
view(-95,0);
% daspect([1 1 1]);
% view(3)
% axis image; 
 axis off;
% axis vis3d
% axis on
%headlight; 
%lighting gouraud; 
background='white';
whitebg(gcf,background);
set(gcf,'Color',background,'InvertHardcopy','off');


%COLOURMAP

r = [1 0 0];       %# start
w = [1 1 1];    %# middle
b = [0 0 1];       %# end
%# colormap of size 64-by-3, ranging from blue -> white -> red
%top = zeros(15,3);bottom=zeros(15,3);
c1 = zeros(32,3); c2 = zeros(32,3);
for i=1:3
    %top(:,i)=b(i);
    c1(:,i) = linspace(b(i), w(i), 32);
    c2(:,i) = linspace(w(i), r(i), 32);
    %bottom(:,i)=r(i);
end
c = [c1(1:end-1,:);c2];

%colormap(c);
colormap(jet)
%colormap(gray)

%caxis([min(zvals) max(zvals)])

%title(ti)

dcm_obj = datacursormode(fig);
set(dcm_obj,'UpdateFcn',{@updatecursorindex,surf})


end