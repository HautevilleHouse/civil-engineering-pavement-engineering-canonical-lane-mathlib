import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure TrafficLoadingSpectrumPackage where
  axleLoadDistribution : List Float
  trafficGrowthRate : Float
  designLaneFactor : Float
  equivalentSingleAxleLoad : Float

def TrafficLoadingSpectrumClosed (T : TrafficLoadingSpectrumPackage) : Prop :=
  T.axleLoadDistribution ≠ [] ∧ T.equivalentSingleAxleLoad > 0.0

structure TrafficLoadingSpectrumEvidence (T : TrafficLoadingSpectrumPackage) where
  axleLoadDistributionNonempty : T.axleLoadDistribution ≠ []
  equivalentSingleAxleLoadPositive : T.equivalentSingleAxleLoad > 0.0

theorem traffic_loading_spectrum_closed (T : TrafficLoadingSpectrumPackage) (E : TrafficLoadingSpectrumEvidence T) : TrafficLoadingSpectrumClosed T := by
  exact And.intro E.axleLoadDistributionNonempty E.equivalentSingleAxleLoadPositive

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse