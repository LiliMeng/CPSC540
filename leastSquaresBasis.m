function [model] = leastSquaresBasis(X,y,deg)

n=size(X,1);
for i=[1:n]
    for j=[1:deg]
        X(i,j)=X(i)^j;
    end
end 

X=[ones(size(X,1),1),X];
w = (X'*X)\X'*y;
model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xhat,deg)
n=size(Xhat,1);
for i=[1:n]
    for j=[1:deg]
        Xhat(i,j)=Xhat(i)^j;
    end
end 

Xhat=[ones(size(Xhat,1),1),Xhat];
w = model.w;
yhat = Xhat*w;
end
