function points = generateRandomPoints(n)
    points = zeros(n, 2);
    for i=1:1:n
        points(i,1) = rand*5 + 2;
        if (rand >= 0.5)
            points(i,1) = -1*points(i,1);
        end
    end
end