import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure AsphaltBinderPackage where
  binderGrade : String
  penetration : Float
  softeningPoint : Float
  viscosityTemperatureRelation : Prop

structure AsphaltBinderEvidence (A : AsphaltBinderPackage) where
  penetrationClosed : A.penetration > 0.0
  softeningPointClosed : A.softeningPoint > 0.0
  viscosityTemperatureRelationClosed : A.viscosityTemperatureRelation

def AsphaltBinderClosed (A : AsphaltBinderPackage) : Prop :=
  A.penetration > 0.0 ∧ A.softeningPoint > 0.0 ∧ A.viscosityTemperatureRelation

theorem asphalt_binder_closed_from_evidence (A : AsphaltBinderPackage) (E : AsphaltBinderEvidence A) : AsphaltBinderClosed A := by
  exact And.intro E.penetrationClosed (And.intro E.softeningPointClosed E.viscosityTemperatureRelationClosed)

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse