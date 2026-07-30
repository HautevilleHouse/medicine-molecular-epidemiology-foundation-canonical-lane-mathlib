import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure DiagnosticTestModel where
  testDefinition : Type u
  diseaseStatus : Type v
  sensitivity : Prop
  specificity : Prop
  predictiveValues : Prop
  rocCurve : Prop

structure DiagnosticTestEvidence (D : DiagnosticTestModel) where
  testDefined : D.testDefinition
  diseaseStatusDefined : D.diseaseStatus
  sensitivityMeasured : D.sensitivity
  specificityMeasured : D.specificity
  predictiveValuesComputed : D.predictiveValues
  rocCurveComputed : D.rocCurve

def DiagnosticTestClosed (D : DiagnosticTestModel) : Prop :=
  D.testDefinition ∧ D.diseaseStatus ∧ D.sensitivity ∧ D.specificity ∧ D.predictiveValues ∧ D.rocCurve

theorem diagnostic_test_closed_from_evidence (D : DiagnosticTestModel) (E : DiagnosticTestEvidence D) : DiagnosticTestClosed D := by
  exact And.intro E.testDefined
    (And.intro E.diseaseStatusDefined
      (And.intro E.sensitivityMeasured
        (And.intro E.specificityMeasured
          (And.intro E.predictiveValuesComputed E.rocCurveComputed))))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse