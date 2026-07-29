import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure PavementAdmittedObject where
  space : Type
  topology : TopologicalSpace space
  pavementLayer : Type
  layerThickness : ℕ
  structuralCapacity : Prop
  trafficDemand : Prop
  fatigueLife : Prop
  conclusion : fatigueLife

def PavementWitnessClosed (O : PavementAdmittedObject) : Prop :=
  O.fatigueLife

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse