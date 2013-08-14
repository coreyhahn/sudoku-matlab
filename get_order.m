function order = get_order(parent)


x1 = reshape(parent(13:end),9,9);
% x1 = sign(x1);
y1 = []; %row
y2 = []; %col
y3 = []; % block
for n = 1:9
    y1(n).c = nonzeros(x1(n,:));
    y2(n).c = nonzeros(x1(:,n));
end
p = 1;
for m = 1:3:9
    for n = 1:3:9
        t1 = x1(n:n+2,m:m+2);
        y3(p).c = nonzeros(t1);
        p = p + 1;
    end
end

order = zeros(1,81);
p1 = 1;
p2 = 1;
p3 = 1;
for n = 1:81
    t1 = union(y1(p1).c, y2(p2).c);
    order(n) = length(unique(union(y3(p3).c, t1)));
    
    p1 = p1+1;
    
    if p1 == 4
        p3 = p3+1;
    elseif p1 == 7
        p3 = p3+1;
    elseif p1 == 10 && mod(p2,3) ~= 0
        p3 = p3 - 2;
    elseif p1 == 10 && mod(p2,3) == 0
        p3 = p3 + 1;
    end
    
    if p1 > 9
        p1 = 1;
        p2 = p2 +1;
    end

end

lock1 = find(parent(13:end) ~= 0);
order(lock1) = 10;
order = [order' (1:81)'];
order = sortrows(order,[-1]);

order = order(:,2)';








