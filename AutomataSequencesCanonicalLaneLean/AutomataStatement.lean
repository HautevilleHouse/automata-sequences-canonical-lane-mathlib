import AutomataSequencesCanonicalLaneLean.RegularLanguagePackage
import AutomataSequencesCanonicalLaneLean.TransducerPackage

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure AutomataTheoremStatement where
  regularLanguageClosure : RegularLanguagePackage
  transducerClosure : TransducerPackage
  fundamentalTheorem : Prop  -- Kleene's theorem or closure properties
  evidence : AutomataTheoremEvidence

structure AutomataTheoremEvidence where
  regularLanguageClosureClosed : RegularLanguageClosed regularLanguageClosure
  transducerClosureClosed : TransducerClosed transducerClosure
  fundamentalTheoremClosed : fundamentalTheorem

def AutomataTheoremClosed (S : AutomataTheoremStatement) : Prop :=
  RegularLanguageClosed S.regularLanguageClosure ∧ TransducerClosed S.transducerClosure ∧ S.fundamentalTheorem

theorem automata_theorem_closed_from_evidence (S : AutomataTheoremStatement) (E : AutomataTheoremEvidence) : AutomataTheoremClosed S :=
  And.intro E.regularLanguageClosureClosed (And.intro E.transducerClosureClosed E.fundamentalTheoremClosed)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
