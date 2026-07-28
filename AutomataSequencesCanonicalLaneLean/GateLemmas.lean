import .BridgeLemmas

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  A.gateWitness

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse