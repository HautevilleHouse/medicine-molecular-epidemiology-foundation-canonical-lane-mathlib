import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineMolecularEpidemiologyFoundationCanonicalLaneLean

structure CausalModelDefinition where
  treatmentVariable : Type u
  outcomeVariable : Type v
  causalDAG : Prop
  identificationStrategy : Prop
  estimand : Prop
  sensitivityAnalysis : Prop

structure CausalModelEvidence (C : CausalModelDefinition) where
  treatmentDefined : C.treatmentVariable
  outcomeDefined : C.outcomeVariable
  dagSpecified : C.causalDAG
  identificationStrategySpecified : C.identificationStrategy
  estimandComputed : C.estimand
  sensitivityAnalysisPerformed : C.sensitivityAnalysis

def CausalModelClosed (C : CausalModelDefinition) : Prop :=
  C.treatmentVariable ∧ C.outcomeVariable ∧ C.causalDAG ∧ C.identificationStrategy ∧ C.estimand ∧ C.sensitivityAnalysis

theorem causal_model_closed_from_evidence (C : CausalModelDefinition) (E : CausalModelEvidence C) : CausalModelClosed C := by
  exact And.intro E.treatmentDefined
    (And.intro E.outcomeDefined
      (And.intro E.dagSpecified
        (And.intro E.identificationStrategySpecified
          (And.intro E.estimandComputed E.sensitivityAnalysisPerformed))))

end MedicineMolecularEpidemiologyFoundationCanonicalLaneLean
end HautevilleHouse