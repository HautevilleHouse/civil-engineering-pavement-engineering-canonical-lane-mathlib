import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure FEMMeshGeneration where
  meshResolution : Prop
  elementTypes : Prop
  boundaryConditions : Prop
  meshResolutionTerm : meshResolution
  elementTypesTerm : elementTypes
  boundaryConditionsTerm : boundaryConditions

structure FEMMaterialModels where
  linearElastic : Prop
  viscoelastic : Prop
  plastic : Prop
  damage : Prop
  linearElasticTerm : linearElastic
  viscoelasticTerm : viscoelastic
  plasticTerm : plastic
  damageTerm : damage

structure FEMSolutionControl where
  convergenceCriteria : Prop
  timeStepping : Prop
  solverStability : Prop
  convergenceCriteriaTerm : convergenceCriteria
  timeSteppingTerm : timeStepping
  solverStabilityTerm : solverStability

def FEMModelClosed (M : FEMMeshGeneration) (Mat : FEMMaterialModels) (S : FEMSolutionControl) : Prop :=
  M.meshResolution ∧ M.elementTypes ∧ M.boundaryConditions ∧
  Mat.linearElastic ∧ Mat.viscoelastic ∧ Mat.plastic ∧ Mat.damage ∧
  S.convergenceCriteria ∧ S.timeStepping ∧ S.solverStability

theorem fem_model_closed (M : FEMMeshGeneration) (Mat : FEMMaterialModels) (S : FEMSolutionControl) (E : FEMMeshGenerationEvidence M) (Emat : FEMMaterialModelsEvidence Mat) (Es : FEMSolutionControlEvidence S) : FEMModelClosed M Mat S :=
  by
    exact And.intro E.meshResolutionClosed (And.intro E.elementTypesClosed (And.intro E.boundaryConditionsClosed
      (And.intro Emat.linearElasticClosed (And.intro Emat.viscoelasticClosed (And.intro Emat.plasticClosed (And.intro Emat.damageClosed
        (And.intro Es.convergenceCriteriaClosed (And.intro Es.timeSteppingClosed Es.solverStabilityClosed))))))))

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse