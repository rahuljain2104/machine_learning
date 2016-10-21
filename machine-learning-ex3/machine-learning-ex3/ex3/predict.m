function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% Add ones to the X data matrix
X = [ones(m, 1) X];

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

          % layer 1 -- input layer
          a1 = X ;
          
          % layer 2 -- hidden layer
          z2 = a1*Theta1' ;
          z2 = [z2] ;
          a2 = [ones(m,1) sigmoid(z2)];

          % layer 3 -- output layer
          z3 = a2*Theta2' ;
          H_Theta = sigmoid(z3) ;
          
    [maxValue p] = max(H_Theta) ;
%for i = 1:m

%  [maxValue p(i,1)] = max(sigmoid(Theta2*[ones(1,1); sigmoid(Theta1*X(i,:)']))) ;

%end

%index = p!=10 ;

%p = p.*index ;
%figure();
%plot(p)


% =========================================================================


end
