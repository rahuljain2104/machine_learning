function [J, grad] = cofiCostFunc(params, Y, R, num_users, num_movies, ...
                                  num_features, lambda)
%COFICOSTFUNC Collaborative filtering cost function
%   [J, grad] = COFICOSTFUNC(params, Y, R, num_users, num_movies, ...
%   num_features, lambda) returns the cost and gradient for the
%   collaborative filtering problem.
%

% Unfold the U and W matrices from params
X = reshape(params(1:num_movies*num_features), num_movies, num_features);
Theta = reshape(params(num_movies*num_features+1:end), ...
                num_users, num_features);

            
% You need to return the following values correctly
J = 0;
X_grad = zeros(size(X));
Theta_grad = zeros(size(Theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost function and gradient for collaborative
%               filtering. Concretely, you should first implement the cost
%               function (without regularization) and make sure it is
%               matches our costs. After that, you should implement the 
%               gradient and use the checkCostFunction routine to check
%               that the gradient is correct. Finally, you should implement
%               regularization.
%
% Notes: X - num_movies  x num_features matrix of movie features
%        Theta - num_users  x num_features matrix of user features
%        Y - num_movies x num_users matrix of user ratings of movies
%        R - num_movies x num_users matrix, where R(i, j) = 1 if the 
%            i-th movie was rated by the j-th user
%
    J = 0.5*sum(sum(((X*Theta' - Y).^2).*R)) ;
    
    

% You should set the following variables correctly:
%
%        X_grad - num_movies x num_features matrix, containing the 
%                 partial derivatives w.r.t. to each element of X
%        Theta_grad - num_users x num_features matrix, containing the 
%                     partial derivatives w.r.t. to each element of Theta
%

    reqularized_term = (lambda/2)*sum(sum(Theta.^2)) + (lambda/2)*sum(sum(X.^2)) ;
    J = 0.5*sum(sum(((X*Theta' - Y).^2).*R)) + reqularized_term  ;



    #calculating differentiation w.r.t theta
    X_kron        = kron(X,ones(1,size(Theta,1))) ;
    X_3d_reshape  = reshape(X_kron,size(Y,1),size(Y,2),size(Theta,2)) ; 
    diff_theta_3d = sum((X*Theta'-Y).*R.*X_3d_reshape) ;
    Theta_grad    = reshape(diff_theta_3d,size(Theta,1),size(Theta,2)) + lambda*Theta ;

    #calculating differentiation w.r.t X
    Theta_kron = kron(Theta,ones(size(X,1),1)) ;
    Theta_3d_reshape = reshape(Theta_kron,size(Y,1),size(Y,2),size(X,2)) ; 
    diff_X_3d = sum((X*Theta'-Y).*R.*Theta_3d_reshape,2) ;
    X_grad = reshape(diff_X_3d,size(X,1),size(X,2)) + lambda*X ;


% =============================================================

grad = [X_grad(:); Theta_grad(:)];

end
