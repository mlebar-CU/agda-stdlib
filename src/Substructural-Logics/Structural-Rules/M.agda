----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Mingle structural rule
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Structural-Rules.M where

open import Substructural-Logics.Backbone

record M-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  (_⇒_ : Lang → Lang → Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    weak-contract :
      ∀ {X : Struct} {A : Lang} →
      C⟨ X ⟩ ⊢ A →
      ------------------
      C⟨ (X ⨾  X) ⟩ ⊢ A
