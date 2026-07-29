import canonicalLaneMathlib.AdmissibleClass

/-!
# Material Properties Package
-/

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure MaterialPropertiesPackage where
  modulusOfElasticity : Nat
  poissonRatio : Float
  layerCoefficient : Nat

structure MaterialPropertiesEvidence (M : MaterialPropertiesPackage) where
  modulusPositive : M.modulusOfElasticity > 0
  poissonRatioBetweenZeroAndHalf : M.poissonRatio ≥ 0.0 ∧ M.poissonRatio ≤ 0.5
  layerCoefficientPositive : M.layerCoefficient > 0

def MaterialPropertiesClosed (M : MaterialPropertiesPackage) : Prop :=
  M.modulusOfElasticity > 0 ∧ M.poissonRatio ≥ 0.0 ∧ M.poissonRatio ≤ 0.5 ∧ M.layerCoefficient > 0

theorem material_properties_closed_from_evidence
    (M : MaterialPropertiesPackage) (E : MaterialPropertiesEvidence M) :
    MaterialPropertiesClosed M := by
  rcases E.poissonRatioBetweenZeroAndHalf with ⟨h1, h2⟩
  exact And.intro E.modulusPositive (And.intro h1 (And.intro h2 E.layerCoefficientPositive))

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
