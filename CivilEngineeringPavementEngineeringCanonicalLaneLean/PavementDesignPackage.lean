import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringPavementEngineeringCanonicalLaneLean.PavementStructure

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure PavementDesignPackage (A : PavementAdmittedObject) where
  trafficLoading : Prop
  environmentalFactors : Prop
  materialDegradationModel : Prop
  structuralResponseModel : Prop
  fatigueLifePrediction : Prop
  thermalCrackingPrediction : Prop
  designIterationClosed : Prop

structure PavementDesignEvidence {A : PavementAdmittedObject} (D : PavementDesignPackage A) where
  trafficLoadingClosed : D.trafficLoading
  environmentalFactorsClosed : D.environmentalFactors
  materialDegradationModelClosed : D.materialDegradationModel
  structuralResponseModelClosed : D.structuralResponseModel
  fatigueLifePredictionClosed : D.fatigueLifePrediction
  thermalCrackingPredictionClosed : D.thermalCrackingPrediction
  designIterationClosed : D.designIterationClosed

def PavementDesignClosed {A : PavementAdmittedObject} (D : PavementDesignPackage A) : Prop :=
  D.trafficLoading ∧ D.environmentalFactors ∧ D.materialDegradationModel ∧
  D.structuralResponseModel ∧ D.fatigueLifePrediction ∧ D.thermalCrackingPrediction ∧
  D.designIterationClosed

theorem pavement_design_closed_from_evidence
  {A : PavementAdmittedObject} (D : PavementDesignPackage A) (E : PavementDesignEvidence D) :
  PavementDesignClosed D := by
  exact And.intro E.trafficLoadingClosed
    (And.intro E.environmentalFactorsClosed
      (And.intro E.materialDegradationModelClosed
        (And.intro E.structuralResponseModelClosed
          (And.intro E.fatigueLifePredictionClosed
            (And.intro E.thermalCrackingPredictionClosed E.designIterationClosed)))))

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
