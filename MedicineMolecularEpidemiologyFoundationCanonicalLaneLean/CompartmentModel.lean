import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Type u
  transitionRates : Type v
  initialConditions : Prop
  wellposed : Prop

structure CompartmentModelEvidence (C : CompartmentModelPackage) where
  initialConditionsClosed : C.initialConditions
  wellposedClosed : C.wellposed

def CompartmentModelClosed (C : CompartmentModelPackage) : Prop :=
  C.initialConditions ∧ C.wellposed

theorem compartment_model_closed_from_evidence (C : CompartmentModelPackage)
    (E : CompartmentModelEvidence C) : CompartmentModelClosed C := by
  exact And.intro E.initialConditionsClosed E.wellposedClosed

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
