import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure SurvivalAnalysisPackage where
  timeScale : Type
  hazardFunction : Type
  survivalFunction : Type
  proportionalHazardsAssumption : Prop
  kaplanMeierConsistent : Prop
  coxModelValid : Prop

structure SurvivalAnalysisEvidence (S : SurvivalAnalysisPackage) where
  proportionalHazardsAssumptionClosed : S.proportionalHazardsAssumption
  kaplanMeierConsistentClosed : S.kaplanMeierConsistent
  coxModelValidClosed : S.coxModelValid

def SurvivalAnalysisClosed (S : SurvivalAnalysisPackage) : Prop :=
  S.proportionalHazardsAssumption ∧
  S.kaplanMeierConsistent ∧
  S.coxModelValid

theorem survival_analysis_closed_from_evidence (S : SurvivalAnalysisPackage)
    (E : SurvivalAnalysisEvidence S) : SurvivalAnalysisClosed S := by
  exact And.intro E.proportionalHazardsAssumptionClosed
    (And.intro E.kaplanMeierConsistentClosed E.coxModelValidClosed)

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse