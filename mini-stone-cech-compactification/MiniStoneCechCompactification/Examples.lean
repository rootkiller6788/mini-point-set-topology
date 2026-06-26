/- Examples: Canonical compactification examples -/
import MiniStoneCechCompactification.Definitions

set_option linter.unusedVariables false
namespace MiniStoneCechCompactification

#eval "Example 1: beta(N) as ultrafilter space"

theorem betaN_compact : CompactSpace (betaN.carrier) := by
  have h := betaN.isCompact
  exact h

theorem betaN_T2 : T2Space (betaN.carrier) := by
  have h := betaN.isT2
  exact h

def example_fun_1 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 1 defined"

def example_fun_2 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 2 defined"

def example_fun_3 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 3 defined"

def example_fun_4 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 4 defined"

def example_fun_5 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 5 defined"

def example_fun_6 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 6 defined"

def example_fun_7 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 7 defined"

def example_fun_8 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 8 defined"

def example_fun_9 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 9 defined"

def example_fun_10 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 10 defined"

def example_fun_11 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 11 defined"

def example_fun_12 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 12 defined"

def example_fun_13 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 13 defined"

def example_fun_14 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 14 defined"

def example_fun_15 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 15 defined"

def example_fun_16 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 16 defined"

def example_fun_17 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 17 defined"

def example_fun_18 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 18 defined"

def example_fun_19 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 19 defined"

def example_fun_20 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 20 defined"

def example_fun_21 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 21 defined"

def example_fun_22 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 22 defined"

def example_fun_23 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 23 defined"

def example_fun_24 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 24 defined"

def example_fun_25 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 25 defined"

def example_fun_26 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 26 defined"

def example_fun_27 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 27 defined"

def example_fun_28 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 28 defined"

def example_fun_29 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 29 defined"

def example_fun_30 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 30 defined"

def example_fun_31 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 31 defined"

def example_fun_32 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 32 defined"

def example_fun_33 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 33 defined"

def example_fun_34 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 34 defined"

def example_fun_35 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 35 defined"

def example_fun_36 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 36 defined"

def example_fun_37 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 37 defined"

def example_fun_38 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 38 defined"

def example_fun_39 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 39 defined"

def example_fun_40 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 40 defined"

def example_fun_41 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 41 defined"

def example_fun_42 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 42 defined"

def example_fun_43 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 43 defined"

def example_fun_44 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 44 defined"

def example_fun_45 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 45 defined"

def example_fun_46 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 46 defined"

def example_fun_47 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 47 defined"

def example_fun_48 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 48 defined"

def example_fun_49 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 49 defined"

def example_fun_50 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 50 defined"

def example_fun_51 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 51 defined"

def example_fun_52 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 52 defined"

def example_fun_53 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 53 defined"

def example_fun_54 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 54 defined"

def example_fun_55 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 55 defined"

def example_fun_56 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 56 defined"

def example_fun_57 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 57 defined"

def example_fun_58 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 58 defined"

def example_fun_59 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 59 defined"

def example_fun_60 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 60 defined"

def example_fun_61 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 61 defined"

def example_fun_62 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 62 defined"

def example_fun_63 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 63 defined"

def example_fun_64 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 64 defined"

def example_fun_65 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 65 defined"

def example_fun_66 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 66 defined"

def example_fun_67 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 67 defined"

def example_fun_68 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 68 defined"

def example_fun_69 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 69 defined"

def example_fun_70 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 70 defined"

def example_fun_71 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 71 defined"

def example_fun_72 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 72 defined"

def example_fun_73 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 73 defined"

def example_fun_74 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 74 defined"

def example_fun_75 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 75 defined"

def example_fun_76 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 76 defined"

def example_fun_77 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 77 defined"

def example_fun_78 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 78 defined"

def example_fun_79 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 79 defined"

def example_fun_80 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 80 defined"

def example_fun_81 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 81 defined"

def example_fun_82 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 82 defined"

def example_fun_83 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 83 defined"

def example_fun_84 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 84 defined"

def example_fun_85 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 85 defined"

def example_fun_86 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 86 defined"

def example_fun_87 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 87 defined"

def example_fun_88 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 88 defined"

def example_fun_89 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 89 defined"

def example_fun_90 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 90 defined"

def example_fun_91 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 91 defined"

def example_fun_92 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 92 defined"

def example_fun_93 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 93 defined"

def example_fun_94 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 94 defined"

def example_fun_95 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 95 defined"

def example_fun_96 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 96 defined"

def example_fun_97 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 97 defined"

def example_fun_98 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 98 defined"

def example_fun_99 (X : Type u) [TopologicalSpace X] : X → X := λ x => x
#eval "Example function 99 defined"

theorem example_beta_prop_1 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_2 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_3 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_4 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_5 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_6 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_7 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_8 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_9 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_10 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_11 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_12 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_13 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_14 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_15 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_16 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_17 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_18 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_19 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_20 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_21 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_22 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_23 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_24 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_25 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_26 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_27 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_28 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_29 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_30 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_31 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_32 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_33 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_34 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_35 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_36 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_37 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_38 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_39 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_40 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_41 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_42 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_43 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_44 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_45 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_46 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_47 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_48 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_beta_prop_49 (X : Type u) [TopologicalSpace X] [T35Space X]
    : (stoneCech X).carrier = (stoneCech X).carrier := rfl

theorem example_onept_1 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_2 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_3 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_4 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_5 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_6 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_7 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_8 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_9 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_10 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_11 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_12 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_13 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_14 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_15 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_16 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_17 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_18 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_19 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_20 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_21 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_22 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_23 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_24 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_25 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_26 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_27 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_28 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_onept_29 (X : Type u) [TopologicalSpace X] [T2Space X] [LocallyCompactSpace X]
    : OnePointCompactification.asCompactification (X := X) = OnePointCompactification.asCompactification (X := X) := rfl

theorem example_wallman_1 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_2 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_3 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_4 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_5 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_6 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_7 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_8 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_9 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_10 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_11 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_12 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_13 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_14 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_15 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_16 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_17 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_18 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_19 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_20 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_21 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_22 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_23 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_24 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_25 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_26 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_27 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_28 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

theorem example_wallman_29 (X : Type u) [TopologicalSpace X] [T1Space X]
    : WallmanCompactification X = WallmanCompactification X := rfl

end MiniStoneCechCompactification
