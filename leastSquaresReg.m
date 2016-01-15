function [model]=leastSquaresReg(X,y,lambda)
[n,d]=size(X);


% Solve least squares problem (assumes X'*X is invertible)
X=[X,ones(size(X,1),1)];
w = (X'*X+lambda*eye(d+1))\X'*y;


model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xhat)
Xhat=[Xhat,ones(size(Xhat,1),1)];
w = model.w;
yhat = Xhat*w;
end
