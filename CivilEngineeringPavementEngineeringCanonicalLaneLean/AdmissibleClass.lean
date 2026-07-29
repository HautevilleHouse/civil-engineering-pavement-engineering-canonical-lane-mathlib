import CivilEngineeringPavementEngineeringCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure AdmissibleClass where
  object : PavementAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PavementWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse