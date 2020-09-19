# Two Node Link
---

$$
\left[
 \begin{matrix}
   0 & 4 & 8 \\
   1 & 5 & 9 \\
   2 & 6 & 10 \\
   3 & 7 & 11
  \end{matrix}
\right]
$$

## 输入配置
1. 整体输入至少要有7个，包括```eleTag, iNode, jNode, -mat, mat, -dir, dir```。
2. 先取得```idata[3]```，用来取得前三个```Tag```。
3. 在```std::vector<UniaxialMaterial*>```中推入利用```matTag```取得的```UniaxialMaterial *```。
4. 用```mats.size()```控制```-dir```后面的个数，并和```OPS_GetNumRemainingInputArgs()```比较，检测错误。用```ID dirs```存储```dir```数目。
5. 若不考虑额外配置选项，则一下全部默认为0，或不考虑。
6. 在```-orient ```中，用```Vector x, Vector y```储存信息。以y的输入为主，若仅输入了3个数字，或在3至6之间都把```Vector x```为0，并以```Vector y```为准。若满足6个输入或以上，则前三个为```Vector x```，后三个为```Vector y```。
7. ```Mratios```中，2维默认前两个是0，3维则按照输入配置
8. ```-shearDist```，剪切键距离```inode, jNode```组成向量的比例向量。共有两个位置，2维中，配置第二个位置，3维中，直接按配置进行。默认为```[0.5, 0.5]```。
9. ```-doRayleigh```是一个标记，用以标记是否考虑瑞利阻尼，默认不考虑。
10. ```-mass```配置单元质量，默认是0.
---

## 构造函数
1. 形参列表
```c++
int tag(idata[0]) // eleTag
int ndm(OPS_GetNDM())
int Nd1(idata[1]) // nodeTag
int Nd2(idata[2]) // nodeTag
ID direction(Input config)
UniaxialMaterial material(Input config)
Vector y(Input config)
Vector x(Input config)
Vector Mr(Input config)
Vector sdI(Input config)
int addRay(Input config)
double m(Input config)
```
2. 函数实现
   1. 用```Nd1, Nd2```初始化```connectedExternalNodes```
   2. ```theNode```初始化为0
   3. ```dir```用```direction```初始化，并做检查。
   4. new 出```theMaterial```用```material```初始化
   5. 检查```Vector Mratio```
   6. 检查```shearDistI```
   7. 初始化```Vector ub, Vector ubdot, Vector qb```用```dir```的大小
---

## setDomain(Domain* theDomain)
1. 默认为1维，2自由度
2. 提取```Nd1, Nd2```从```connectedExternalNodes```
3. 由```Nd1, Nd2```和```getNode()```获取```theNode```
4. 由```getNumberDOF()```获取```dofNd1, dofNd2```，然后检查
   在```setDomain()```注册```theDomain```
5. 设定各种矩阵指针
6. setup()
---

## setup()--trans
1. 求单元长度
2. 构造局部坐标系的方向矩阵
---

## setTranGlobalLocal()--Tgl
1. 从方向矩阵构造局部到整体的坐标变换矩阵
---

## setTranLocalBasic()--Tlb
1. 由```-dir```和```shearDir```构造一个矩阵，这个矩阵的<font color=#FF0000> 作用未知 </font>
---

## update()--ul, uldot, ub, ubdot
1. 这个函数在求解中调用，用于更新矩阵信息
2. 新建了```ug, ugdot, uldot```三个矩阵
3. ```ug```用来存储位移信息
4. ```ugdot```用来存储速度信息
5. ```ul```做矩阵运算结果是经过