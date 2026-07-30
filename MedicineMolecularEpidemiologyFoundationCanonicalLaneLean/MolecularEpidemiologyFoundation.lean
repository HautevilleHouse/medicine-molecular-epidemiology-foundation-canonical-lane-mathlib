import canonicalLaneMathlib.AdmissibleClass
import MedicineMolecularEpidemiologyFoundationCanonicalLaneLean.CompartmentModel
import MedicineMolecularEpidemiologyFoundationCanonicalLaneLean.PharmacokineticModel
import MedicineMolecularEpidemiologyFoundationCanonicalLaneLean.DiagnosticInference
import MedicineMolecularEpidemiologyFoundationCanonicalLaneLean.SurvivalAnalysis

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure MolecularEpidemiologyFoundationPackage where
  compartmentModel : CompartmentModelPackage
  pharmacokineticModel : PharmacokineticModelPackage
  diagnosticInference : DiagnosticInferencePackage
  survivalAnalysis : SurvivalAnalysisPackage
  integratedAnalysis : Prop

structure MolecularEpidemiologyFoundationEvidence (M : MolecularEpidemiologyFoundationPackage) where
  compartmentModelClosed : CompartmentModelClosed M.compartmentModel
  pharmacokineticModelClosed : PharmacokineticModelClosed M.pharmacokineticModel
  diagnosticInferenceClosed : DiagnosticInferenceClosed M.diagnosticInference
  survivalAnalysisClosed : SurvivalAnalysisClosed M.survivalAnalysis
  integratedAnalysisClosed : M.integratedAnalysis

def MolecularEpidemiologyFoundationClosed (M : MolecularEpidemiologyFoundationPackage) : Prop :=
  CompartmentModelClosed M.compartmentModel ∧
  PharmacokineticModelClosed M.pharmacokineticModel ∧
  DiagnosticInferenceClosed M.diagnosticInference ∧
  SurvivalAnalysisClosed M.survivalAnalysis ∧
  M.integratedAnalysis

theorem molecular_epidemiology_foundation_closed_from_evidence
    (M : MolecularEpidemiologyFoundationPackage)
    (E : MolecularEpidemiologyFoundationEvidence M) :
    MolecularEpidemiologyFoundationClosed M := by
  exact And.intro E.compartmentModelClosed
    (And.intro E.pharmacokineticModelClosed
      (And.intro E.diagnosticInferenceClosed
        (And.intro E.survivalAnalysisClosed E.integratedAnalysisClosed)))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
