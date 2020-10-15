import matplotlib.pyplot as plt
import numpy
from scipy.special import comb

def de_Casteljau(x,y,t):
    x1=[]
    y1=[]
    for i in range(len(x)-1):
        x1.append((1 - t) * x[i] + t * x[i + 1])
        y1.append((1 - t) * y[i] + t * y[i + 1])
    return x1,y1

def Bezier(x,y):
    x1 = []
    t1 = []
    t2 = []
    y1 = []
    length = len(x)

    for i in range(length):
        t1.append(x[i] * comb(length-1,i))
        t2.append(y[i] * comb(length-1, i))

    for i in range(101):
        x1.append(t1[0] * (1 - i/100) ** 3 + t1[1] * (i/100) * (1 - i/100) ** 2 + t1[2] * (i/100) ** 2 * (1- i/100) + t1[3] * (i/100) ** 3)
        y1.append(t2[0] * (1 - i/100) ** 3 + t2[1] * (i/100) * (1 - i/100) ** 2 + t2[2] * (i/100) ** 2 * (1- i/100) + t2[3] * (i/100) ** 3)

    return  x1,y1

x1=[0,1,3,4]
y1=[0,2,0,1]
t=0.3

if __name__ =='__main__':
    x,y = Bezier(x1,y1)
    x2,y2 = de_Casteljau(x1,y1,t)
    x3,y3 = de_Casteljau(x2,y2,t)
    x4,y4 = de_Casteljau(x3,y3,t)

    label0=['P_0','P_1','P_2','P_3']
    label1=['P_0,1','P_1,1','P_2,1']
    label2=['P_0,2','P_1,2']
    label3=['P_0,3']

    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.set(xlim=[min(x1)-0.1, max(x1)+0.1], ylim=[min(y1)-0.1, max(y1)+0.1], title='An Example Of de Casteljau',
           ylabel='Y-Axis', xlabel='X-Axis')
    plt.grid(ls='--')

    ax.plot(x, y, color='r')

    plt.scatter(
        x1, y1, color='r',marker='o' ,s=50)

    ax.plot(x1, y1, color='b')

    for label, x, y in zip(label0, x1, y1):
        plt.annotate(
            label,
            xy=(x, y), xytext=(-20, 0),
            textcoords='offset points', ha='right', va='bottom',
            bbox=dict(boxstyle='round,pad=0.5', fc='yellow', alpha=0.5),
            arrowprops=dict(arrowstyle='->', connectionstyle='arc3,rad=0'))

    plt.scatter(
        x2, y2, color='y', marker='o',s=50)

    ax.plot(x2, y2, color='y')

    for label, x, y in zip(label1, x2, y2):
        plt.annotate(
            label,
            xy=(x, y), xytext=(0, -20),
            textcoords='offset points', ha='right', va='bottom',
            bbox=dict(boxstyle='round,pad=0.5', fc='white', alpha=0.5),
            arrowprops=dict(arrowstyle='->', connectionstyle='arc3,rad=0'))

    plt.scatter(
        x3, y3, color='g', marker='o', s=50)

    ax.plot(x3, y3, color='g')

    for label, x, y in zip(label2, x3, y3):
        plt.annotate(
            label,
            xy=(x, y), xytext=(0,20),
            textcoords='offset points', ha='right', va='bottom',
            bbox=dict(boxstyle='round,pad=0.5', fc='blue', alpha=0.5),
            arrowprops=dict(arrowstyle='->', connectionstyle='arc3,rad=0'))

    plt.scatter(
        x4, y4, color='b', marker='o', s=50)

    for label, x, y in zip(label3, x4, y4):
        plt.annotate(
            label,
            xy=(x, y), xytext=(0, 30),
            textcoords='offset points', ha='right', va='bottom',
            bbox=dict(boxstyle='round,pad=0.5', fc='brown', alpha=0.5),
            arrowprops=dict(arrowstyle='->', connectionstyle='arc3,rad=0'))

    plt.show()