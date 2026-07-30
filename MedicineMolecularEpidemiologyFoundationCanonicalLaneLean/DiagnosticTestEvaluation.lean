import canonicalLaneMathlib.AdmissibleClass

/-!
# Diagnostic Test Evaluation Package

This module formalizes diagnostic test evaluation metrics including sensitivity,
specificity, positive predictive value (PPV), negative predictive value (NPV),
and likelihood ratios.
-/

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure DiagnosticTestData where
  truePositives : ℕ
  falsePositives : ℕ
  falseNegatives : ℕ
  trueNegatives : ℕ

structure DiagnosticTestMetrics where
  sensitivity : ℝ
  specificity : ℝ
  ppv : ℝ
  npv : ℝ
  positiveLikelihoodRatio : ℝ
  negativeLikelihoodRatio : ℝ

structure DiagnosticTestEvidence (D : DiagnosticTestData) (M : DiagnosticTestMetrics) where
  sensitivityCorrect : M.sensitivity = (D.truePositives : ℝ) / ((D.truePositives : ℝ) + (D.falseNegatives : ℝ))
  specificityCorrect : M.specificity = (D.trueNegatives : ℝ) / ((D.trueNegatives : ℝ) + (D.falsePositives : ℝ))
  ppvCorrect : M.ppv = (D.truePositives : ℝ) / ((D.truePositives : ℝ) + (D.falsePositives : ℝ))
  npvCorrect : M.npv = (D.trueNegatives : ℝ) / ((D.trueNegatives : ℝ) + (D.falseNegatives : ℝ))
  positiveLikelihoodRatioCorrect : M.positiveLikelihoodRatio = M.sensitivity / (1 - M.specificity)
  negativeLikelihoodRatioCorrect : M.negativeLikelihoodRatio = (1 - M.sensitivity) / M.specificity

def DiagnosticTestClosed (D : DiagnosticTestData) (M : DiagnosticTestMetrics) : Prop :=
  M.sensitivity = (D.truePositives : ℝ) / ((D.truePositives : ℝ) + (D.falseNegatives : ℝ)) ∧
  M.specificity = (D.trueNegatives : ℝ) / ((D.trueNegatives : ℝ) + (D.falsePositives : ℝ)) ∧
  M.ppv = (D.truePositives : ℝ) / ((D.truePositives : ℝ) + (D.falsePositives : ℝ)) ∧
  M.npv = (D.trueNegatives : ℝ) / ((D.trueNegatives : ℝ) + (D.falseNegatives : ℝ)) ∧
  M.positiveLikelihoodRatio = M.sensitivity / (1 - M.specificity) ∧
  M.negativeLikelihoodRatio = (1 - M.sensitivity) / M.specificity

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestData)
    (M : DiagnosticTestMetrics) (E : DiagnosticTestEvidence D M) :
    DiagnosticTestClosed D M := by
  exact And.intro E.sensitivityCorrect
    (And.intro E.specificityCorrect
      (And.intro E.ppvCorrect
        (And.intro E.npvCorrect
          (And.intro E.positiveLikelihoodRatioCorrect
            E.negativeLikelihoodRatioCorrect))))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse