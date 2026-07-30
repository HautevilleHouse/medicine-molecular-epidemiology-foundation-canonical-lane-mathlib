import canonicalLaneMathlib.AdmissibleClass
import MedicineMolecularEpidemiologyFoundationCanonicalLaneLean.MolecularEpidemiologyFoundation

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | EpidemiologyAdmittedObject O => O.foundationClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  -- Constructive from the admissible object's evidence
  sorry

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
