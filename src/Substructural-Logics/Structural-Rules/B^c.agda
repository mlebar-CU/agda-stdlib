----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Converse Associative structural rule
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.B^c 
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  where

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_

record Bᶜ-Logic
  (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    converse-assoc :
      ∀ {X Y Z : Struct} {A : Lang} →
      C⟨ ((X ⨾  Y) ⨾ Z) ⟩ ⊢ A →
      -------------------------
      C⟨ (X ⨾ ( Y ⨾ Z)) ⟩ ⊢ A
