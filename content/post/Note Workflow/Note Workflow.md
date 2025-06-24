---
date: 2025-06-20T00:00:42+08:00
author: Machillka
title: 笔记目录工作流
categories:
  - Workflow
tags: 
image:
---
# 综述

文本编辑器使用 Obsidian
云端存储 Github
比之前==加强的一点== —— 可以选择是否要上传到 Blog 上

早年想到的方案是在 github 上跨仓库调用，但是这样无法实现

# 实现

## 针对 Blog System

首先使用 Hugo 快速搭建静态 blog 的一个主框架（主要是对 Go 比较熟悉
接着快速加入 theme 等子模块
使用 Github Action 自动部署到 Pages 上

## 针对 Obsidian

1. 把普通笔记和博客文章的元数据封装成 Template
2. Quick Add
	1. 先搭建基础模型 —— 创建两个 Choice 分别对应通过模板创建普通笔记和博客笔记
	2. 编写一个宏 —— 包含把当前激活的文件封装成 Hugo Pages 需要的形式
3. 最后再次利用 Quick Add 调用脚本实现上传到 Github 上触发条件可以是手动或者保存时自动调用
4. 编写 workflow 以调用 Github Action 自动部署

# 踩坑

## Template

模板生成的时间与 Hugo 不对应，导致无法在 Hugo 上构建

## Pages

没有添加 CNAME 解析，导致域名绑定失效

## Quick Add

>[!danger] 非常恶心

没有重启 Obsidian 调用外部 JS 会提示空！

## JS

~~速通 JS 导致写的很烂~~

调用 powershell 的时候 使用

```js
exec(powershell)
```

而不是

```js
exec(pwsh)
```

powershell 默认路径是 Windows 下的垃圾东西，也没设置 Proxy，导致连接 Github 可能失败

# 未来可期

封装成一个插件丢到社区里