import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure AxleLoadSpectrum where
  singleAxle : Prop
  tandemAxle : Prop
  tridemAxle : Prop
  loadDistribution : Prop
  singleAxleTerm : singleAxle
  tandemAxleTerm : tandemAxle
  tridemAxleTerm : tridemAxle
  loadDistributionTerm : loadDistribution

structure LoadEquivalencyFactors where
  esalFactors : Prop
  damageRatios : Prop
  esalFactorsTerm : esalFactors
  damageRatiosTerm : damageRatios

structure TrafficGrowthModel where
  annualGrowthRate : Prop
  designLaneFactor : Prop
  directionalDistribution : Prop
  annualGrowthRateTerm : annualGrowthRate
  designLaneFactorTerm : designLaneFactor
  directionalDistributionTerm : directionalDistribution

def trafficLoadingClosed (A : AxleLoadSpectrum) (L : LoadEquivalencyFactors) (G : TrafficGrowthModel) : Prop :=
  A.singleAxle ∧ A.tandemAxle ∧ A.tridemAxle ∧ A.loadDistribution ∧
  L.esalFactors ∧ L.damageRatios ∧
  G.annualGrowthRate ∧ G.designLaneFactor ∧ G.directionalDistribution

theorem traffic_loading_closed (A : AxleLoadSpectrum) (L : LoadEquivalencyFactors) (G : TrafficGrowthModel) (Ea : AxleLoadSpectrumEvidence A) (El : LoadEquivalencyFactorsEvidence L) (Eg : TrafficGrowthModelEvidence G) : trafficLoadingClosed A L G :=
  by
    exact And.intro Ea.singleAxleClosed (And.intro Ea.tandemAxleClosed (And.intro Ea.tridemAxleClosed (And.intro Ea.loadDistributionClosed
      (And.intro El.esalFactorsClosed (And.intro El.damageRatiosClosed
        (And.intro Eg.annualGrowthRateClosed (And.intro Eg.designLaneFactorClosed Eg.directionalDistributionClosed)))))))

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse