import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.AutomaticSequence

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure KernelPackage {A : AutomaticSequencePackage} where
  factors : Set (List A.alphabet)
  uniformRecurrence : Prop
  factorComplexity : ℕ → ℕ
  linearlyRecurrent : Prop

def kernel_subshift {A : AutomaticSequencePackage} (K : KernelPackage A) : Set (ℕ → A.alphabet) :=
  {x | ∀ n, (x 0 :: ... (x n) ...) ∈ K.factors}  -- simplified

structure KernelEvidence {A : AutomaticSequencePackage} (K : KernelPackage A) where
  uniformRecurrenceClosed : K.uniformRecurrence
  factorComplexityClosed : ∀ n, K.factorComplexity n ≤ n + 1
  linearlyRecurrentClosed : K.linearlyRecurrent

def KernelClosed {A : AutomaticSequencePackage} (K : KernelPackage A) : Prop :=
  K.uniformRecurrence ∧ (∀ n, K.factorComplexity n ≤ n + 1) ∧ K.linearlyRecurrent

theorem kernel_closed_from_evidence {A : AutomaticSequencePackage} (K : KernelPackage A) (E : KernelEvidence K) : KernelClosed K :=
  by
    exact And.intro E.uniformRecurrenceClosed (And.intro E.factorComplexityClosed E.linearlyRecurrentClosed)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse