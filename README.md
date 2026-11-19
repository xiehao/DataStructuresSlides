# 数据结构与算法课件

本仓库包含绪论、线性结构、树、图和基本算法的 Beamer 课件。各章节入口、
内容文件和 PDF 均位于仓库根目录。
课程为 48 学时，其中理论 32 学时、上机 16 学时。绪论给出理论学时的建议分配。

## 构建

需要支持中文的 XeLaTeX、`latexmk`、BibTeX、Pygments（`pygmentize`），以及
**单独安装的 `cuzbeamer` 类**和其依赖的 LaTeX 宏包。`cuzbeamer` 不包含在本
仓库中；安装后运行 `kpsewhich cuzbeamer.cls` 确认 TeX 能找到它。代码使用
`minted`，其调用 Pygments 所需的权限与配置取决于本地 TeX 和 minted 版本。

在仓库根目录运行：

```sh
make chapter-04               # 构建第四章
make chapter-00 handout-00    # 构建绪论演示版和讲义版
make handouts                 # 构建所有讲义版
make all                      # 构建所有章节及讲义版
make clean                    # 清除辅助文件，保留 PDF
```

`chapter-00` 至 `chapter-04` 是单章演示版目标，`handout-00` 至 `handout-04`
是对应的讲义版目标。构建会直接更新根目录的 PDF；修改内容后应同步更新受影响的
演示版和讲义版。讲义采用 A4 横向每页四张幻灯片，并隐藏思考题答案。

## 内容组织

入口文件负责加载类和包、标题及章节聚合文件；`*-data.tex` 负责章节框架与主题
组合，`*-data1.tex` 等文件负责具体内容。演示版与讲义版共享内容文件。
`slide-config.tex` 统一配置代码字号和讲义布局，`initialization.tex` 保存各章
共用的标题信息，图片位于 `images/`，可复用的教学
片段位于 `supplements/`，参考文献保存在 `references.bib`。
