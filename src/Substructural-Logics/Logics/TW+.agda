----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Positive Ticket Entailment (DBB'lP[⇒, ∘, ∧, ∨, t] in
-- Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.TW+-Logic where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Logics.Or-Comma
open import Substructural-Logics.Structural-Rules.B
open import Substructural-Logics.Structural-Rules.B'
open import Substructural-Logics.Punctuation.Leftid
open import Substructural-Logics.Connectives.Truth
open import Substructural-Logics.Connectives.And
open import Substructural-Logics.Connectives.Backif
open import Substructural-Logics.Connectives.Fusion

record TW⁺-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ _/_ : Struct → Struct → Struct) (∅ : Struct)
  (_⇒_ _⇐_ _∧_ _∨_ _∘_ : Lang → Lang → Lang) (t : Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-or-comma-logic : Or-Comma-Logic S _⊢_ C⟨_⟩ _⨾_ _/_ _⇒_ _∨_

    is-B-logic : B-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-B'-logic : B'-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-truth-logic : Truth-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_ t

    is-and-logic : And-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _∧_

    is-backif-logic : Backif-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _⇐_

    is-fusion-logic : Fusion-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _∘_

