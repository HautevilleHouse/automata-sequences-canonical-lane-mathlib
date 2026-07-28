import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.AutomatonModels

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure MyhillNerodePackage (P : AutomatonTheoryPackage) where
  rightInvariantEquivalenceDefined : Prop
  minimalDFAConstructed : Prop
  languageEquivalenceClassCorrespondence : Prop
  minimalityProved : Prop

structure MyhillNerodeEvidence {P : AutomatonTheoryPackage}
    (M : MyhillNerodePackage P) where
  rightInvariantEquivalenceDefinedClosed : M.rightInvariantEquivalenceDefined
  minimalDFAConstructedClosed : M.minimalDFAConstructed
  languageEquivalenceClassCorrespondenceClosed : M.languageEquivalenceClassCorrespondence
  minimalityProvedClosed : M.minimalityProved

def MyhillNerodeClosed {P : AutomatonTheoryPackage}
    (M : MyhillNerodePackage P) : Prop :=
  M.rightInvariantEquivalenceDefined ∧
  M.minimalDFAConstructed ∧
  M.languageEquivalenceClassCorrespondence ∧
  M.minimalityProved

theorem myhill_nerode_closed_from_evidence
    {P : AutomatonTheoryPackage} (M : MyhillNerodePackage P)
    (E : MyhillNerodeEvidence M) : MyhillNerodeClosed M := by
  exact And.intro E.rightInvariantEquivalenceDefinedClosed
    (And.intro E.minimalDFAConstructedClosed
      (And.intro E.languageEquivalenceClassCorrespondenceClosed
        E.minimalityProvedClosed))

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
