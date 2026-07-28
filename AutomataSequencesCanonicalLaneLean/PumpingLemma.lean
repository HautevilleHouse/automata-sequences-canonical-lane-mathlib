import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.AutomatonModels

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure PumpingLemmaPackage (P : AutomatonTheoryPackage) where
  pumpingLengthDefined : Prop
  decompositionProperty : Prop
  pumpingConstantExistence : Prop
  nonRegularityTestFormulated : Prop

structure PumpingLemmaEvidence {P : AutomatonTheoryPackage}
    (L : PumpingLemmaPackage P) where
  pumpingLengthDefinedClosed : L.pumpingLengthDefined
  decompositionPropertyClosed : L.decompositionProperty
  pumpingConstantExistenceClosed : L.pumpingConstantExistence
  nonRegularityTestFormulatedClosed : L.nonRegularityTestFormulated

def PumpingLemmaClosed {P : AutomatonTheoryPackage}
    (L : PumpingLemmaPackage P) : Prop :=
  L.pumpingLengthDefined ∧ L.decompositionProperty ∧
  L.pumpingConstantExistence ∧ L.nonRegularityTestFormulated

theorem pumping_lemma_closed_from_evidence
    {P : AutomatonTheoryPackage} (L : PumpingLemmaPackage P)
    (E : PumpingLemmaEvidence L) : PumpingLemmaClosed L := by
  exact And.intro E.pumpingLengthDefinedClosed
    (And.intro E.decompositionPropertyClosed
      (And.intro E.pumpingConstantExistenceClosed
        E.nonRegularityTestFormulatedClosed))

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
