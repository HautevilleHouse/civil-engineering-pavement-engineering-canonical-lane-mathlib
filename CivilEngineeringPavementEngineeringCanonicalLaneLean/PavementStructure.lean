import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure PavementSection where
  layerTypes : List String
  thicknesses : List Float
  materialProperties : List Float

definition pavementSafetyFactor : Prop := True

definition pavementServiceability : Prop := True

structure PavementAdmittedObject where
  section : PavementSection
  designLifeMet : Prop
  failureModeControlled : Prop
  conclusion : designLifeMet ∧ failureModeControlled

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
