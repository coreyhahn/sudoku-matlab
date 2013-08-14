function [children] = create_children(parent, ind1, order1)

game1 = parent(13:end);

if game1(order1(ind1)) ~= 0
    children = [-1 ind1 0 -ones(1,9) game1];
    children = repmat(children,9,1);
    children(1,1) = 1;
    
    return;
end

children = zeros(9,size(parent,2));
children(:,1) = 1;
children(:,2) = ind1;
children(:,13:end) = repmat(parent(13:end),9,1);
children(:,12+order1(ind1)) = 1:9;

for n = 1:9
    if rowtest(children(n,13:end))
        children(n,1) = -1;
    end
    if coltest(children(n,13:end))
        children(n,1) = -1;
    end
    if blotest(children(n,13:end))
        children(n,1) = -1;
    end
end
return
end

function test = rowtest(child)

    x1 = reshape(child, 9,9);
    test = false; %
    for n = 1:9
%         nz1 = length(nonzeros(x1(n,:)));
%         un1 = length(unique(x1(n,:)));
        ze1 = length(find(x1(n,:) == 0));
%         if ze1 == 0 && sum(x1(n,:)) == 45 %un1 == 9
%             continue;
        if length(find(diff(sort(nonzeros(x1(n,:)))) == 0)) ~= 0 %un1-nz1 ~= 1
            test = true;
            return
        end
    end

end

function test = coltest(child)

    x1 = reshape(child, 9,9)';
    test = false; %
    for n = 1:9
%         nz1 = length(nonzeros(x1(n,:)));
%         un1 = length(unique(x1(n,:)));
        ze1 = length(find(x1(n,:) == 0));
%         if ze1 == 0 && sum(x1(n,:)) == 45 %un1 == 9
%             continue;
        if length(find(diff(sort(nonzeros(x1(n,:)))) == 0)) ~= 0 %un1-nz1 ~= 1
            test = true;
            return
        end
    end

end

function test = blotest(child)

    x1 = reshape(child, 9,9);
    test = false; %
    for n = 1:3:9
        for m = 1:3:9
            t1 = x1(n:n+2,m:m+2);
            t1 = t1(:);
%             nz1 = length(nonzeros(t1));
%             un1 = length(unique(t1));
            ze1 = length(find(t1 == 0));
%             if ze1 == 0 && sum(t1) == 45 %un1 == 9
%                 continue;
            if length(find(diff(sort(nonzeros(t1))) == 0)) ~= 0 %un1-nz1 ~= 1
                test = true;
                return
            end
        end
    end

end



