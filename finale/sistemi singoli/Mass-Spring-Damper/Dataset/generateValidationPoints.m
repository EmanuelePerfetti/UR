function points = generateValidationPoints(n)
    points = zeros(n, 2);
    for i=1:1:n
        points(i,1) = i + 1;
        if (rand >= 0.5)
            points(i,1) = -1*points(i,1);
        end
    end
end

