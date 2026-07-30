import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure MedicineAdmittedObject where
  modelIdentifier : String
  modelValidated : Prop
  evidenceLevel : Prop
  conclusion : conclusion

structure MedicineAdmissibleClass where
  object : MedicineAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : MedicineAdmissibleClass) : Prop :=
  A.object.modelValidated ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse
