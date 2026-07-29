import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringPavementEngineeringCanonicalLaneLean.PavementDesignPackage

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure MechanisticEmpiricalClosurePackage {A : PavementAdmittedObject}
    (D : PavementDesignPackage A) where
  transferFunctionsCalibrated : Prop
  reliabilityAnalysisPerformed : Prop
  performanceCriteriaSatisfied : Prop
  closureEvidence : Prop

def PavementAdmissibleClosure {A : PavementAdmittedObject}
    (M : MechanisticEmpiricalClosurePackage (A := A) (D := ?_)) : Prop :=
  M.transferFunctionsCalibrated ∧ M.reliabilityAnalysisPerformed ∧
  M.performanceCriteriaSatisfied ∧ M.closureEvidence

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
