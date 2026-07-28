import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure DFA (Sigma : Type) (Q : Type) where
  start : Q
  accept : Set Q
  transition : Q -> Sigma -> Q

structure NFA (Sigma : Type) (Q : Type) where
  start : Set Q
  accept : Set Q
  transition : Set (Q × Sigma × Q)

structure AutomatonTheoryPackage where
  alphabetType : Type
  stateType : Type
  deterministic : Bool
  acceptsEmptyString : Prop
  language : Set (List alphabetType)
  closureUnderUnion : Prop
  closureUnderConcatenation : Prop
  closureUnderStar : Prop

structure AutomatonTheoryEvidence (P : AutomatonTheoryPackage) where
  acceptsEmptyStringClosed : P.acceptsEmptyString
  closureUnderUnionClosed : P.closureUnderUnion
  closureUnderConcatenationClosed : P.closureUnderConcatenation
  closureUnderStarClosed : P.closureUnderStar

def AutomatonTheoryClosed (P : AutomatonTheoryPackage) : Prop :=
  P.acceptsEmptyString ∧ P.closureUnderUnion ∧
  P.closureUnderConcatenation ∧ P.closureUnderStar

theorem automaton_theory_closed_from_evidence
    (P : AutomatonTheoryPackage) (E : AutomatonTheoryEvidence P) :
    AutomatonTheoryClosed P := by
  exact And.intro E.acceptsEmptyStringClosed
    (And.intro E.closureUnderUnionClosed
      (And.intro E.closureUnderConcatenationClosed
        E.closureUnderStarClosed))

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
