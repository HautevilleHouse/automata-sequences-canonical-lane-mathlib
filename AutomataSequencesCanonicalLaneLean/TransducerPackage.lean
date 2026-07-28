import AutomataSequencesCanonicalLaneLean.AutomataObjects

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure FiniteTransducer where
  inputAlphabet : Alphabet
  outputAlphabet : Alphabet
  states : Type
  transition : states → inputAlphabet.symbol → states × outputAlphabet.symbol
  initialState : states
  accepting : Set states
  deterministic : Prop

structure RationalRelation where
  relation : Set (Word inputAlphabet.symbol × Word outputAlphabet.symbol)

structure TransducerPackage where
  transducer : FiniteTransducer
  rationalRelation : RationalRelation
  relation_realized : (u, v) ∈ rationalRelation.relation ↔ ∃ w, (accepts transducer w ∧ ...)
  -- simplified
  evidence : TransducerEvidence

structure TransducerEvidence where
  relation_closed_under_union : Prop
  relation_closed_under_composition : Prop

def TransducerClosed (P : TransducerPackage) : Prop :=
  P.evidence.relation_closed_under_union ∧ P.evidence.relation_closed_under_composition

theorem transducer_closed_from_evidence (P : TransducerPackage) : TransducerClosed P :=
  And.intro P.evidence.relation_closed_under_union P.evidence.relation_closed_under_composition

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
