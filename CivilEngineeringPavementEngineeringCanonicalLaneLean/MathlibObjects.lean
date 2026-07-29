import CivilEngineeringPavementEngineeringCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure PavementSection where
  carrier : Type
  topology : TopologicalSpace carrier

structure PavementAdmittedObject where
  section : PavementSection
  closedPavement : Prop
  structuralCapacity : Prop
  modelPavement : Type
  performanceCriteria : TopologicalSpace modelPavement
  designLifeMet : Prop
  conclusion : designLifeMet

structure PavementEndgameState where
  object : PavementAdmittedObject

def PavementWitnessClosed (O : PavementAdmittedObject) : Prop :=
  O.designLifeMet

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse