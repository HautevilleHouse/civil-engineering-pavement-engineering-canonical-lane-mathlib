import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure MechanisticResponseModel where
  criticalStresses : Prop
  criticalStrains : Prop
  stressStrainClosed : criticalStresses ∧ criticalStrains
  stressStrainTerm : stressStrainClosed

structure TransferFunctions where
  fatigueLife : Prop
  ruttingLife : Prop
  reliabilityAdjustment : Prop
  fatigueLifeTerm : fatigueLife
  ruttingLifeTerm : ruttingLife
  reliabilityAdjustmentTerm : reliabilityAdjustment

def transferFunctionsClosed (T : TransferFunctions) : Prop :=
  T.fatigueLife ∧ T.ruttingLife ∧ T.reliabilityAdjustment

theorem transfer_functions_closed (T : TransferFunctions) : transferFunctionsClosed T :=
  And.intro T.fatigueLifeTerm (And.intro T.ruttingLifeTerm T.reliabilityAdjustmentTerm)

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse