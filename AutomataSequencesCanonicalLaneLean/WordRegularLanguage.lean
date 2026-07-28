import AutomataSequencesCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure RegularLanguage where
  alphabet : Type u
  words : ℕ → List alphabet
  regular : Prop
  pumpingLemma : Prop
  myhillNerode : Prop
  regularTerm : regular
  pumpingLemmaTerm : pumpingLemma
  myhillNerodeTerm : myhillNerode

structure RegularLanguageEvidence (L : RegularLanguage) where
  regularClosed : L.regular
  pumpingLemmaClosed : L.pumpingLemma
  myhillNerodeClosed : L.myhillNerode

def RegularLanguageClosed (L : RegularLanguage) : Prop :=
  L.regular ∧ L.pumpingLemma ∧ L.myhillNerode

theorem regular_language_closed_from_evidence (L : RegularLanguage) (E : RegularLanguageEvidence L) :
    RegularLanguageClosed L := by
  exact And.intro E.regularClosed (And.intro E.pumpingLemmaClosed E.myhillNerodeClosed)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
