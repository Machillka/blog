---
date: '2025-07-15T17:07:19+08:00'
author: Machillka
title: '设计原则'
categories:
  - 
tags:
  - 
image:
---
# 开闭

# 依赖倒置原则

看到的定义感觉比较复杂，简单来说 ——

情景：我们（高层）需要使用一个类A（底层），那么，如果直接引用A，在未来如果需要应用类B的时候就需要修改我们自身，容易出问题。所以我们可以通过一个接口来访问我们需要的东西，然后让类A、B等实现这个接口，这样就不需要修改我们自身，只需要定义好底层就可以了。

实例例子 ——
客户吃`Food`，原先只想到了客户吃饭，直接传递一个`rice`给客户
```CSharp
class Sercice
{
	public void Eating(Rice rice)
	{
		...
	}
}
```
如果客户想要吃面，就需要重载一个 Eating，或者修改 Eating 中的内容，非常麻烦，于是想到抽象出一个`Food`，客户只需要使用`Food`即可
```CSharp
class Service
{
	public void Eating(Food food)
	{
		...
	}
}
```
然后`Food`的实现
```CSharp
public interface Food
{
	...
}

public class Rice : Food
{
	...
}

public class Noodle : Food
{
	...
}

public class OtherFood : Food
```
这样可以在不修改客户代码逻辑的前提下，使其可以食用各种食物 —— 

==依赖倒置原则==：高层次的模块不依赖于低层次的模块的实现细节，依赖关系被颠倒（反转），从而使得低层次模块依赖于高层次模块的需求抽象。
1. 高层次的模块不应该依赖于低层次的模块，两者都应该依赖与**抽象接口**
2. 抽象接口不应该依赖于具体实现。而具体实现则应该依赖于**抽象接口**。