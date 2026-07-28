import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.AutomaticSequence

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure SubstitutionPackage {A : AutomaticSequencePackage} where
  morphism : A.alphabet → List A.alphabet
  length : A.alphabet → ℕ
  primitive : Prop
  prolongable : Prop

def substitution_iterate {A : AutomaticSequencePackage} (S : SubstitutionPackage A) (n : ℕ) (a : A.alphabet) : List A.alphabet :=
  Nat.recOn n [a] (λ _ ih => S.morphism a)

structure SubstitutionEvidence {A : AutomaticSequencePackage} (S : SubstitutionPackage A) where
  primitiveClosed : S.primitive
  prolongableClosed : S.prolongable
  fixedPointExists : Prop

def SubstitutionClosed {A : AutomaticSequencePackage} (S : SubstitutionPackage A) : Prop :=
  S.primitive ∧ S.prolongable ∧ SubstitutionEvidence.substitution_evidence.fixedPointExists

theorem substitution_closed_from_evidence {A : AutomaticSequencePackage} (S : SubstitutionPackage A) (E : SubstitutionEvidence S) : SubstitutionClosed S :=
  by
    exact And.intro E.primitiveClosed (And.intro E.prolongableClosed E.fixedPointExists)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse