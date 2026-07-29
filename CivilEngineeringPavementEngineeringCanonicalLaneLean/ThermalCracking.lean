import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilEngineeringPavementEngineeringCanonicalLaneLean

structure ThermalLoadModel where
  temperatureProfile : Prop
  thermalGradient : Prop
  freezeThawCycles : Prop
  temperatureProfileTerm : temperatureProfile
  thermalGradientTerm : thermalGradient
  freezeThawCyclesTerm : freezeThawCycles

structure ThermalStressAnalysis where
  restrainedShrinkage : Prop
  thermalExpansionMismatch : Prop
  stressRelaxation : Prop
  restrainedShrinkageTerm : restrainedShrinkage
  thermalExpansionMismatchTerm : thermalExpansionMismatch
  stressRelaxationTerm : stressRelaxation

structure ThermalCrackingPrediction where
  crackSpacing : Prop
  crackWidth : Prop
  crackDepth : Prop
  crackSpacingTerm : crackSpacing
  crackWidthTerm : crackWidth
  crackDepthTerm : crackDepth

def thermalCrackingClosed (T : ThermalLoadModel) (S : ThermalStressAnalysis) (P : ThermalCrackingPrediction) : Prop :=
  T.temperatureProfile ∧ T.thermalGradient ∧ T.freezeThawCycles ∧
  S.restrainedShrinkage ∧ S.thermalExpansionMismatch ∧ S.stressRelaxation ∧
  P.crackSpacing ∧ P.crackWidth ∧ P.crackDepth

theorem thermal_cracking_closed (T : ThermalLoadModel) (S : ThermalStressAnalysis) (P : ThermalCrackingPrediction) (Et : ThermalLoadModelEvidence T) (Es : ThermalStressAnalysisEvidence S) (Ep : ThermalCrackingPredictionEvidence P) : thermalCrackingClosed T S P :=
  by
    exact And.intro Et.temperatureProfileClosed (And.intro Et.thermalGradientClosed (And.intro Et.freezeThawCyclesClosed
      (And.intro Es.restrainedShrinkageClosed (And.intro Es.thermalExpansionMismatchClosed (And.intro Es.stressRelaxationClosed
        (And.intro Ep.crackSpacingClosed (And.intro Ep.crackWidthClosed Ep.crackDepthClosed)))))))

end CivilEngineeringPavementEngineeringCanonicalLaneLean
end HautevilleHouse