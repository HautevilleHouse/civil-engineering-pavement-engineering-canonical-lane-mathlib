import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure RuttingPermanentDeformationPackage where
  cumulativePlasticStrain : Float
  rutDepth : Float
  loadRepetitions : Nat

structure RuttingPermanentDeformationEvidence (R : RuttingPermanentDeformationPackage) where
  cumulativePlasticStrainNonnegative : R.cumulativePlasticStrain ≥ 0.0
  rutDepthBelowThreshold : R.rutDepth < 20.0
  loadRepetitionsPositive : R.loadRepetitions > 0

def RuttingPermanentDeformationClosed (R : RuttingPermanentDeformationPackage) : Prop :=
  R.cumulativePlasticStrain ≥ 0.0 ∧ R.rutDepth < 20.0 ∧ R.loadRepetitions > 0

theorem rutting_permanent_deformation_closed (R : RuttingPermanentDeformationPackage) (E : RuttingPermanentDeformationEvidence R) : RuttingPermanentDeformationClosed R := by
  exact And.intro E.cumulativePlasticStrainNonnegative (And.intro E.rutDepthBelowThreshold E.loadRepetitionsPositive)

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse