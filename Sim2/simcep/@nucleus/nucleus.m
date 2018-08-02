%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NUCLEUS Class constructor for cytoplasm objects
% Input:  (1) coordinates for the objects
%         (2) index 
%         (3) radius of cell
%         (4) shape parameters
%         (5) texture parameters
% Output: (1) new nucleus object
%
% (C) 22.2.2007 Antti Lehmussola
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function c = nucleus(coords,ind,radius,shape_param,text_param)

S = shape(shape_param(1),shape_param(2),radius);

T = texture(size(S),text_param(1),text_param(2),text_param(3),text_param(4));

% T=zeros(size(S));
% for i = 1:size(T,1)
%     for j = 1:size(T,2)
%         if S(i,j)>0
%             pix = random('poisson',text_param(4)*256);
%             if pix > 256
%                 pix = 256;
%             end
%             T(i,j) = S(i,j)* pix;
%         end
%     end
% end
% T = T./256;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% All information inserted in the features struct are available through
% output of SIMCEP. Good place to store information for validation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

features.coords = coords;
features.area = sum(S(:));

a = cellobj(coords,ind,S,T.*S,features);
c.param1 = 0;
c = class(c,'nucleus',a);

