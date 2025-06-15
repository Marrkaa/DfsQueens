clc; clear; close all
tic;
N = 8; % Sachmatu lentos dydis
[G, A] = adjacencyList(N, N); % Sukuriamas lentos pavidalo grafas
board = createChessBoard(N, N); % Sukuriamas NxN dydzio sachmatu lenta

for i = 1:N^2
    finalBoard = depthFirstSearch(G, i, board, N); % Kreipiamasi i dfs metoda, kuris grazina isdeliotas karalienes
    tempArr(:, :, i) = finalBoard;
end

helper = 0;
for i = 1:N
    for j = 1:N
        if tempArr(i, j, 1) == 1
            helper = helper + 1;
            nodeArr(helper) = ((i - 1) * N + j);
        end
    end
end

h = plot(A);
title("GUI");
highlight(h, [nodeArr])
highlight(h, [nodeArr],'NodeColor','red')

answers = tempArr(:, :, 1);
l = 1;
check = false;

for i = 2:N^2
    for k = 1:l
        if isequal(tempArr(:, :, i), answers(:, :, k))
            check = true;
            break
        else
            check = false;
        end
    end
    if ~check
        l = l + 1;
        answers(:, :, l) = tempArr(:, :, i);
    end
end

disp('Darbas baigtas, visi galimi sprendimo būdai:');
answers
sec = toc;
disp('Darbo laikas sekundemis:');
sec