----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Positive Relevant Logic with Mingle (DBCWM in Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.RM+ where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Logics.R+
open import Substructural-Logics.Structural-Rules.M

record RM⁺-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ _/_ : Struct → Struct → Struct) (∅ : Struct)
  (_⇒_ _⇐_ _∧_ _∨_  _∘_ : Lang → Lang → Lang) (t ⊤ ⊥ : Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-R⁺-logic : R⁺-Logic S _⊢_ C⟨_⟩ _⨾_ _/_ ∅ _⇒_ _⇐_ _∧_ _∨_ _∘_ t ⊤ ⊥

    is-M-logic : M-Logic S _⊢_ C⟨_⟩ _⨾_ _⇒_

