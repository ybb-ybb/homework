function y=downspl(x);
% 函数 Y=DOWMSPL(X) 对输入序列进行下抽样，输出序列 Y。
% 下抽样是对输入序列取其偶数位，舍弃奇数位。例如 x=[x1,x2,x3,x4,x5]，则 y=[x2,x4].

N=length(x);        % 读取输入序列长度
M=floor(N/2);        % 输出序列的长度是输入序列长度的一半（带小数时取整数部分）
i=1:M;
y(i)=x(2*i);
