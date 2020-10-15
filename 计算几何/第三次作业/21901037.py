import numpy as np
import matplotlib.pyplot as plt
from mpl_toolkits.mplot3d import Axes3D
from scipy.special import comb

def Bernstein(n):
    a = np.zeros([n+1,101])
    for i in range(n+1):
        for j in range(101):
            a[i][j]=comb(n,i) * (j/100) ** i * (1 - j/100) ** (n-i)
    return a

def Draw(Control_Node,x,y,z):
    x1 = Control_Node[:,:, 0]
    y1 = Control_Node[:,:, 1]
    z1 = Control_Node[:,:, 2]
    fig = plt.figure()
    ax = Axes3D(fig)
    ax.scatter(x1, y1, z1,c='b')
    ax.plot_surface(x, y, z, rstride=1, cstride=1, cmap='coolwarm')
    for i in range(3):
        ax.plot(x1[i],y1[i],z1[i],c='r')
        ax.plot(x1[:,i],y1[:,i],z1[:,i],c='r')
    plt.show()

omega=np.array([[1,2,1],[2,2,2],[1,2,1]])
# omega=np.array([[1,2,1],[2,10,2],[1,2,1]])
# omega=np.array([[1,2,1],[2,30,2],[1,2,1]])
# omega=np.array([[1,2,1],[2,100,2],[1,2,1]])

Control_Node=np.array([[[0,-2.5,0],[-1,-1,1],[-2.5,0,0]],[[1,-1,1],[0,0,1.5],[-1,1,1]],[[2.5,0,0],[1,1,1],[0,2.5,0]]])
B = Bernstein(2)
x1 = np.zeros([101,101]) # R的分子
y1 = np.zeros([101,101])
z1 = np.zeros([101,101])
R1 = np.zeros([101,101]) # R的分母
for i in range(3):
    for j in range(3):
        x1 += omega[i][j] * Control_Node[i][j][0] * np.dot(B[i].reshape(101,1),B[j].reshape(1,101))
        y1 += omega[i][j] * Control_Node[i][j][1] * np.dot(B[i].reshape(101, 1), B[j].reshape(1, 101))
        z1 += omega[i][j] * Control_Node[i][j][2] * np.dot(B[i].reshape(101, 1), B[j].reshape(1, 101))
        R1 += omega[i][j] * np.dot(B[i].reshape(101, 1), B[j].reshape(1, 101))
x = x1/R1
y = y1/R1
z = z1/R1
Draw(Control_Node,x,y,z)



