import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure DiagnosticInferencePackage where
  prevalence : Float
  sensitivity : Float
  specificity : Float
  positivePredictiveValue : Float
  negativePredictiveValue : Float
  bayesRuleApplied : Prop
  inferenceConsistent : Prop

structure DiagnosticInferenceEvidence (D : DiagnosticInferencePackage) where
  bayesRuleAppliedClosed : D.bayesRuleApplied
  positivePredictiveValueComputed : D.positivePredictiveValue =
    (D.prevalence * D.sensitivity) /
    (D.prevalence * D.sensitivity + (1 - D.prevalence) * (1 - D.specificity))
  negativePredictiveValueComputed : D.negativePredictiveValue =
    ((1 - D.prevalence) * D.specificity) /
    ((1 - D.prevalence) * D.specificity + D.prevalence * (1 - D.sensitivity))
  inferenceConsistentClosed : D.inferenceConsistent

def DiagnosticInferenceClosed (D : DiagnosticInferencePackage) : Prop :=
  D.bayesRuleApplied ∧
  (D.positivePredictiveValue =
    (D.prevalence * D.sensitivity) /
    (D.prevalence * D.sensitivity + (1 - D.prevalence) * (1 - D.specificity))) ∧
  (D.negativePredictiveValue =
    ((1 - D.prevalence) * D.specificity) /
    ((1 - D.prevalence) * D.specificity + D.prevalence * (1 - D.sensitivity))) ∧
  D.inferenceConsistent

theorem diagnostic_inference_closed_from_evidence (D : DiagnosticInferencePackage)
    (E : DiagnosticInferenceEvidence D) : DiagnosticInferenceClosed D := by
  exact And.intro E.bayesRuleAppliedClosed
    (And.intro E.positivePredictiveValueComputed
      (And.intro E.negativePredictiveValueComputed E.inferenceConsistentClosed))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse