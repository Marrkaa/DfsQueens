% Tikrinimas ar saugu ideti karaliene
function isSafe = checkIfSafe(G, a, b, N)
    if any(G(a, :) == 1) || any(G(:, b) == 1)
        isSafe = false;
        return
    end

    for i = 1:N
        if (a + i <= N && b + i <= N && G(a + i, b + i) == 1) || ...
           (a - i >= 1 && b - i >= 1 && G(a - i, b - i) == 1) || ...
           (a + i <= N && b - i >= 1 && G(a + i, b - i) == 1) || ...
           (a - i >= 1 && b + i <= N && G(a - i, b + i) == 1)
            isSafe = false;
            return
        end
    end
    isSafe = true;
end
