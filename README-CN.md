# Mini Point-Set Topology（迷你点集拓扑学）

一套**从零开始、零依赖的 Lean 4 实现**，涵盖大学层次的点集拓扑学、分离公理与紧化。每个子包对应 MIT（及其他顶尖大学）课程，使用 Lean 4 证明助手从第一性原理构建点集拓扑学基础。

## 子包

| 子包 | 主题 | 核心课程 |
|------|------|----------|
| [mini-topological-spaces](mini-topological-spaces/) | 拓扑空间、开/闭集、内部、闭包、边界 | MIT 18.901, Harvard Math 131 |
| [mini-continuity-homeomorphism](mini-continuity-homeomorphism/) | 连续映射、同胚、商映射、嵌入 | MIT 18.901, Berkeley Math 142 |
| [mini-compactness](mini-compactness/) | 紧空间、吉洪诺夫定理、局部紧、一点紧化 | MIT 18.901, Princeton MAT 335 |
| [mini-connectedness](mini-connectedness/) | 连通、道路连通、连通分支、局部连通空间 | MIT 18.901, Cambridge Part II |
| [mini-separation-axioms](mini-separation-axioms/) | T0-T6 公理、乌雷松引理、蒂策扩张、可度量化 | MIT 18.902, Harvard Math 131 |
| [mini-convergence-nets](mini-convergence-nets/) | 网、滤子、超滤子、收敛、用网刻画紧性 | MIT 18.902, Oxford Part C |
| [mini-stone-cech-compactification](mini-stone-cech-compactification/) | Stone-Cech 紧化、Wallman 紧化、万有性质 | MIT 18.902, Cambridge Part III |
| [mini-topological-constructions](mini-topological-constructions/) | 积拓扑、商拓扑、子空间拓扑、正向极限 | MIT 18.901, Berkeley Math 142 |

## 设计理念

- **零外部依赖** -- 纯 Lean 4，仅导入内核模块
- **自包含子包** -- 每个子包拥有独立的 `lakefile.lean`、Core/、Morphisms/、Constructions/、Properties/、Theorems/
- **理论到代码的映射** -- 每个模块包含内联 `#eval` 示例和定理陈述

## 构建

每个子包独立构建。使用 Lake 构建：

```bash
cd mini-topological-spaces
lake build
lake env lean --run Test/Smoke.lean
```

需要 **Lean 4** 和 **Lake**。

## 项目结构

```
10. mini-point-set-topology/
├── mini-topological-spaces/              # 拓扑空间、开/闭集、内部、闭包
├── mini-continuity-homeomorphism/        # 连续映射、同胚、嵌入
├── mini-compactness/                     # 紧空间、吉洪诺夫定理、紧化
├── mini-connectedness/                   # 连通、道路连通、连通分支
├── mini-separation-axioms/               # T0-T6 公理、可度量化
├── mini-convergence-nets/                # 网、滤子、超滤子、收敛
├── mini-stone-cech-compactification/     # Stone-Cech 紧化、万有性质
└── mini-topological-constructions/       # 积/商/子空间拓扑、正向极限
```

## 许可证

MIT
