% Optimizacija, kuri atnaujina lankytu virsuniu masyva
function new = optimisation(a, b, N, visited)
    for i = 1:N
      visited((i - 1) * N + b) = 1;
      visited((a - 1) * N + i) = 1;
    end

    for i = 1:N
        if (a + i <= N && b + i <= N)
            visited(((a + i) - 1) * N + (b + i)) = 1;
        end
        if (a - i >= 1 && b - i >= 1)
            visited(((a - i) - 1) * N + (b - i)) = 1;
        end
        if (a + i <= N && b - i >= 1)
            visited(((a + i) - 1) * N + (b - i)) = 1;
        end
        if (a - i >= 1 && b + i <= N)
            visited(((a - i) - 1) * N + (b + i)) = 1;
        end
    end
    new = visited;
end