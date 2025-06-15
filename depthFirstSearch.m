function finalBoard = depthFirstSearch(G, startNode, board, N)
    tempBoard = createChessBoard(N, N); % Sukuriama laikina lenta tikrinimui, ar saugu deti
    numNodes = numel(G);
    visited = false(1, numNodes);
    numBoards = N; % Lentu, kurios saugo kiekvienos karalienes pozicija, skaiciaus kintamasis
    boards = zeros(N, N, numBoards);  % Lentu masyvas, kuriame saugomos karalieniu poziciju lentos
    
    visited = optimisation(startNode, startNode, N, visited);
    dfsRecursive(startNode, 1, visited, 0);

    function dfsRecursive(node, count, visited, isPlaced)
        temp = count;
        visited(node) = true; % Pazymime, jog einamoji virsune bus aplankyta
        [i, j] = findIandJ(node, N, N); % Kreipiames i metoda, kuris suranda eilute ir stulpeli einamosios virsunes
        placedQueenBoard = boards(:, :, count); % Laikina lenta skirta patikrinimui
        
        if(checkIfSafe(tempBoard, i, j, N) == 1 && placedQueenBoard(i, j) ~= count) % Tikriname, ar sioje pozicijoje yra saugu deti karaliene
            tempBoard(i, j) = 1; % Tikrinimui skirtoje lentoje padedame karaliene
            board(i, j) = count; % Tikroje lentoje padedame karaliene
            count = count + 1;
            isPlaced = 1; % Kintamasis, kuris nurodo ar karaliene buvo padeta sioje virsuneje
            visited = optimisation(i, j, N, visited); % Optimizavimui skirtas metodas, kuris atnaujina lankytu virsuniu masyva
        end

        % Kartais atsitinka taip, kad dfsas atsiduria kampe ir reikia
        % padaryti sita patikrinima
        if(temp ~= count)
            visited = false(1, numNodes);
            for j = 1:1:count-1
                [row, col] = find(board == j);
                visited = optimisation(row, col, N, visited);
            end
            visited(node) = true;
        end

        % Einame perlankytu virsuniu masyva ir jeigu tokia yra, pradedame nuo jos
        if any(visited == 0)
            for r = 1:1:length(visited)
                if(visited(r) == 0)
                    dfsRecursive(r, count, visited, isPlaced);
                    return
                end
            end
        end

        % Jeigu karaliene buvo nepadeta arba ne visos padetos, atliekame atitinkamus
        % veiksmus
        if(count ~= N + 1 || isPlaced == 0) 
            for o = N-1:-1:count
                boards(:, :, o) = zeros(N, N); % Istriname is pagalbiniu lentu praeitos karalienes pozicija
            end          
            
            % Randame eilute ir stulpeli praeitos karalienes
            [row, col] = find(board == count - 1);
            m = row * N - N + col;
            
            % Pasizymime pozicija, kurioje negalime deti praeitos
            % karalienes
            boards(row, col, count - 1) = count - 1;

            board(row, col) = 0; % Is lentos istriname praeita karaliene
            tempBoard(row, col) = 0; % Is pagalbines lentos istriname praeita karaliene
            
            % Pakoreguojame lankytu virsuniu masyva, nes viena karaliene
            % nuememe
            visited = removeVisited(row, col, N, visited);
            % Vel kreipiames i metoda ir siunciame praeita karaliene
            dfsRecursive(m, count - 1, visited, 0);
        else
            finalBoard = tempBoard; % Uždavinys išspręstas!
            return
        end
    end
end