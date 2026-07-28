namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure AutomaticAdmittedObject where
  alphabet : Type
  sequence : Nat → alphabet
  automaton : Type
  isAutomatic : Prop
  acceptance : isAutomatic

structure AdmissibleClass where
  object : AutomaticAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.isAutomatic ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse