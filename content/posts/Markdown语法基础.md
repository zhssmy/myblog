---
title: "Markdown语法基础"
date: 2019-11-26T21:32:49+08:00
tags: [Markdown]  
categories: [TECH]
draft: false
dropCap: false
toc: true
---

## Syntax guide

### Headers
**code:**
```
# This is an <h1> tag
## This is an <h2> tag
### This is an <h3> tag
#### This is an <h4> tag
##### This is an <h5> tag
###### This is an <h6> tag
```

### Emphasis
**code:**
```
*This text will be italic*
_This will also be italic_
**This text will be bold**
__This will also be bold__
_You **can** combine them_
~~This text will be strikethrough~~
```
**demo:**

`斜体`：*This text will be italic*

`斜体`：_This will also be italic_

`粗体`：**This text will be bold**

`粗体`：__This will also be bold__

`斜体+粗体`：_You **can** combine them_

`删除线`:~~This text will be strikethrough~~

Meme主题新增：`着重点`: ..This..  ..will..  ..be..  ..emphasis..


### Lists

#### Unordered List
**code:**
```
- Item 1
- Item 2
  - Item 2a
  - Item 2b
```
**demo:**

- Item 1
- Item 2
  - Item 2a
  - Item 2b

#### Ordered List
**code:**
```
1. Item 1
1. Item 2
1. Item 3
   1. Item 3a
   1. Item 3b
```
**demo:**

1. Item 1
1. Item 2
1. Item 3
   1. Item 3a
   1. Item 3b

### Images
**code:**
```
![github_icon](/images/giuhub_icon.jpg)
Format: ![Alt Text](url)
```
**demo:**

![github_icon](/images/tech/2019/11/github_icon.png)
Format: ![Alt Text](/images/tech/2019/11/github_icon.png)

### Links
**code:**
```
http://github.com - automatic!
[GitHub](http://github.com)

```
**demo:**

http://github.com - automatic!
[GitHub](http://github.com)

### Blockquote
**code:**
```
As Kanye West said:

> We're living the future so
> the present is our past.
```
**demo:**

As Kanye West said:

> We're living the future so
> the present is our past.

### Horizontal Rule
**code:**
```
Three or more...

---

Hyphens

---

Asterisks

---

Underscores
```
**demo:**

Three or more...

---

Hyphens

---

Asterisks

---

Underscores

### Inline code

**code:**
```
I think you should use an
`<addr>` element here instead.
```
**demo:**

I think you should use an
`<addr>` element here instead.

### Fenced code block
You can create fenced code blocks by placing triple backticks ``` before and after the code block.
#### Syntax Highlighting
You can add an optional language identifier to enable syntax highlighting in your fenced code block.

For example, to syntax highlight Ruby code:
```ruby
require 'redcarpet'
markdown = Redcarpet.new("Hello World!")
puts markdown.to_html
```

#### Code block class (MPE extended feature)
You can set `class` for your code blocks.

For example, to add `class1` `class2` to a code block

```javascript {.class1 .class}
function add(x, y) {
  return x + y
}
```

#### line-numbers
You can enable line number for a code block by adding `line-numbers` class.

For example:

```javascript {.line-numbers}
function add(x, y) {
  return x + y;
}
```

#### highlighting rows
You can highlight rows by add `highlight` attribute:

```javascript {highlight=10}
```

```javascript {highlight=10-20}
```

```javascript {highlight=[1-10,15,20-22]}
```

### Task lists

**code:**
```
- [x] @mentions, #refs, [links](abc.com), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item
```
**demo:**

- [x] @mentions, #refs, [links](abc.com), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item

### Tables
You can create tables by assembling a list of words and dividing them with hyphens `-` (for the first row), and then separating each column with a pipe `|`:

**code:**
```
|First Header | Second Header|
|:-:|:-:|
|Content from cell 1 | Content from cell 2|
|Content in the first column | Content in the second column|
```
**demo:**

|First Header | Second Header|
|:-:|:-:|
|Content from cell 1 | Content from cell 2|
|Content in the first column | Content in the second column|

## Extended syntax
### Table
Need to enable `enableExtendedTableSyntax` in extension settings to get it work.

### Emoji & Font-Awesome
This only works for `markdown-it parser` but not `pandoc parser`.
Enabled by default. You can disable it from the package settings.

:smile:
:tent:

### Superscript
**code:**
```
30<sup>th</sup>
```
**demo:**

30<sup>th</sup>


### Subscript
**code:**
```
H<sub>2</sub>O
```
**demo:**

H<sub>2</sub>O

### Footnotes
**code:**
```
Content [^1]
[^1]: Hi! This is a footnote
```
**demo:**

Content [^1]
[^1]: Hi! This is a footnote


