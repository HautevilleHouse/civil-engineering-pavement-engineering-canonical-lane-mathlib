import canonicalLaneMathlib.AdmissibleClass

/-!
# Performance Prediction Package
-/

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure PerformancePredictionPackage where
  pavementAge : Nat
  trafficLoad : Nat
  structuralNumber : Nat
  predictedLife : Nat

structure PerformancePredictionEvidence (P : PerformancePredictionPackage) where
  pavementAgeNonnegative : P.pavementAge ≥ 0
  trafficLoadPositive : P.trafficLoad > 0
  predictedLifePositive : P.predictedLife > 0

def PerformancePredictionClosed (P : PerformancePredictionPackage) : Prop :=
  P.predictedLife > 0

theorem performance_prediction_closed_from_evidence
    (P : PerformancePredictionPackage) (E : PerformancePredictionEvidence P) :
    PerformancePredictionClosed P := by
  exact E.predictedLifePositive

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
