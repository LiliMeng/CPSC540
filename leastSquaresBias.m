function [model] = leastSquaresBias(X,y)

% Solve least squares problem (assumes X'*X is invertible)
X=[X,ones(size(X,1),1)];
w = (X'*X)\X'*y;


model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xhat)
Xhat=[Xhat,ones(size(Xhat,1),1)];
w = model.w;
yhat = Xhat*w;
end
