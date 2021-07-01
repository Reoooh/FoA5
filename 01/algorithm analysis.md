# 算法分析



## 复杂度分析

### 输入规模

一般情况下，算法的运行时间随输入的规模而增加，总运行时间近似正比于某些基本运算的执行次数。

需要注意的是 $n$ 作为输入并不等于输入规模，输入规模的合理度量应是对 $n$ 编码所用的符号数。



算法的某条或某组指令称为==基本运算==，使算法完成的总工作量大体与其执行次数成正比。



### 时间复杂度分析

`time complexity analysis`

针对输入规模的每个取值，计算该算法执行了多少次基本运算。

`every-case time complexity`

==所有情况时间复杂度== $T(n)$ 为对于输入规模 $n$ 的一个具体取值，即为该算法执行基本运算的次数。

并非所有算法的基本运算执行次数对于不同 $n$ 值都是相同的。

`worst-every-case time complexity`

==最差情况时间复杂度== $W(n)$ 为该算法执行其基本运算的最大次数。

若 $T(n)$ 存在，则 $W(n) = T(n)$ 。

`average-case time complexity`

==平均情况时间复杂度== $A(n)$ 为该算法执行基本运算的平均次数（期望值）。

若 $T(n)$ 存在，则 $A(n) = T(n)$ 。

`best-case time complexity`

==最佳情况时间复杂度== $B(n)$ 为该算法执行基本运算的最小次数。

若 $T(n)$ 存在，则 $B(n) = T(n)$ 。



## 阶

`linear-time algorithm`

==线性时间算法==

其时间复杂度是输入规模的线性函数

`quadratic-time algorithm`

==二次时间算法==

其时间复杂度是输入规模的二次函数



==任意线性时间算法的效率最终将高于任意二次时间算法==



`pure quadratic function`

==纯二次函数==

没有包含线性项

`complete quadratic function`

==完全二次函数==

包含有线性项



常见==复杂度类别==
$$
\Theta{(\lg{n})} \quad \Theta{(n)} \quad \Theta{(n\lg{n})} \quad \Theta{(n^2)} \quad \Theta{(n^3)} \quad \Theta{(2^n)}
$$
