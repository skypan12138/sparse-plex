classdef ChongMNISTDigits
% This class is a wrapper for the MNIST_SC.mat generated by
% run_MNIST.m script in the package provided by Chong You 
% C. You, D. Robinson, R. Vidal, Scalable Sparse Subspace Clustering by 
% Orthogonal Matching Pursuit, CVPR 2016.
% https://sites.google.com/site/chongyou1987/

properties
end
properties(SetAccess=private)
    % The data set
    Y
    % The labels
    labels
    % the digits
    digits
    % cluster sizes
    cluster_sizes
end

properties(Access=private)
end

methods
    function self = ChongMNISTDigits()
        root = spx.data_dir;
        file_path = fullfile(root, 'mnist', 'MNIST_SC.mat');
        fprintf('Loading data\n');
        tstart = tic;
        load(file_path, 'MNIST_SC_DATA', 'MNIST_LABEL');
        elapsed = toc(tstart);
        fprintf('Data Loading complete in %0.2f seconds.\n', elapsed);
        self.Y = MNIST_SC_DATA;
        % label as a row vector
        self.labels = MNIST_LABEL';
        self.digits = 0:9;
        % the cluster sizes
        self.cluster_sizes = zeros(1, 10);
        for i=1:10
            digit = self.digits(i);
            cluster_size = sum(self.labels == digit);
            self.cluster_sizes(i) = cluster_size;
        end
    end

    function result = num_total_samples(self)
        result = size(self.Y, 2);
    end

    function result = num_total_features(self)
        result = size(self.Y, 1);
    end

    function result = digit_indices(self, i)
        result = find(self.labels == i);
    end

    function [Y, labels] = digit_samples(self, i)
        columns = self.labels == i;
        Y = self.Y(:, columns);
        labels = self.labels(columns);
    end

    function  [Y, labels] = selected_samples(self, columns)
        Y = self.Y(:, columns);
        labels = self.labels(columns);
    end

end

end