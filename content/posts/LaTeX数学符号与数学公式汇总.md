---
title: "LaTeX数学符号公式汇总"
date: 2020-02-21T11:30:55+08:00
draft: false
tags: [LaTeX,数学公式]  
categories: [Tech,Hugo]
toc: true
dropCap: false
badge: true
---

这篇文章主要是为了把大部分常用的LaTex数学符号和公式整理到一起，方便自己和大家以后查阅使用，虽然网上的相关文章很多，但我还是花了点时间自己整理了一下，基本上都是网友们整理过的相关内容。从公式的使用到公式的各种常用运算符再到一些数学常用符号和特定的数学公式形式以及其他相关符号的整理。内容肯定是不完善的，后续如果有需要更改或添加的地方，我会进行修改的。

## 插入公式
### 行中公式
```
$y=x+1$
```
$y=x+1$

### 独立公式
公式会另起一行居中显示
```
$$y=x+1$$
```
$$y=x+1$$

## 上下标
|符号|说明|
|:-:|:-:|
|`^`|上标|
|`_`|下标|

如果上下标的内容多于一个字符，需要用`{}`将这些内容括成一个整体。上下标..可以嵌套..，也可以..同时使用..。

例：
```
$$ x^{y^z}=(1+e_1)^{xy^w} $$
```
$$ x^{y^z}=(1+e_1)^{xy^w} $$
另外，如果要在左右两边都有上下标，可以用 `\sideset` 命令。

例：
```
$$ \sideset{^1_2}{^3_4}x $$
```
$$ \sideset{^1_2}{^3_4}x $$

## 括号的使用
|命令|说明|预览|
|:-:|:-:|:-:|
|`(`|**圆括号（左）**|$($|
|`)`|**圆括号（右）**|$)$|
|`[`|**方括号（左）**|$[$|
|`]`|**方括号（右）**|$]$|
|`\\{`|**花括号（左）**|$\\{$|
|`\\}`|**花括号（右）**|$\\}$|

`(`、`)`、`[`、`]` 和 `|` 表示符号本身，使用 `\\{`来表示 `{`，`\\}` 来表示 `}`

通过将 `\left`与`(` ,`\right`与`)` 结合使用，可以将括号大小随着其内容变化。其他括号同理。
```
$$ {f}'(x) = ( \frac{df}{dx} ) $$
```
$$ {f}'(x) = ( \frac{df}{dx} ) $$
```
$$ {f}'(x) = \left( \frac{df}{dx} \right) $$
```
$$ {f}'(x) = \left( \frac{df}{dx} \right) $$
```
$$ {f}'(0) =  \left. \frac{df}{dx} \right|_{x=0} $$
```
$$ {f}'(0) =  \left. \frac{df}{dx} \right|_{x=0} $$


## 运算表达式
|命令|说明|预览|
|:-:|:-:|:-:|
|`\frac{a}{b}`|**分数**|$\frac{a}{b}$|
|`\sqrt`[`a`]`{b}`|**开方**（a为2时可省略）|$\sqrt[a]{b}$|
|`\sum_{a}^{b}`|**求和**|$\sum_{a}^{b}$|
|`\prod_{a}^{b}`|**连乘**|$\prod_{a}^{b}$|
|`{a+}\ldots{+b}`|**省略号**（与文本底线对齐）|${a+}\ldots{+b}$|
|`{a+}\cdots{+b}`|**省略号**（与文本中线对齐）|${a+}\cdots{+b}$|
|`\vec{a}`|**矢量**|$\vec{a}$|
|`lim_{{a} \to {\infty}}`|**极限**|$lim_{{a} \to {\infty}}$|
|`{f}'(x)`|**导数**|${f}'(x)$|
|`\int_{a}^{b}{x}\,dx`|**积分**|$\int_{a}^{b}{x}\,dx$|
|`\int`|**积分号**|$\int$|
|`\iint`|**二重积分号**|$\iint$|
|`\iiint`|**三重积分号**|$\iiint$|

## 矩阵
### 圆括号型
#### 方法1
```
$$
\begin{pmatrix}
1 & 2 & 3\\\\
4 & 5 & 6
\end{pmatrix}
$$
```
$$
\begin{pmatrix}
1 & 2 & 3\\\\
4 & 5 & 6
\end{pmatrix}
$$

#### 方法2
```
$$
\left(
\begin{matrix}
	1 & 2 & 3 \\\\
	4 & 5 & 6 \\\\
	7 & 8 & 9 \\\\
\end{matrix}
\right)
$$
```
$$
\left(
\begin{matrix}
	1 & 2 & 3 \\\\
	4 & 5 & 6 \\\\
	7 & 8 & 9 \\\\
\end{matrix}
\right)
$$

### 方括号型
#### 方法1
```
$$
\begin{bmatrix}
	1 & 2 & 3\\\\
	4 & 5 & 6
\end{bmatrix}
$$
```
$$
\begin{bmatrix}
	1 & 2 & 3\\\\
	4 & 5 & 6
\end{bmatrix}
$$

#### 方法2
```
$$
\left[
	\begin{matrix}
	1 & 2 & 3\\\\
	4 & 5 & 6
	\end{matrix}
\right]
$$
```
$$
\left[
	\begin{matrix}
	1 & 2 & 3\\\\
	4 & 5 & 6
	\end{matrix}
\right]
$$


### 花括号型
#### 方法1
```
$$
\begin{Bmatrix}
1 & 2 & 3\\\\
4 & 5 & 6
\end{Bmatrix}
$$
```
$$
\begin{Bmatrix}
1 & 2 & 3\\\\
4 & 5 & 6
\end{Bmatrix}
$$

#### 方法2
```
$$
\left\\{
	\begin{matrix}
	1 & 2 & 3\\\\
	4 & 5 & 6
	\end{matrix}
\right\\}
$$
```
$$
\left\\{
	\begin{matrix}
	1 & 2 & 3\\\\
	4 & 5 & 6
	\end{matrix}
\right\\}
$$

## 行列式
### 方法1
```X=
\begin{vmatrix}
	x & x & \cdots & x\\\\
	x & x & \cdots & x\\\\
	\vdots & \vdots & \ddots & \vdots\\\\
	x & x & \cdots & x\\\\
\end{vmatrix}
```
$$X=
\begin{vmatrix}
	x & x & \cdots & x\\\\
	x & x & \cdots & x\\\\
	\vdots & \vdots & \ddots & \vdots\\\\
	x & x & \cdots & x\\\\
\end{vmatrix}
$$

### 方法2
```
$$X=
\left|
\begin{matrix}
	x & x & \cdots & x\\\\
	x & x & \cdots & x\\\\
	\vdots & \vdots & \ddots & \vdots\\\\
	x & x & \cdots & x\\\\
\end{matrix}
\right|
$$
```
$$X=
\left|
\begin{matrix}
	x & x & \cdots & x\\\\
	x & x & \cdots & x\\\\
	\vdots & \vdots & \ddots & \vdots\\\\
	x & x & \cdots & x\\\\
\end{matrix}
\right|
$$

## 分段函数
```
$$f(n) =
\begin{cases}
	2n,  & \text{if $n$ is even} \\\\
	3n, & \text{if $n$ is odd}
\end{cases}
$$
```
$$f(n) =
\begin{cases}
	2n,  & \text{if $n$ is even} \\\\
	3n, & \text{if $n$ is odd}
\end{cases}
$$

## 方程组
```
$$
\left\\{ 
\begin{array}{c}
    a_1x+b_1y+c_1z=d_1 \\\\ 
    a_2x+b_2y+c_2z=d_2 \\\\ 
    a_3x+b_3y+c_3z=d_3
\end{array}
\right. 
$$
```
$$
\left\\{ 
\begin{array}{c}
    a_1x+b_1y+c_1z=d_1 \\\\ 
    a_2x+b_2y+c_2z=d_2 \\\\
    a_3x+b_3y+c_3z=d_3
\end{array}
\right. 
$$

## 数学常用符号
### 希腊字母
#### 小写希腊字母
|符号|指令|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$\alpha$|`\alpha`|$\theta$|`\theta`|$o$|`o`|
|$\beta$|`\beta`|$\vartheta$|`\vartheta`|$\pi$|`\pi`|
|$\gamma$|`\gamma`|$\iota$|`\iota`|$\varpi$|`\varpi`|
|$\delta$|`\delta`|$\kappa$|`\kappa`|$\rho$|`\rho`|
|$\epsilon$|`\epsilon`|$\lambda$|`\lambda`|$\varrho$|`\varrho`|
|$\varepsilon$|`\varepsilon`|$\mu$|`\mu`|$\sigma$|`\sigma`|
|$\zeta$|`\zeta`|$\nu$|`\nu`|$\varsigma$|`\varsigma`|
|$\eta$|`\eta`|$\xi$|`\xi`|$\tau$|`\tau`|
|$\upsilon$|`\upsilon`|$\phi$|`\phi`|$\varphi$|`\varphi`|
|$\chi$|`\chi`|$\psi$|`\psi`|$\omega$|`\omega`|

#### 大写希腊字母
|符号|指令|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$\Gamma$|`\Gamma`|$\Lambda$|`\Lambda`|$\Sigma$|`\Sigma`|
|$\Delta$|`\Delta`|$\Xi$|`\Xi`|$\Upsilon$|`\Upsilon`|
|$\Theta$|`\Theta`|$\Pi$|`\Pi`|$\Phi$|`\Phi`|
|$\Psi$|`\Psi`|$\Omega$|`\Omega`|||

### 运算符
#### 二元运算符
|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|
|$+$|`+`|$\pm$|`\pm`|
|$\ast$|`\ast`|$\star$|`\star`|
|$-$|`-`|$\mp$|`\mp`|
|$\times$|`\times`|$\triangleleft$|`\triangleleft`|
|$\cup$|`\cup`|$\sqcup$|`\sqcup`|
|$\div$|`\div`|$\triangleright$|`\triangleright`|
|$\cdot$|`\cdot`|$\circ$|`\circ`|
|$\cap$|`\cap`|$\sqcap$|`\sqcap`|
|$\setminus$|`\setminus`|$\bullet$|`\bullet`|
|$\oplus$|`\oplus`|$\diamond$|`\diamond`|
|$\vee$|`\vee`|$\wedge $|`\wedge`|
|$\ominus$|`\ominus`|$\otimes$|`\otimes`|
|$\oslash$|`\oslash`|$\odot$|`\odot`|
|$\uplus$|`\uplus`|$\\amalg$|`\\amalg`|
|$\bigtriangleup$|`\bigtriangleup`|$\dagger$|`\dagger`|
|$\bigtriangledown$|`\bigtriangledown`|$\ddagger$|`\ddagger`|
|$\lhd$|`\lhd`|$\unlhd$|`\unlhd`|
|$\rhd$|`\rhd`|$\unrhd$|`\unrhd`|
|$\wr$|`\wr`|||

#### 大尺寸运算符
|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|
|$\sum$|`\sum`|$\bigcup$|`\bigcup`|
|$\bigcap$|`\bigcap`|$\bigvee$|`\bigvee`|
|$\bigoplus$|`\bigoplus`|$\prod$|`\prod`|
|$\bigwedge$|`\bigwedge`|$\bigotimes$|`\bigotimes`|
|$\coprod$|`\coprod`|$\bigsqcup$|`\bigsqcup`|
|$\bigodot$|`\bigodot`|$\biguplus$|`\biguplus`|

#### 对数运算符
|符号|指令|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$\log$|\log|$\lg$|\lg|$\ln$|\ln|

#### 三角运算符
|符号|指令|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$30^\circ$|30^\circ|$\bot$|\bot|$\angle A$|\angle A|
|$\sin$|\sin|$\cos$|\cos|$\tan$|\tan|
|$\csc$|\csc|$\sec$|\sec|$\cot$|\cot|

#### 微积分运算符
|符号|指令|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$\int$|\int|$\iint$|\iint|$\iiint$|\iiint|
|$\iiiint$|\iiiint|$\oint$|\oint|$\prime$|\prime|
|$\lim$|\lim|$\infty$|\infty|$\nabla$|\nabla|

#### 逻辑运算符
|符号|指令|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$\because$|\because|$\therefore$|\therefore|$\not\subset$|\not\subset|
|$\forall$|\forall|$\exists$|\exists|||


### 关系符
#### 二元关系符
|符号|指令|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$>$|`>`|$<$|`<`|$=$|`=`|
|$\not>$|\not>|$\not<$|\not<|$\ne$|`\ne` or `\not=`|
|$\le$|`\le`|$\ge$|`\ge`|$\equiv$|`\equiv`|
|$\ll$|`\ll`|$\gg$|`\gg`|$\doteq$|`\doteq`|
|$\prec$|`\prec`|$\succ$|`\succ`|$\sim$|`\sim`|
|$\preceq$|`\preceq`|$\succeq$|`\succeq`|$\simeq$|`\simeq`|
|$\subset$|`\subset`|$\supset$|`\supset`|$\approx$|`\approx`|
|$\subseteq$|`\subseteq`|$\supseteq$|`\supseteq`|$\cong$|`\cong`|
|$\sqsubset$|`\sqsubset`|$\sqsupset$|`\sqsupset`|$\Join$|`\Join`|
|$\sqsubseteq$|`\sqsubseteq`|$\sqsupseteq$|`\sqsupseteq`|$\bowtie$|`\bowtie`|
|$\in$|`\in`|$\owns$|`\owns`|$\propto$|`\propto`|
|$\vdash$|`\vdash`|$\dashv$|`\dashv`|$\models$|`\models`|
|$\mid$|`\mid`|$\parallel$|`\parallel`|$\perp$|`\perp`|
|$\smile$|`\smile`|$\frown$|`\frown`|$\asymp$|`\asymp`|
|$\notin$|`\notin`|$:$|`:`|||

### 戴帽符号
|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|
|$\hat{xy}$|`\hat{xy}`|$\widehat{xyz}$|`\widehat{xyz}`|
|$\tilde{xy}$|`\tilde{xy}`|$\widetilde{xyz}$|`\widetilde{xyz}`|
|$\check{x}$|`\check{x} `|$\breve{y}$|`\breve{y}`|
|$\grave{x}$|`\grave{x}`|$\acute{y}$|`\acute{y}`|

### 连线符号
|连线符号|
|:-:|
|\fbox{a+b+c+d}|
|$\fbox{a+b+c+d}$|
|\overleftarrow{a+b+c+d}|
|$\overleftarrow{a+b+c+d}$|
|\overrightarrow{a+b+c+d}|
|$\overrightarrow{a+b+c+d}$|
|\overleftrightarrow{a+b+c+d}|
|$\overleftrightarrow{a+b+c+d}$|
|\underleftarrow{a+b+c+d}|
|$\underleftarrow{a+b+c+d}$|
|\underrightarrow{a+b+c+d}|
|$\underrightarrow{a+b+c+d}$|
|\underleftrightarrow{a+b+c+d}|
|$\underleftrightarrow{a+b+c+d}$|
|\overline{a+b+c+d}|
|$\overline{a+b+c+d}$|
|\underline{a+b+c+d}|
|$\underline{a+b+c+d}$|
|\overbrace{a+b+c+d}^{Sample}|
|$\overbrace{a+b+c+d}^{Sample}$|
|\underbrace{a+b+c+d}_{Sample}|
|$\underbrace{a+b+c+d}_{Sample}$|
|\overbrace{a+\underbrace{b+c}_{1.0}+d}^{2.0}|
|$\overbrace{a+\underbrace{b+c}_{1.0}+d}^{2.0}$|
|\underbrace{a\cdot a\cdots a}_{b\text{ times}}|
|$\underbrace{a\cdot a\cdots a}_{b\text{ times}}$|


### 箭头
|符号|指令|
|:-:|:-:|
|$\uparrow$|`\uparrow`|
|$\downarrow$|`\downarrow`|
|$\gets$|`\gets` or `\leftarrow`|
|$\longleftarrow$|`\longleftarrow`|
|$\to$|`\to` or `\rightarrow`|
|$\longrightarrow$|`\longrightarrow`|
|$\leftrightarrow$|`\leftrightarrow`|
|$\longleftrightarrow$|`\longleftrightarrow`|
|$\updownarrow$|`\updownarrow`|
|$\Leftarrow$|`\Leftarrow`|
|$\Longleftarrow$|`\Longleftarrow`|
|$\Uparrow$|`\Uparrow`|
|$\Rightarrow$|`\Rightarrow`|
|$\Longrightarrow$|`\Longrightarrow`|
|$\Downarrow$|`\Downarrow`|
|$\Leftrightarrow$|`\Leftrightarrow`|
|$\Longleftrightarrow$|`\Longleftrightarrow`|
|$\Updownarrow$|`\Updownarrow`|
|$\mapsto$|`\mapsto`|
|$\longmapsto$|`\longmapsto`|
|$\nearrow$|`\nearrow`|
|$\hookleftarrow$|`\hookleftarrow`|
|$\hookrightarrow$|`\hookrightarrow`|
|$\searrow$|`\searrow`|
|$\leftharpoonup$|`\leftharpoonup`|
|$\rightharpoonup$|`\rightharpoonup`|
|$\swarrow$|`\swarrow`|
|$\leftharpoondown$|`\leftharpoondown`|
|$\rightharpoondown$|`\rightharpoondown`|
|$\nwarrow$|`\nwarrow`|
|$\rightleftharpoons$|`\rightleftharpoons`|
|$\iff$|`\iff`|
|$\leadsto$|`\leadsto`|


### 定界符
|符号|指令|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|:-:|:-:|
|$($|`(`|$)$|`)`|$\langle$|`\langle`|
|$[$|`[`|$]$|`]`|$\rangle$|`\rangle`|
|$\\{$|`\\{`|$\\}$|`\\}`|$\vert$|`\vert`|
|$\lfloor$|`\lfloor`|$\rfloor$|`\rfloor`|$\Vert$|`\Vert`|
|$\lceil$|`\lceil`|$\rceil$|`\rceil`|$/$|`/`|

### 其他符号
|符号|指令|符号|指令|
|:-:|:-:|:-:|:-:|
|$\dots$|`\dots`|$\cdots$|`\cdots`|
|$\vdots$|`\vdots`|$\ddots$|`\ddots`|
|$\hbar$|`\hbar`|$\imath$|`\imath`|
|$\jmath$|`\jmath`|$\ell$|`\ell`|
|$\Re$|`\Re`|$\Im$|`\Im`|
|$\aleph$|`\aleph`|$\wp$|`\wp`|
|$\partial$|`\partial`|$'$|`'`|
|$\emptyset$|`\emptyset`|$\triangle$|`\triangle`|
|$\Box$|`\Box`|$\Diamond$|`\Diamond`|
|$\bot$|`\bot`|$\top$|`\top`|
|$\angle$|`\angle`|$\surd$|`\surd`|
|$\diamondsuit$|`\diamondsuit`|$\heartsuit$|`\heartsuit`|
|$\clubsuit$|`\clubsuit`|$\spadesuit$|`\spadesuit`|
|$\neg $|`\neg` or `\lnot`|$\flat$|`\flat`|
|$\natural$|`\natural`|$\sharp$|`\sharp`|
|$\mho$|`\mho`|||
