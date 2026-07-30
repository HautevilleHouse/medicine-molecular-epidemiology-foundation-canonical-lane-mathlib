import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure SurvivalAnalysisPackage where
  timeToEventDefinition : Type u
  censoringMechanism : Type v
  hazardFunction : Prop
  kaplanMeierEstimator : Prop
  coxModel : Prop
  proportionalHazardsAssumption : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  timeToEventDefined : S.timeToEventDefinition
  censoringMechanismSpecified : S.censoringMechanism
  hazardFunctionSpecified : S.hazardFunction
  kaplanMeierComputed : S.kaplanMeierEstimator
  coxModelFitted : S.coxModel
  proportionalHazardsChecked : S.proportionalHazardsAssumption

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.timeToEventDefinition ∧ S.censoringMechanism ∧ S.hazardFunction ∧ S.kaplanMeierEstimator ∧ S.coxModel ∧ S.proportionalHazardsAssumption

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage) (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.timeToEventDefined
    (And.intro E.censoringMechanismSpecified
      (And.intro E.hazardFunctionSpecified
        (And.intro E.kaplanMeierComputed
          (And.intro E.coxModelFitted E.proportionalHazardsChecked))))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse