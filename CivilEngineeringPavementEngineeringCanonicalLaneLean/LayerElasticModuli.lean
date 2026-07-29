import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure LayerElasticModuliPackage where
  surfaceModulus : Float
  baseModulus : Float
  subbaseModulus : Float
  subgradeModulus : Float

structure LayerElasticModuliEvidence (L : LayerElasticModuliPackage) where
  surfaceModulusPositive : L.surfaceModulus > 0.0
  baseModulusPositive : L.baseModulus > 0.0
  subbaseModulusPositive : L.subbaseModulus > 0.0
  subgradeModulusPositive : L.subgradeModulus > 0.0

def LayerElasticModuliClosed (L : LayerElasticModuliPackage) : Prop :=
  L.surfaceModulus > 0.0 ∧ L.baseModulus > 0.0 ∧ L.subbaseModulus > 0.0 ∧ L.subgradeModulus > 0.0

theorem layer_elastic_moduli_closed_from_evidence (L : LayerElasticModuliPackage) (E : LayerElasticModuliEvidence L) : LayerElasticModuliClosed L := by
  exact And.intro E.surfaceModulusPositive (And.intro E.baseModulusPositive (And.intro E.subbaseModulusPositive E.subgradeModulusPositive))

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse