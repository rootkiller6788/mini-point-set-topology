# Mini Point-Set Topology（迷你点集拓扑学）

大学水平**点集拓扑学、分离公理与紧化**的**从零实现 Lean 4** 合集。每个子包对标 MIT 等顶尖大学课程，使用 Lean 4 证明助手及其内核库从第一性原理构建基础。

## 子包

| 子包 | 主题 | 对标课程 |
|---|---|---|
| [mini-topological-spaces](mini-topological-spaces/) | 拓扑空间、开/闭集、内部、闭包、边界 | MIT 18.901, Harvard Math 131 |
| [mini-continuity-homeomorphism](mini-continuity-homeomorphism/) | 连续映射、同胚、商映射、嵌入 | MIT 18.901, Berkeley Math 142 |
| [mini-compactness](mini-compactness/) | 紧空间、吉洪诺夫定理、局部紧、一点紧化 | MIT 18.901, Princeton MAT 335 |
| [mini-connectedness](mini-connectedness/) | 连通、道路连通、连通分支、局部连通空间 | MIT 18.901, Cambridge Part II |
| [mini-separation-axioms](mini-separation-axioms/) | T0-T6 公理、乌雷松引理、蒂策扩张、可度量化 | MIT 18.902, Harvard Math 131 |
| [mini-convergence-nets](mini-convergence-nets/) | 网、滤子、超滤子、收敛、用网刻画紧性 | MIT 18.902, Oxford Part C |
| [mini-stone-cech-compactification](mini-stone-cech-compactification/) | Stone-Cech 紧化、Wallman 紧化、万有性质 | MIT 18.902, Cambridge Part III |
| [mini-topological-constructions](mini-topological-constructions/) | 积拓扑、商拓扑、子空间拓扑、正向极限 | MIT 18.901, Berkeley Math 142 |

## 设计理念

- **零外部依赖** -- 纯 Lean 4，仅依赖内核库与同级导入
- **自包含子包** -- 每个子包含 `lakefile.lean`、Core/、Morphisms/、Constructions/、Theorems/
- **理论与代码映射** -- 内联 `#eval` 示例和定理陈述

## 构建方法

```bash
cd 子包名
lake build
lake env lean --run Test/Smoke.lean
```

需要安装 **Lean 4** 和 **Lake**。

## 许可证

MIT
