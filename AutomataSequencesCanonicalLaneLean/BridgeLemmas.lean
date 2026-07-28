import .AdmissibleClass

namespace HautevilleHouse
namespace AutomataSequencesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.isAutomatic

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.object.acceptance

end AutomataSequencesCanonicalLaneLean
end HautevilleHouse