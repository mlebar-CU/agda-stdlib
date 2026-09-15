----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Minimal Logic (BCWK[⇒, ∧, ∨] in Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.Minimal where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Structural-Rules.B
open import Substructural-Logics.Structural-Rules.C
open import Substructural-Logics.Structural-Rules.W
open import Substructural-Logics.Structural-Rules.K
open import Substructural-Logics.Connectives.And
open import Substructural-Logics.Connectives.Or

record Minimal-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  (_⇒_ _∧_ _∨_ : Lang → Lang → Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-and-logic : And-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _∧_

    is-or-logic : Or-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _∨_

    is-B-logic : B-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-C-logic : C-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-W-logic : W-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-K-logic : K-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_
