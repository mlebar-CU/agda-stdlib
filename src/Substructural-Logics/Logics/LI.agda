----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Lambek Associative Calculus with Identity (BBᶜP[⇒, ⇐, ∘, t] -- in Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.LI where

open import Substructural-Logics.Logics.L
open import Substructural-Logics.Logics.P
open import Substructural-Logics.Connectives.Truth

record LI-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct) (∅ : Struct)
  (_⇒_ _⇐_ _∘_ : Lang → Lang → Lang) (t : Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-L-logic : L-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _⇐_ _∘_

    is-P-logic : P-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_

    is-truth-logic : Truth-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_  t
