---
title: "优雅的JavaScript代码小技巧"
date: 2021-04-14T14:08:57+08:00
draft: false
tags: [JavaScript]  
categories: [tech,前端]
toc: true
dropCap: false
---

内容来自公众号 @[前端新世界](https://mp.weixin.qq.com/s/ZieD1AqKEIW9i0hbPYyVfg)


你可能已经用JavaScript开发很长一段时间了，但是，有时候你可能并没有使用过它提供的最新最漂亮的功能。这些新功能或许可以帮助你解决一些问题，而不用额外增加很多代码。换句话说，这些技术可以帮助你编写简洁优雅的JavaScript代码。本文就总结了17个写出优雅JavaScript代码的小技巧，一起来看看吧。
_
## 1.多条件IF语句


我们可以将多个条件值存储在一个数组中，并且使用数组的`includes`方法来进行条件判断。
```javascript
//普通写法
if (x === 'abc' || x === 'def' || x === 'ghi' || x ==='jkl') {
    //logic
}
//优雅写法
if (['abc', 'def', 'ghi', 'jkl'].includes(x)) {
   //logic
}
```


## 2.If … else条件简写
当`if-else`语句中不包含复杂逻辑时，下面这种写法将是一个不错的捷径。我们可以简单地使用三元运算符来实现。
```javascript
// 普通写法
let test: boolean;
if (x > 100) {
    test = true;
} else {
    test = false;
}
// 优雅写法
let test = (x > 10) ? true : false;
//or we can simply use
let test = x > 10;
console.log(test);
```
如果是嵌套条件语句，我们还可以这样写：
```javascript
let x = 300,
let test2 = (x > 100) ? 'greater 100' : (x < 50) ? 'less 50' : 'between 50 and 100';
console.log(test2); // "greater than 100"
```


## 3.空值、未定义和空字符的检查
当我们创建一个新的变量，有时候会在引用它时检查该变量是否为`null`或者`undefined`。JavaScript确实提供了实现这个功能的简便方法。
```javascript
// 普通写法
if (first !== null || first !== undefined || first !== '') {
    let second = first;
}
// 优雅写法
let second = first|| '';
```


## 4.Null检查，以及赋默认值
```javascript
let first = null,
let second = first || '';
console.log("null check", test2); // output will be ""
```
## 5.Undefined检查，以及赋默认值
```javascript
let first= undefined,
let second = first || '';
console.log("undefined check", test2); // output will be ""
```


## 6.foreach循环的简写
这是JavaScript迭代循环的简写方式。
```javascript
// 普通写法
for (var i = 0; i < testData.length; i++)
// 优雅写法
for (let i in testData) or  for (let i of testData)
```


## 7.比较后返回值
在return语句中使用比较函数，可以将5行代码压缩至1行。
```javascript
// 普通写法
let test;
function checkReturn() {
    if (!(test === undefined)) {
        return test;
    } else {
        return callMe('test');
    }
}
var data = checkReturn();
console.log(data); //output test
function callMe(val) {
    console.log(val);
}
// 优雅写法
function checkReturn() {
    return test || callMe('test');
}
```


## 8.函数调用的简单写法
我们可以使用三元运算符实现这些类型的功能。
```javascript
// 普通写法
function test1() {
  console.log('test1');
};
function test2() {
  console.log('test2');
};
var test3 = 1;
if (test3 == 1) {
  test1();
} else {
  test2();
}
// 优雅写法
(test3 === 1? test1:test2)();
```


## 9.Switch语句的简单写法
我们可以将条件存储在`key-value`的字典对象中，然后通过字典对象的索引来判断取值。
```javascript
// Longhand
switch (data) {
  case 1:
    test1();
  break;
  case 2:
    test2();
  break;
  case 3:
    test();
  break;
  // And so on...
}
// Shorthand
var data = {
  1: test1,
  2: test2,
  3: test
};
data[anything] && data[anything]();
```

## 10.多行字符串的简写
当我们在代码中处理多行字符串时，我们可以这样做：
```javascript
//普通写法
const data = 'abc abc abc abc abc abc\n\t'
    + 'test test,test test test test\n\t'
//优雅写法
const data = `abc abc abc abc abc abc
         test test,test test test test`
```
## 11.隐式返回的简写
我们可以使用箭头函数直接返回值，而不用写`return`语句。
```javascript
Longhand:
//longhand
function getArea(diameter) {
  return Math.PI * diameter
}
//shorthand
getArea = diameter => (
  Math.PI * diameter;
)
```
## 12.条件查找的简写
如果我们的代码中需要检查变量的类型，然后基于不同类型调用不同的方法，那么我们除了使用`if-else`语句或者`switch`语句来判断外，还可以使用更简单的方法吗？
```javascript
// 普通写法
if (type === 'test1') {
  test1();
}
else if (type === 'test2') {
  test2();
}
else if (type === 'test3') {
  test3();
}
else if (type === 'test4') {
  test4();
} else {
  throw new Error('Invalid value ' + type);
}
// 优雅写法
var types = {
  test1: test1,
  test2: test2,
  test3: test3,
  test4: test4
};
var func = types[type];
(!func) && throw new Error('Invalid value ' + type); func();
```
## 13.Object.entries()
这个特性可以将一个对象转换成一个对象数组。
```javascript
const data = { test1: 'abc', test2: 'cde', test3: 'efg' };
const arr = Object.entries(data);
console.log(arr);
/** Output:
[ [ 'test1', 'abc' ],
  [ 'test2', 'cde' ],
  [ 'test3', 'efg' ]
]
**/
```
## 14.Object.values()
这也是ES8的一个新特性，它和`Object.entries()`的功能类似，但是返回结果中没有key值。
```javascript
const data = { test1: 'abc', test2: 'cde' };
const arr = Object.values(data);
console.log(arr);
/** Output:
[ 'abc', 'cde']
**/
```
## 15.多次重复字符串
为了重复操作同一个字符串，我们可以在同一个`for`循环中将它们连接起来，那么有没有更好的方法呢？
```javascript
//普通写法 
let test = ''; 
for(let i = 0; i < 5; i ++) { 
  test += 'test '; 
} 
console.log(str); // test test test test test 
//优雅写法 
'test '.repeat(5);
```
## 16.Math.pow()简写
```javascript
//普通写法
Math.pow(2,3); // 8
//优雅写法
2**3 // 8
```
## 17.数字分隔符
现在，我们只需使用`_`即可轻松分隔数字，这可以帮助开发者更容易处理较大的数字。
```javascript
//老语法
let number = 98234567
//新语法
let number = 98_234_567
```

