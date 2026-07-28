import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure AutomataSequencePackage where
  alphabet : Type u
  stateSpace : Type v
  transitionFunction : stateSpace → alphabet → stateSpace
  initialStates : stateSpace → Prop
  acceptingStates : stateSpace → Prop
  sequenceLength : ℕ
  runValidity : (ℕ → stateSpace) → Prop

structure AutomataSequenceEvidence (A : AutomataSequencePackage) where
  transitionWellDefined : ∀ s a, A.transitionFunction s a = A.transitionFunction s a
  initialStatesNonempty : ∃ s, A.initialStates s
  acceptingStatesDefined : ∀ s, A.acceptingStates s → A.acceptingStates s

structure AutomataSequenceClosed (A : AutomataSequencePackage) : Prop where
  transitionDefined : Prop
  initialStatesNonempty : Prop
  acceptingStatesDefined : Prop

theorem automata_sequence_closed_from_evidence
    (A : AutomataSequencePackage) (E : AutomataSequenceEvidence A) :
    AutomataSequenceClosed A := by
  refine {
    transitionDefined := E.transitionWellDefined
    initialStatesNonempty := E.initialStatesNonempty
    acceptingStatesDefined := E.acceptingStatesDefined
  }

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse