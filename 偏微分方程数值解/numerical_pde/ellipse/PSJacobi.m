function U = PSJacobi(N, n, stopThreshold)
% Jacobi iteration to solve Poisson equation 
% Main program. Domain = [0,1]x[0,1]
% Input: N: number of division :N+1 & I=J
%       n: parameter of the function on the RHS
    tic
    h = 1/N;
    x = h*(0:N);
    [X,Y] = meshgrid(x,x);
    F = h*h* f(X,Y, n);
    real_U = u(X,Y, n);
    U = zeros(N+1);
    U(1,:) = real_U(1,:);
    U(N+1,:) = real_U(1,:);
    U(:,1) = real_U(:,1);
    U(:,N+1) = real_U(:,N+1);
    V = U;
    flag = 1;
    while flag > stopThreshold
        for i = 2:N
            for j = 2:N
                V(i,j) = (U(i-1,j)+U(i+1,j)+U(i,j-1)+U(i,j+1)+F(i,j))/4;
            end
        end
        flag = norm(V-U, 'fro');
        U = V;
    end
    toc 
    diff = real_U - U;
    mesh(X,Y,diff),
    grid on;set(gca,'GridLineStyle',':','GridColor','k','GridAlpha',1);
    set(gca,'XTick',0:0.25:1);
    set(gca,'YTick',0:0.25:1);
    colormap jet;
    shading interp;colorbar
    max_error = max(max(diff))
end     