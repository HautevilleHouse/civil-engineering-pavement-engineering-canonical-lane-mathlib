import canonicalLaneMathlib.AdmissibleClass

/-!
# Traffic Load Model Package
-/

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure TrafficLoadModelPackage where
  esalPerYear : Nat
  growthRate : Float
  designLifetime : Nat
  totalESALs : Nat

structure TrafficLoadModelEvidence (M : TrafficLoadModelPackage) where
  esalPerYearPositive : M.esalPerYear > 0
  growthRateNonnegative : M.growthRate ≥ 0.0
  totalESALsCalculated : M.totalESALs > 1000

def TrafficLoadModelClosed (M : TrafficLoadModelPackage) : Prop :=
  M.esalPerYear > 0 ∧ M.totalESALs > 1000

theorem traffic_load_model_closed_from_evidence
    (M : TrafficLoadModelPackage) (E : TrafficLoadModelEvidence M) :
    TrafficLoadModelClosed M := by
  exact And.intro E.esalPerYearPositive E.totalESALsCalculated

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
