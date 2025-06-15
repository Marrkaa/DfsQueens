function [adjacentNodes, A] = adjacencyList(rows, cols)
    % Sukuria grafa su briaunomis vertikaliai, horizontaliai ir istrizai
    numNodes = rows * cols;
    adjacentNodes = cell(numNodes, 1);
    A = graph;
    A = addnode(A, numNodes);
    for i = 1:rows
        for j = 1:cols
            node = (i - 1) * cols + j;
    
            for m = -1:1
                for n = -1:1
                    if m ~= 0 || n ~= 0
                        neighbor_i = i + m;
                        neighbor_j = j + n;
    
                        if neighbor_i >= 1 && neighbor_i <= rows && neighbor_j >= 1 && neighbor_j <= cols
                            neighbor = (neighbor_i - 1) * cols + neighbor_j;

                            adjacentNodes{node} = [adjacentNodes{node}, neighbor];
                            adjacentNodes{neighbor} = [adjacentNodes{neighbor}, node];

                            if ~ismember(neighbor, neighbors(A, node))
                            A = addedge(A, node, neighbor);
                            end
                        end
                    end
                end
            end
        end
    end
    
    % Salinami duplikatai
    for node = 1:numNodes
        adjacentNodes{node} = unique(adjacentNodes{node});
    end
end
