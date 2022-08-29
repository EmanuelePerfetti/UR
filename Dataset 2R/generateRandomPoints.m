function points = generateRandomPoints(n)
    points = zeros(n, 4);
    for i=1:1:n
        points(i,1) = rand*pi;
        if (rand >= 0.5)
            points(i,1) = -1*points(i,1);
        end
        points(i,2) = rand*pi;
        if (rand >= 0.5)
            points(i,2) = -1*points(i,2);
        end
    end
end