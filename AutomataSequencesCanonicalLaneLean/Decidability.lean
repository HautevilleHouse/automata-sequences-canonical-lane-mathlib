import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.AutomaticSequence
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.Kernel

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure DecidabilityPackage {A : AutomaticSequencePackage} where
  emptinessDecidable : Decidable (∀ n, A.sequence n = some_default)
  factorDecidable : ∀ (w : List A.alphabet), Decidable (w ∈ KernelPackage.factors)
  recurrenceDecidable : Decidable (∀ (w : List A.alphabet), ∃ n, w occurs in A.sequence at position n)

def DecidabilityClosed {A : AutomaticSequencePackage} (D : DecidabilityPackage A) : Prop :=
  D.emptinessDecidable ∧ (∀ w, D.factorDecidable w) ∧ D.recurrenceDecidable

theorem decidability_closed_from_evidence {A : AutomaticSequencePackage} (D : DecidabilityPackage A) (E : ∀ w, D.factorDecidable w) (E2 : D.emptinessDecidable) (E3 : D.recurrenceDecidable) : DecidabilityClosed D :=
  by
    exact And.intro E2 (And.intro E E3)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse