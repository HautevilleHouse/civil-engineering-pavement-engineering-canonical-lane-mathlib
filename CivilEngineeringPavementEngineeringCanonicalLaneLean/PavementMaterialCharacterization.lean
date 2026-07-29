import CivilEngineeringPavementEngineeringCanonicalLaneLean.MathlibObjects

/-!
# Pavement Material Characterization Package

This module defines the mechanical and thermal characterization of pavement materials
including asphalt concrete, portland cement concrete, and granular bases.
-/

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure PavementMaterialPackage where
  materialType : String  -- "asphalt", "concrete", "granular"
  modulusOfElasticity : ℝ
  poissonRatio : ℝ
  thermalExpansionCoeff : ℝ
  fatigueCoefficients : ℝ × ℝ
  creepCompliance : ℝ → ℝ  -- function of time

default instance : Inhabited PavementMaterialPackage where
  default := {
    materialType := "asphalt"
    modulusOfElasticity := 3000  -- MPa
    poissonRatio := 0.35
    thermalExpansionCoeff := 2.3e-5  -- 1/°C
    fatigueCoefficients := (0.0005, 0.25)
    creepCompliance := λ t => 0.1 * t ^ 0.3
  }

structure PavementMaterialEvidence (M : PavementMaterialPackage) where
  modulusOfElasticityClosed : M.modulusOfElasticity > 0
  poissonRatioClosed : 0 < M.poissonRatio ∧ M.poissonRatio < 0.5
  thermalExpansionCoeffClosed : M.thermalExpansionCoeff > 0
  fatigueCoefficientsClosed : M.fatigueCoefficients.1 > 0 ∧ M.fatigueCoefficients.2 > 0
  creepComplianceClosed : M.creepCompliance 0 = 0

def PavementMaterialClosed (M : PavementMaterialPackage) : Prop :=
  M.modulusOfElasticity > 0 ∧
  (0 < M.poissonRatio ∧ M.poissonRatio < 0.5) ∧
  M.thermalExpansionCoeff > 0 ∧
  (M.fatigueCoefficients.1 > 0 ∧ M.fatigueCoefficients.2 > 0) ∧
  M.creepCompliance 0 = 0

theorem pavement_material_closed_from_evidence (M : PavementMaterialPackage)
    (E : PavementMaterialEvidence M) : PavementMaterialClosed M := by
  exact And.intro E.modulusOfElasticityClosed
    (And.intro E.poissonRatioClosed
      (And.intro E.thermalExpansionCoeffClosed
        (And.intro E.fatigueCoefficientsClosed E.creepComplianceClosed)))

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse