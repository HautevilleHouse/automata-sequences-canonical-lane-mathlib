import AutomataSequencesCanonicalLaneLean.AutomaticSequence

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure MorphicSequence where
  alphabet : Type u
  seq : ℕ → alphabet
  morphic : Prop
  pureMorphic : Prop
  uniformMorphic : Prop
  morphicTerm : morphic
  pureMorphicTerm : pureMorphic
  uniformMorphicTerm : uniformMorphic

structure MorphicSequenceEvidence (M : MorphicSequence) where
  morphicClosed : M.morphic
  pureMorphicClosed : M.pureMorphic
  uniformMorphicClosed : M.uniformMorphic

def MorphicSequenceClosed (M : MorphicSequence) : Prop :=
  M.morphic ∧ M.pureMorphic ∧ M.uniformMorphic

theorem morphic_sequence_closed_from_evidence (M : MorphicSequence) (E : MorphicSequenceEvidence M) :
    MorphicSequenceClosed M := by
  exact And.intro E.morphicClosed (And.intro E.pureMorphicClosed E.uniformMorphicClosed)

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse
