import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure CompartmentModelPackage where
  compartments : Type
  rates : Type
  compartmentCount : Nat
  massBalanceEquation : Prop
  initialConditions : Prop
  solutionWellDefined : Prop

structure CompartmentModelEvidence (P : CompartmentModelPackage) where
  compartmentCountClosed : P.compartmentCount = 2 ∨ P.compartmentCount = 3
  massBalanceEquationClosed : P.massBalanceEquation
  initialConditionsClosed : P.initialConditions
  solutionWellDefinedClosed : P.solutionWellDefined

def CompartmentModelClosed (P : CompartmentModelPackage) : Prop :=
  (P.compartmentCount = 2 ∨ P.compartmentCount = 3) ∧
  P.massBalanceEquation ∧
  P.initialConditions ∧
  P.solutionWellDefined

theorem compartment_model_closed_from_evidence (P : CompartmentModelPackage)
    (E : CompartmentModelEvidence P) : CompartmentModelClosed P := by
  exact And.intro E.compartmentCountClosed
    (And.intro E.massBalanceEquationClosed
      (And.intro E.initialConditionsClosed E.solutionWellDefinedClosed))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse