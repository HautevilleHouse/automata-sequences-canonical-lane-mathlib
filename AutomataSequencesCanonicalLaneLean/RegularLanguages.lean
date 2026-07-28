import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomataSequencesCanonicalLaneLean.AutomatonModels

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure RegularLanguagePackage (P : AutomatonTheoryPackage) where
  describesSameSetAsDFA : Prop
  describesSameSetAsNFA : Prop
  closedUnderComplement : Prop
  closedUnderIntersection : Prop
  closedUnderReverse : Prop

structure RegularLanguageEvidence {P : AutomatonTheoryPackage}
    (R : RegularLanguagePackage P) where
  describesSameSetAsDFAClosed : R.describesSameSetAsDFA
  describesSameSetAsNFAClosed : R.describesSameSetAsNFA
  closedUnderComplementClosed : R.closedUnderComplement
  closedUnderIntersectionClosed : R.closedUnderIntersection
  closedUnderReverseClosed : R.closedUnderReverse

def RegularLanguageClosed {P : AutomatonTheoryPackage}
    (R : RegularLanguagePackage P) : Prop :=
  R.describesSameSetAsDFA ∧ R.describesSameSetAsNFA ∧
  R.closedUnderComplement ∧ R.closedUnderIntersection ∧
  R.closedUnderReverse

theorem regular_language_closed_from_evidence
    {P : AutomatonTheoryPackage} (R : RegularLanguagePackage P)
    (E : RegularLanguageEvidence R) : RegularLanguageClosed R := by
  exact And.intro E.describesSameSetAsDFAClosed
    (And.intro E.describesSameSetAsNFAClosed
      (And.intro E.closedUnderComplementClosed
        (And.intro E.closedUnderIntersectionClosed
          E.closedUnderReverseClosed)))

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
