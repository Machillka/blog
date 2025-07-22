---
date: 2025-07-21T15:34:55+08:00
date:
author: Machillka
title: Rust Lifetime
categories:
  - Program
tags:
  - rust
  - program
image:
---
# 生命周期

- Rust 中的每一个引用都有其 **生命周期**（_lifetime_），也就是引用保持有效的作用域。
- 生命周期的主要目标是避免**悬垂引用**。

函数返回参数的引用，其生命周期和该参数相同。
```rust
// 返回的是对 x 或 y 的引用, 不能保证返回的引用生命周期是否可用于是使用生命周期标记
pub fn longest<'a>(x: &'a str, y: &'a str) -> &'a str {
    if x.len() > y.len() {
        x
    } else {
        y
    }
}
```

直接规避引用（使用clone性能下降）
```rust
// 在堆区里开辟一个新的区域存储 res, 并且移交所有权，规避了对引用的生命周期问题
pub fn string_longest(x: &String, y: &String) -> String {
    let res = if x.len() > y.len() {
        x.clone()
    } else {
        y.clone()
    };

    res
}
```

# 生命周期标记

为什么需要标记生命周期？——

当你返回一个引用时，Rust 需要知道这个引用的生命周期和它所引用的数据的生命周期之间的关系。如果不指定生命周期，Rust 编译器无法判断返回的引用是否在调用者作用域内仍然有效。

>[!warning]
>- 生命周期标注并不会改变引用的实际生命周期，它只是告诉编译器不同引用之间的关系。
>- 如果函数内部创建了一个局部变量并尝试返回它的引用，这是不允许的，因为局部变量会在函数结束时被销毁。