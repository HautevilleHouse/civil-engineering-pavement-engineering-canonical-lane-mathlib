import canonicalLaneMathlib.AdmissibleClass

/-!
# Structural Design Package
-/

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure StructuralDesignPackage where
  structuralNumber : Nat
  layerThicknesses : List Nat
  layerCoefficients : List Nat
  drainageCoefficients : List Float

structure StructuralDesignEvidence (D : StructuralDesignPackage) where
  structuralNumberCalculated : D.structuralNumber = List.sum (List.zipWith (fun t c d => t * c * d) D.layerThicknesses D.layerCoefficients D.drainageCoefficients)
  structuralNumberPositive : D.structuralNumber > 0

def StructuralDesignClosed (D : StructuralDesignPackage) : Prop :=
  D.structuralNumber > 0

theorem structural_design_closed_from_evidence
    (D : StructuralDesignPackage) (E : StructuralDesignEvidence D) :
    StructuralDesignClosed D := by
  exact E.structuralNumberPositive

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse
