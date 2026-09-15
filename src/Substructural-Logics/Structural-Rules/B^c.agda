----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Converse Associative structural rule
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Structural-Rules.B^c where

open import Substructural-Logics.Backbone

record Bᶜ-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  (_⇒_ : Lang → Lang → Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_ _⇒_

    converse-assoc :
      ∀ {X Y Z : Struct} {A : Lang} →
      C⟨ ((X ⨾  Y) ⨾ Z) ⟩ ⊢ A →
      -------------------------
      C⟨ (X ⨾ ( Y ⨾ Z)) ⟩ ⊢ A
