import CivilEngineeringPavementEngineeringCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PavementWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse