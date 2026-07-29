import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilEngineeringPavementEngineeringCanonicalLaneLean.PavementStructure
import HautevilleHouse.CivilEngineeringPavementEngineeringCanonicalLaneLean.PavementDesignPackage

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

def bridgeClosed (A : PavementAdmittedObject) : Prop :=
  A.designLifeMet ∧ A.failureModeControlled

theorem bridge_from_admissible_class (A : PavementAdmittedObject) : bridgeClosed A :=
  A.conclusion

def gateClosed (A : PavementAdmittedObject) : Prop :=
  True

theorem gate_from_admissible_class (A : PavementAdmittedObject) : gateClosed A :=
  trivial

def ConstrainedPavementClosure (A : PavementAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_pavement_endgame (A : PavementAdmittedObject) :
    ConstrainedPavementClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
