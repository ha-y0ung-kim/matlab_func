function [S, S11 ,S12, S21, S22] = Sparam(Y)
% Function Sparam calculates S parameter from Y parameter
% INPUT Y : Y parameter value
% OUTPUT S, S11, S12, S21, S22
     Z0 = 75;
     delta = (1+Z0.*Y(1,1,:)).*(1+Z0.*Y(2,2,:))-Z0*Z0.*Y(1,2,:).*Y(2,1,:);
     S(1,1,:) = (1-Z0.*Y(1,1,:).*(1+Z0.*Y(2,2,:))+Z0*Z0.*Y(1,2,:).*Y(2,1,:))./delta;
     S(2,2,:) = (1+Z0.*Y(1,1,:).*(1-Z0.*Y(2,2,:))+Z0*Z0.*Y(1,2,:).*Y(2,1,:))./delta;
     S(1,2,:) = -2*Z0.*Y(1,2,:)./delta;
     S(2,1,:) = -2*Z0.*Y(2,1,:)./delta;
     S11 = squeeze(S(1,1,:));
     S12 = squeeze(S(1,2,:));
     S21 = squeeze(S(2,1,:));
     S22 = squeeze(S(2,2,:));
end