import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure GeneticRiskScoreModel where
  snpSet : Type u
  effectWeights : Type v
  riskModel : Prop
  validationCohort : Prop
  calibration : Prop
  discrimination : Prop

structure GeneticRiskScoreEvidence (G : GeneticRiskScoreModel) where
  snpSetDefined : G.snpSet
  weightsDefined : G.effectWeights
  riskModelSpecified : G.riskModel
  validationCohortSpecified : G.validationCohort
  calibrationAssessed : G.calibration
  discriminationAssessed : G.discrimination

def GeneticRiskScoreClosed (G : GeneticRiskScoreModel) : Prop :=
  G.snpSet ∧ G.effectWeights ∧ G.riskModel ∧ G.validationCohort ∧ G.calibration ∧ G.discrimination

theorem genetic_risk_score_closed_from_evidence (G : GeneticRiskScoreModel) (E : GeneticRiskScoreEvidence G) : GeneticRiskScoreClosed G := by
  exact And.intro E.snpSetDefined
    (And.intro E.weightsDefined
      (And.intro E.riskModelSpecified
        (And.intro E.validationCohortSpecified
          (And.intro E.calibrationAssessed E.discriminationAssessed))))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse