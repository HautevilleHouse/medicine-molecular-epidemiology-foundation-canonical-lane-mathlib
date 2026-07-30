import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure PharmacokineticModelPackage where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  doseResponse : Prop

structure PharmacokineticModelEvidence (P : PharmacokineticModelPackage) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  doseResponseClosed : P.doseResponse

def PharmacokineticModelClosed (P : PharmacokineticModelPackage) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.doseResponse

theorem pharmacokinetic_model_closed_from_evidence (P : PharmacokineticModelPackage)
    (E : PharmacokineticModelEvidence P) : PharmacokineticModelClosed P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed E.doseResponseClosed))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
