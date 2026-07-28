import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure AutomataSpace where
  carrier : Type
  alphabet : Type

def AutomataWitnessClosed (O : AutomataAdmittedObject) : Prop :=
  O.hasAcceptingRun

structure AutomataAdmittedObject where
  space : AutomataSpace
  finiteStateAutomaton : Prop
  deterministic : Prop
  hasAcceptingRun : Prop
  conclusion : hasAcceptingRun

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse