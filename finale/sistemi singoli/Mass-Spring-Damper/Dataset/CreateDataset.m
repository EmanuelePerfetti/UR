%% experiment parameters
sampling_time = 0.01; %for both training and validation dataset
experiment_duration = [5, 5]; %[for training, for validation]
number_of_experiments = [50, 5]; %[for training, for validation]
trainingRefPoints = generateRandomPoints(number_of_experiments(1));
validationRefPoints = generateValidationPoints(number_of_experiments(2));
%% dataset for training ('train') and validation ('val')
initial_condition = [0;0];
train = perform_experiments(sampling_time, experiment_duration(1), number_of_experiments(1), initial_condition, trainingRefPoints);
val = perform_experiments(sampling_time, experiment_duration(2), number_of_experiments(2), initial_condition, validationRefPoints);
%% perform an experiment to create dataset = {t, x, u, y, e, de}
function dataset = perform_experiments(sampling_time, experiment_duration, number_of_experiments, initial_condition, refPoint)
    dataset = cell(1, number_of_experiments);
    for experiment_index = 1 : number_of_experiments
        T = 0 : sampling_time : (experiment_duration-sampling_time);
        [X, U] = torqueFromPD(initial_condition, refPoint(experiment_index, :), experiment_duration, sampling_time);
        Y = X(1:end-1, :);
        X = X(1:end-1, :);
        dataset{experiment_index} = struct('t', double.empty(0,0), 'x', double.empty(0,0), 'u', double.empty, 'y', double.empty(0,0)); 
        dataset{experiment_index}.t = T';
        dataset{experiment_index}.x = X;
        dataset{experiment_index}.u = U;
        dataset{experiment_index}.y = Y;
        %dataset{experiment_index}.e = refPoint(experiment_index, 1:2) - X(:, 1:2);
        %dataset{experiment_index}.de = X(:, 3:4);
    end
end
