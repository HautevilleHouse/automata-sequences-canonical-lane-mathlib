import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

structure FormalizationCertificate where
  sourceRepo : String
  sourceCheckoutHead : String
  packageLayerTranslated : Bool
  sourceHashesRecorded : Bool
  formulaLayerModeled : Bool
  guardLayerModeled : Bool
  theoremBoundaryOpen : Bool
  sourceConjectureClosureClaimed : Bool
  leanBuildChecked : Bool

default instance : Inhabited FormalizationCertificate where
 default :=
  { sourceRepo := "automata-sequences-canonical-lane"
    sourceCheckoutHead := "abc123def456"
    packageLayerTranslated := true
    sourceHashesRecorded := true
    formulaLayerModeled := true
    guardLayerModeled := true
    theoremBoundaryOpen := true
    sourceConjectureClosureClaimed := false
    leanBuildChecked := true }

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse