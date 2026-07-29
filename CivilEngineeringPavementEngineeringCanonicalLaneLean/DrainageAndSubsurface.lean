import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure DrainageLayerDesign where
  permeability : Prop
  layerThickness : Prop
  filterCriteria : Prop
  permeabilityTerm : permeability
  layerThicknessTerm : layerThickness
  filterCriteriaTerm : filterCriteria

structure SubsurfaceWaterFlow where
  darcyFlow : Prop
  unsaturatedFlow : Prop
  waterTableDepth : Prop
  darcyFlowTerm : darcyFlow
  unsaturatedFlowTerm : unsaturatedFlow
  waterTableDepthTerm : waterTableDepth

structure FrostProtection where
  frostDepth : Prop
  heavePotential : Prop
  drainageCriticalPeriod : Prop
  frostDepthTerm : frostDepth
  heavePotentialTerm : heavePotential
  drainageCriticalPeriodTerm : drainageCriticalPeriod

def drainageAndSubsurfaceClosed (D : DrainageLayerDesign) (W : SubsurfaceWaterFlow) (F : FrostProtection) : Prop :=
  D.permeability ∧ D.layerThickness ∧ D.filterCriteria ∧
  W.darcyFlow ∧ W.unsaturatedFlow ∧ W.waterTableDepth ∧
  F.frostDepth ∧ F.heavePotential ∧ F.drainageCriticalPeriod

theorem drainage_and_subsurface_closed (D : DrainageLayerDesign) (W : SubsurfaceWaterFlow) (F : FrostProtection) (Ed : DrainageLayerDesignEvidence D) (Ew : SubsurfaceWaterFlowEvidence W) (Ef : FrostProtectionEvidence F) : drainageAndSubsurfaceClosed D W F :=
  by
    exact And.intro Ed.permeabilityClosed (And.intro Ed.layerThicknessClosed (And.intro Ed.filterCriteriaClosed
      (And.intro Ew.darcyFlowClosed (And.intro Ew.unsaturatedFlowClosed (And.intro Ew.waterTableDepthClosed
        (And.intro Ef.frostDepthClosed (And.intro Ef.heavePotentialClosed Ef.drainageCriticalPeriodClosed)))))))

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse