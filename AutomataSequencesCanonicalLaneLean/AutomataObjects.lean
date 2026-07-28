import AutomataSequencesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure Alphabet where
  symbol : Type
  finite : Fintype symbol

structure Automaton where
  states : Type
  alphabet : Alphabet
  transition : states → alphabet.symbol → states
  initialState : states
  accepting : Set states
  deterministic : Prop
  complete : Prop

structure Word (α : Type) where
  letters : List α

partial def accepts (M : Automaton) (w : Word M.alphabet.symbol) : Prop :=
  match w.letters with
  | [] => M.initialState ∈ M.accepting
  | a :: as => 
    let next := M.transition M.initialState a
    accepts (M.mk ...) (Word.mk as)  

  -- Placeholder for full definition


def language (M : Automaton) : Set (Word M.alphabet.symbol) :=
  { w | accepts M w }

structure AutomatonAdmittedObject where
  M : Automaton
  M_rev : Automaton
  lang_rev_eq_rev_lang : language M_rev = { w | language M { w with letters := w.letters.reverse } }
  conclusion : lang_rev_eq_rev_lang

def AutomatonLanguageClosed (O : AutomatonAdmittedObject) : Prop :=
  O.lang_rev_eq_rev_lang

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
