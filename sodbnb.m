% function x= sodbnb(x)


tree1 = zeros(1,12+81);
tree1(1) = 1;
tree1(13:end) = sod0002;
disp(reshape(tree1(1,13:end),9,9))


while true
    c1 = find(tree1(:,1) == 1, 1, 'last');
    childhold = zeros(c1*9,93);
    order1 = get_order(tree1(1,:));
    for n = 1:c1
        [children] = create_children(tree1(n,:), tree1(n,2)+1, order1);
        childhold((n-1)*9+(1:9),:) = children;
        tree1(n,1) = -1;
    end
    ind1 = find(childhold(:,1) == -1);
    childhold(ind1,:) = [];
    tree1 = childhold;
    disp([tree1(1,2) size(tree1,1)]);
    
%     if tree1(1,2) == 34
%         continue;
%     end
    if length(find(tree1(1,13:end) == 0)) == 0
        break;
    end
end
disp(reshape(tree1(1,13:end),9,9))




