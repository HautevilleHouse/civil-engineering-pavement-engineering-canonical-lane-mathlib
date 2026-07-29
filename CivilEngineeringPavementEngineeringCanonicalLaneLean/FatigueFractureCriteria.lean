import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure FatigueFractureCriteriaPackage where
  tensileStrainAtBottom : Float
  loadRepetitions : Nat
  fatigueCurveSlope : Float
  allowableRepetitions : Nat

structure FatigueFractureCriteriaEvidence (F : FatigueFractureCriteriaPackage) where
  tensileStrainPositive : F.tensileStrainAtBottom > 0.0
  loadRepetitionsFinite : true
  fatigueCurveSlopeNegative : F.fatigueCurveSlope < 0.0
  allowableRepetitionsComputed : F.allowableRepetitions > 0

def FatigueFractureCriteriaClosed (F : FatigueFractureCriteriaPackage) : Prop :=
  F.tensileStrainAtBottom > 0.0 ∧ F.fatigueCurveSlope < 0.0 ∧ F.allowableRepetitions > 0

theorem fatigue_fracture_criteria_closed (F : FatigueFractureCriteriaPackage) (E : FatigueFractureCriteriaEvidence F) : FatigueFractureCriteriaClosed F := by
  exact And.intro E.tensileStrainPositive (And.intro E.fatigueCurveSlopeNegative E.allowableRepetitionsComputed)

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse