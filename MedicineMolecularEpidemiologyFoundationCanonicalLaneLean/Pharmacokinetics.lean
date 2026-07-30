import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure PharmacokineticPackage (C : CompartmentModelPackage) where
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  doseRegimen : Prop
  firstOrderKinetics : Prop
  saturableKinetics : Prop
  steadyStateCondition : Prop

structure PharmacokineticEvidence (C : CompartmentModelPackage) (P : PharmacokineticPackage C) where
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  doseRegimenClosed : P.doseRegimen
  firstOrderKineticsClosed : P.firstOrderKinetics
  saturableKineticsClosed : P.saturableKinetics
  steadyStateConditionClosed : P.steadyStateCondition

def PharmacokineticClosed (C : CompartmentModelPackage) (P : PharmacokineticPackage C) : Prop :=
  P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.doseRegimen ∧
  P.firstOrderKinetics ∧ P.saturableKinetics ∧ P.steadyStateCondition

theorem pharmacokinetic_closed_from_evidence
    (C : CompartmentModelPackage) (P : PharmacokineticPackage C)
    (E : PharmacokineticEvidence C P) : PharmacokineticClosed C P := by
  exact And.intro E.absorptionRateClosed
    (And.intro E.distributionVolumeClosed
      (And.intro E.eliminationRateClosed
        (And.intro E.doseRegimenClosed
          (And.intro E.firstOrderKineticsClosed
            (And.intro E.saturableKineticsClosed E.steadyStateConditionClosed)))))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
