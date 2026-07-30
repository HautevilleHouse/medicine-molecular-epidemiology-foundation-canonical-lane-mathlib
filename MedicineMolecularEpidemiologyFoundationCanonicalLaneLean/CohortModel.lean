import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure CohortDefinition where
  studyPopulation : Type u
  timeDomain : Type v
  exposureDefinition : Prop
  outcomeDefinition : Prop
  confoundingModel : Prop

structure CohortEvidence (C : CohortDefinition) where
  studyPopulationDefined : C.studyPopulation
  timeDomainDefined : C.timeDomain
  exposureDefined : C.exposureDefinition
  outcomeDefined : C.outcomeDefinition
  confoundingModelSpecified : C.confoundingModel

def CohortClosed (C : CohortDefinition) : Prop :=
  C.studyPopulation ∧ C.timeDomain ∧ C.exposureDefinition ∧ C.outcomeDefinition ∧ C.confoundingModel

theorem cohort_closed_from_evidence (C : CohortDefinition) (E : CohortEvidence C) : CohortClosed C := by
  exact And.intro E.studyPopulationDefined
    (And.intro E.timeDomainDefined
      (And.intro E.exposureDefined
        (And.intro E.outcomeDefined E.confoundingModelSpecified)))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse