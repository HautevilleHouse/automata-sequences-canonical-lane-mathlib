import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.AutomatonModels

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure KleeneTheoremPackage (P : AutomatonTheoryPackage) where
  regularExprToAutomatonConstruction : Prop
  automatonToRegularExprConstruction : Prop
  closureEquivalenceProved : Prop
  sizeBoundConstruction : Prop

structure KleeneTheoremEvidence {P : AutomatonTheoryPackage}
    (K : KleeneTheoremPackage P) where
  regularExprToAutomatonConstructionClosed : K.regularExprToAutomatonConstruction
  automatonToRegularExprConstructionClosed : K.automatonToRegularExprConstruction
  closureEquivalenceProvedClosed : K.closureEquivalenceProved
  sizeBoundConstructionClosed : K.sizeBoundConstruction

def KleeneTheoremClosed {P : AutomatonTheoryPackage}
    (K : KleeneTheoremPackage P) : Prop :=
  K.regularExprToAutomatonConstruction ∧
  K.automatonToRegularExprConstruction ∧
  K.closureEquivalenceProved ∧
  K.sizeBoundConstruction

theorem kleene_theorem_closed_from_evidence
    {P : AutomatonTheoryPackage} (K : KleeneTheoremPackage P)
    (E : KleeneTheoremEvidence K) : KleeneTheoremClosed K := by
  exact And.intro E.regularExprToAutomatonConstructionClosed
    (And.intro E.automatonToRegularExprConstructionClosed
      (And.intro E.closureEquivalenceProvedClosed
        E.sizeBoundConstructionClosed))

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
