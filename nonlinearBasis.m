function [model] = nonlinearBasis(X,y)

n=size(X,1);
for i=[1:n]
    for j=[1:3]
        tmp(i,j)=X(i)^j;
    end
end 

tmp1=sin((2*pi/1.25).*X);


X1=[ones(size(X,1),1),tmp,tmp1];

display(X1);
w = (X1'*X1)\X1'*y;
display(w);
model.w = w;
model.predict = @predict;

end

function [yhat] = predict(model,Xhat)
n=size(Xhat,1);
for i=[1:n]
    for j=[1:3]
        tmp2(i,j)=Xhat(i)^j;
    end
end 
tmp3=sin((2*pi/1.25).*Xhat);
Xhat=[ones(size(Xhat,1),1),tmp2,tmp3];
w = model.w;
yhat = Xhat*w;
end
