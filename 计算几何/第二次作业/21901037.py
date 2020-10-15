import matplotlib.pyplot as plt
import numpy as np

def BaseFunction(n ,NodeVector):
    '''计算B样条基函数'''
    N_0 = [] # compute Ni_0
    for i in range(len(NodeVector)-1):
        N = np.zeros(100)
        for j in range(100):
            if (j < NodeVector[i+1] * 100) and (j >= NodeVector[i] * 100):
                N[j] = 1.
            else:
                N[j] = 0.
        N_0.append(N)

    if n == 0:
        return N_0

    else:
        N_1 = []
        ls0 , ls1 = Coefficient(n,NodeVector)
        for i in range(len(NodeVector)-n-1):
            N =ls0[i] * BaseFunction(n-1,NodeVector)[i] + ls1[i] * BaseFunction(n-1,NodeVector)[i+1]
            N_1.append(N)
        return N_1


def Coefficient(p , NodeVector):
    '''计算(t - t_i) / (t_{i + p} - t_i) 和 (t_{i+p+1} - t) / (t_{i + p + 1}-t_{i + 1})'''
    lst0 = []
    lst1 = []

    for i in range(len(NodeVector) - p):
        N = np.zeros(100)
        length0 = NodeVector[i+p] - NodeVector[i] # 规定0/0=0
        if length0 ==0:
            length0 = 1
        for j in range(100):
            N[j] = (j / 100 - NodeVector[i]) / length0
        lst0.append(N)

    for i in range(len(NodeVector) - p - 1):
        N = np.zeros(100)
        length0 = NodeVector[i + p + 1] - NodeVector[i + 1] # 规定0/0=0
        if length0 == 0:
            length0 = 1
        for j in range(100):
            N[j] = (NodeVector[i + p + 1] - j / 100) / length0
        lst1.append(N)
    return lst0, lst1

def DrawSpline(NodeVector, ControlNode):
    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.set(xlim=[min(ControlNode[0,:]) - 0.5, max(ControlNode[0,:]) + 0.5], ylim=[min(ControlNode[1,:]) - 0.5, max(ControlNode[1,:]) + 0.5], title='An Example Of B_Splines',
           ylabel='Y-Axis', xlabel='X-Axis')
    plt.grid(ls='--')
    plt.scatter(ControlNode[0,:], ControlNode[1 ,:], color='b', marker='o', s=50)
    N = BaseFunction(3, NodeVector)
    x = np.zeros(100)
    y = np.zeros(100)
    for i in range(ControlNode.shape[1]):
        x += ControlNode[0,i] * N[i]
        y += ControlNode[1,i] * N[i]
    plt.plot(ControlNode[0,:],ControlNode[1,:],color='y')
    plt.plot(x, y, color='r')
    plt.show()

if __name__=='__main__':
    NodeVector = np.array([0. ,0. ,0. ,0. ,0.2 ,0.4, 0.4, 0.6 ,0.8 ,0.8, 0.8, 1. ,1. ,1. ,1.])
    ControlNode= np.array([[0,1,2,3,4,5,6,7,8,9,10],[3,5,4,7,9,2,1,4,8,9,6]])
    N = BaseFunction(3,NodeVector)
    DrawSpline(NodeVector,ControlNode)

