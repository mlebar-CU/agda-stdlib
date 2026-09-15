----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Intuitionistic Logic (BCWK in Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.J where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Logics.BCK
open import Substructural-Logics.Structural-Rules.W

record J-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct) (∅ : Struct)
  (_⇒_ _⇐_ _∧_ _∨_  _∘_ : Lang → Lang → Lang) (t ⊤ ⊥ : Lang) : Set where
    field
        is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

        is-BCK-logic :
          BCK-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_ _⇐_ _∧_ _∨_ _∘_ t ⊤ ⊥

        is-W-logic : W-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

