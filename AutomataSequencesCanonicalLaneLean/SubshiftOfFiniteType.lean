import AutomataSequencesCanonicalLaneLean.MorphicSequence

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure SubshiftOfFiniteType where
  alphabet : Type u
  shiftSpace : Set (ℕ → alphabet)
  forbiddenWords : List (List alphabet)
  sofic : Prop
  mixing : Prop
  soficTerm : sofic
  mixingTerm : mixing

structure SubshiftOfFiniteTypeEvidence (S : SubshiftOfFiniteType) where
  soficClosed : S.sofic
  mixingClosed : S.mixing

def SubshiftOfFiniteTypeClosed (S : SubshiftOfFiniteType) : Prop :=
  S.sofic ∧ S.mixing

theorem subshift_of_finite_type_closed_from_evidence (S : SubshiftOfFiniteType) (E : SubshiftOfFiniteTypeEvidence S) :
    SubshiftOfFiniteTypeClosed S := by
  exact And.intro E.soficClosed E.mixingClosed

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
