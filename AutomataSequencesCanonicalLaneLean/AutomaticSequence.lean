import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure AutomaticSequencePackage where
  alphabet : Type
  sequence : ℕ → alphabet
  automaton : Type
  initialStates : Type
  transitionFunction : automaton → alphabet → automaton
  outputFunction : automaton → alphabet
  initialFunction : ℕ → automaton
  compatibility : Prop

structure AutomaticSequenceEvidence (A : AutomaticSequencePackage) where
  alphabetNonempty : Nonempty A.alphabet
  automatonNonempty : Nonempty A.automaton
  initialStatesNonempty : Nonempty A.initialStates
  compatibilityClosed : A.compatibility

def AutomaticSequenceClosed (A : AutomaticSequencePackage) : Prop :=
  Nonempty A.alphabet ∧ Nonempty A.automaton ∧ Nonempty A.initialStates ∧ A.compatibility

theorem automatic_sequence_closed_from_evidence (A : AutomaticSequencePackage) (E : AutomaticSequenceEvidence A) : AutomaticSequenceClosed A :=
  by
    exact And.intro E.alphabetNonempty (And.intro E.automatonNonempty (And.intro E.initialStatesNonempty E.compatibilityClosed))

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse