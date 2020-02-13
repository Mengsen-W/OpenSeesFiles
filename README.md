# 对 OpenSees 使用记录

## [简单的算例设计方法](https://github.com/Mengsen-W/OpenSeesFiles/tree/master/Example-test "Example test")

1. 默认的质量实际上不是进行重力分析，而是进行动力分析所有，重力分析要以加载力的方式进行。

2. 可以先进行重力作用分析，后进行 pushover 分析，此时一些分析指令如果不在需要更改，就不需要重新写出来。

3. 若一次分析后不需要场面的持序作用，即使用 wipeAnalysis 命令。

## [二维弹性柱的静、动力分析](https://github.com/Mengsen-W/OpenSeesFiles/tree/master/ElasticColumn "Elastic Column")

1. 增加迭代步数减小步长会提高精确度，但可能会导致不收敛，误差约在 5% 左右

2. 在位移控制的时候，加载模式中给出的加载力其实是一种比例关系，随后的输出文件的第一列不是时间，而是力的系数。也就是说此系数乘加载力为实际的力大小。

3. 地震波文件没办法取得，生成的地震反应可能也是错的。

## [三维剪力墙的滞回曲线分析](https://github.com/Mengsen-W/OpenSeesFiles/tree/master/ShearWall "Shear Wall")

1. 对于剪力墙，壳单元更能充分反应其剪压复合的特点。

2. 剪力墙的壳单元能少建大约 1/3 的单元数量，有效提高了分析的效率

3. 梁类型的单元需要转换坐标系

4. OpenSees 不需要特殊指出约束，因为他们依靠节点传递应力应变

## [三维剪力墙 timeSeries 方法](https://github.com/Mengsen-W/OpenSeesFiles/tree/master/TimeSeriesShearWall "Time Series Shear Wall")

1. 对于箍筋层，小范围变化影响不大

2. 关键在于混凝土的厚度和一些端部钢筋

3. constrains 命令是用于确定施加边界条件的方法
    1. Plain 方法用于构造简单的约束，是以约束矩阵的形式施加，容易导致不收敛

    2. Lagrange 是使用拉格朗日乘子发得到一个势最低的点用来施加约束，有可能无法找到最小值导致约束失败，受积分点不同影响很大

    3. Penalty 罚函数法，依赖于罚函数的选取，对于一些复杂得多的问题，罚函数往往能在速度与精确性之间的到满足。而对于一般问题，罚函数显得速度有些慢。

    4. Transformation 变换约束，利用一个试探性的位移对于约束的单点；对于单点多约束问题可能无法满足，因为变换约束只能满足一个约束，甚至一个都不满足。
