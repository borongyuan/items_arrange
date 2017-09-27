function output = averagingfilter(signal,dotnum)
    len = length(signal);
    halfnum = floor(dotnum/2)+1;
    output(1:halfnum-1) = signal(1:halfnum-1);
    for n = halfnum:len-halfnum+1
        output(n) = sum(signal(n-halfnum+1:n-halfnum+dotnum))/dotnum;
    end
    output(len-halfnum+2:len) = signal(len-halfnum+2:len);
end