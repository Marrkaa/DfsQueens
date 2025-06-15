% Optimizacija, kuri atnaujina lankytu virsuniu masyva
function new = removeVisited(a, b, N, visited)
    pos = ((a - 1) * N + b);
    for i = pos:N
      visited((i - 1) * N + b) = 0;
      visited((a - 1) * N + i) = 0;
    end

    for i = 1:N
        if (a + i <= N && b + i <= N)
            visited(((a + i) - 1) * N + (b + i)) = 0;
        end
        if (a + i <= N && b - i >= 1)
            visited(((a + i) - 1) * N + (b - i)) = 0;
        end
    end
    new = visited;
end