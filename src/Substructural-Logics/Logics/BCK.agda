----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Positive Affine Logic (BCK in Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.BCK where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Logics.MALL+
open import Substructural-Logics.Structural-Rules.K

record BCK-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct) (∅ : Struct)
  (_⇒_ _⇐_ _∧_ _∨_  _∘_ : Lang → Lang → Lang) (t ⊤ ⊥ : Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-MALL⁺-logic :
      MALL⁺-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_ _⇐_ _∧_ _∨_ _∘_ t ⊤ ⊥

    is-K-logic : K-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

