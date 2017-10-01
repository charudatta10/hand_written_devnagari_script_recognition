function opt=it_perceptron(input_vector_train,output_vector_train,input_vector_test)
input =input_vector_train;
desired_out =output_vector_train;
[numPat, numIn] = size(input); 
[r, numOut]=size(desired_out);
bias = -1; coeff = 0.7; a = -2;  b= 2; 
weights = a + (b-a).*rand(numIn,numOut+1);
iterations = 200;
for i = 1:iterations
out = zeros(numPat,numOut);
for j = 1:1:numPat 
for k = 1:1:numOut 
y=bias*weights(k,numOut+1); 
for L = 1:1:numIn 
y = y+input(j,L)*weights(L,k);
end
out(j,k) = 1/(1+exp(-y));
delta = desired_out(j,k)-out(j,k);
for L=1:numIn
weights(L,k)=weights(L,k)+coeff*input(j,L)*delta;
end
weights(k,numOut+1)=weights(k,numOut+1)+coeff*bias*delta; 
end
end
end
input1 = input_vector_test;
[numPat, numIn] = size(input1); 
out1 = zeros(numPat,numOut);
for j = 1:numPat 
for k = 1:numOut
y1=bias*weights(k,numOut+1); 
for L = 1:numIn 
y1 = y1+input1(j,L)*weights(L,k); 
end
out1(j,k) = 1/(1+exp(-y1));
end
end
out2=int8(out1);
out3=int2str(out2);
out4=bin2dec(out3);
opt=char(out4');
end