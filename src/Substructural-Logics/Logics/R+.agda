----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Positive Relevant Logic (DBCW in Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.R+ where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Logics.Or-Comma
open import Substructural-Logics.Logics.MALL+ 
open import Substructural-Logics.Structural-Rules.W

record R⁺-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ _/_ : Struct → Struct → Struct)(∅ : Struct)
  (_⇒_ _⇐_ _∧_ _∨_  _∘_ : Lang → Lang → Lang) (t ⊤ ⊥ : Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-or-comma-logic : Or-Comma-Logic S _⊢_ C⟨_⟩ _⨾_ _/_ _⇒_ _∨_

    is-W-logic : W-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-MALL⁺-logic : MALL⁺-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_ _⇐_ _∧_ _∨_ _∘_ t ⊤ ⊥

