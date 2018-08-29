function [ bb, counts ] = calUCASS( date, LUT_UCASS, log_file )

path = [date, '\', 'LOGGER', '\', log_file];
rawbbs = dlmread(path,',',[3 0 3 14]);
rawcounts = dlmread(path,',',7,0);
rawcounts(:,2:3) = [];
LUT = dlmread(LUT_UCASS,' ');
c = true;
i = 1;
[rlut,clut] = size(LUT);
[~,cbb] = size(rawbbs);
while c == true
    if LUT(30,i) == 0
        LUT(:,i) = [];
        i = i-1;
        [rlut,clut] = size(LUT);
    end
    i = i+1;
    if i > clut
        c = false;
    end
end
bbbuf = zeros(1,cbb);
for i=1:rlut
    for j=1:cbb
        if LUT(i,1) == rawbbs(1,j)
            bbbuf(1,j) = LUT(i,2);
        end
    end
end

bb = bbbuf;
counts = rawcounts;
end

