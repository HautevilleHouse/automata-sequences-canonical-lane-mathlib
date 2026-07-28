import .GateLemmas

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

def ConstrainedAutomaticSequenceClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_automatic_sequence_endgame (A : AdmissibleClass) :
    ConstrainedAutomaticSequenceClosure A :=
  And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse