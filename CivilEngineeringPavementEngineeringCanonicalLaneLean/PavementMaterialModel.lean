import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure PavementMaterialModel where
  layerThickness : ℕ → ℝ
  elasticModulus : ℕ → ℝ
  poissonRatio : ℕ → ℝ
  stressDistribution : ℕ → ℝ → ℝ
  temperatureSusceptibility : Prop
  fatigueLife : Prop

structure PavementMaterialEvidence (M : PavementMaterialModel) where
  temperatureSusceptibilityClosed : M.temperatureSusceptibility
  fatigueLifeClosed : M.fatigueLife

def PavementMaterialClosed (M : PavementMaterialModel) : Prop :=
  M.temperatureSusceptibility ∧ M.fatigueLife

theorem pavement_material_closed_from_evidence (M : PavementMaterialModel) (E : PavementMaterialEvidence M) :
    PavementMaterialClosed M := by
  exact And.intro E.temperatureSusceptibilityClosed E.fatigueLifeClosed

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
