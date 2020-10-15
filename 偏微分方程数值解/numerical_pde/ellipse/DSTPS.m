function U = DSTPS(N, n)
% Main program. Domain = [0,1]x[0,1]
% Input: N: number of division :N+1 & I=J
%       n: parameter of the function on the RHS
% Output: matrix of U 
    tic 
    % Step 1: 
    h = 1/(N+1);    % step length
    x = h*(1:N);    % vector of interior points
    lambda = 4 * sin(pi*x/2) .* sin(pi*x/2) * (N+1)^2 ;

    [X,Y] = meshgrid(x,x);
    F = f(X,Y, n);
    real_U = u(X,Y, n);  % interior points of U 
    h_matrix = zeros(N,N);
    k_matrix = zeros(N,N);
    h_matrix(1,:) = u(x,0,n)';
    h_matrix(N,:) = u(x,1,n)';
    k_matrix(:,1) = u(0,x,n);
    k_matrix(:,N) = u(1,x,n);
    F = F+ (N+1)*(N+1).*(h_matrix+k_matrix);
    
    % Step 2:
    V = dst(dst(F)')';
    
    % Step 3:
    W = zeros(N-1);
    for i = 1:N
        for j = 1:N
            W(i,j) = (4*h*h*V(i,j)) / (lambda(i)+lambda(j));
        end
    end
    
    % Step 4:
    U = dst(dst(W)')';
    toc
    % Compare the computed result with the true values, and then plot: 
    diff = real_U - U;
    mesh(X,Y,diff),
    % axis ([0 1,0 1 -1.5 2.5]);
    grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
    set(gca,'XTick',0:0.25:1);
    set(gca,'YTick',0:0.25:1);
    % set(gca,'ZTick',-1.5:0.5:2.5);
    colormap jet
    shading interp;colorbar
end 
