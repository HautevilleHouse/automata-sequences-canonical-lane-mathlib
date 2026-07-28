import AutomataSequencesCanonicalLaneLean.AutomataObjects

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure RegularExpression (α : Type) where
  expr : Type
  -- operations: empty, epsilon, symbol, union, concat, star
  empty : Prop
  epsilon : Prop
  symbol : α → Prop
  union : RegularExpression α → RegularExpression α → Prop
  concat : RegularExpression α → RegularExpression α → Prop
  star : RegularExpression α → Prop
  denotation : Set (Word α)

structure RegularLanguagePackage where
  automaton_to_regex : (M : Automaton) → RegularExpression M.alphabet.symbol
  regex_to_automaton : (r : RegularExpression α) → Automaton
  equivalence_proof : (M : Automaton) → language M = (automaton_to_regex M).denotation
  closure_evidence : RegularLanguageEvidence

structure RegularLanguageEvidence where
  union_closed : Prop
  intersection_closed : Prop
  complement_closed : Prop

def RegularLanguageClosed (P : RegularLanguagePackage) : Prop :=
  P.closure_evidence.union_closed ∧ P.closure_evidence.intersection_closed ∧ P.closure_evidence.complement_closed

theorem regular_language_closed_from_evidence (P : RegularLanguagePackage) : RegularLanguageClosed P :=
  And.intro P.closure_evidence.union_closed (And.intro P.closure_evidence.intersection_closed P.closure_evidence.complement_closed)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
