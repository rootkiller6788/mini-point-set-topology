import Lake
open Lake DSL

package «mini-connectedness» where

@[default_target]
lean_lib «MiniConnectedness» where

require «mini-object-kernel» from «../../0. mini-math-kernel/mini-object-kernel»
require «mini-topological-spaces» from «../mini-topological-spaces»
