function idx = findClosestcentroidsroids(X, centroids)
%FINDCLOSESTcentroidsROIDS computes the centroidsroid memberships for every example
%   idx = FINDCLOSESTcentroidsROIDS (X, centroidsroids) returns the closest centroidsroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroidsroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

#flattening centroids
centroids = centroids'(:)';

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroidsroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroidsroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
  #creating vertical copies of centroids
  centroidser_Kron = kron(centroids,ones(size(X,1), 1)) ;

  #creating multiple copies of X side by side(horizontal)
  X_Kron = kron(ones(1,K),X) ; 

  mat = (X_Kron - centroidser_Kron).^2 ;

  dist = zeros(size(X,1),K) ;
  
  for j = 1:2:2*K-1
      dist(:,(j+1)/2) = [mat(:,j)+mat(:,j+1)] ;
  end

 [val,index] = min(dist') ;
 
 idx = index ;
% =============================================================

end

