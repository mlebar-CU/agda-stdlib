----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Lambek Associative Calculus (BBᶜP[⇒, ⇐, ∘] in Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.L where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Structural-Rules.B
open import Substructural-Logics.Structural-Rules.B^c
open import Substructural-Logics.Connectives.Backif
open import Substructural-Logics.Connectives.Fusion

record L-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct)
  (_⇒_ _⇐_ _∘_ : Lang → Lang → Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-backif-logic : Backif-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _⇐_

    is-fusion-logic : Fusion-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _∘_

    is-B-logic : B-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-Bᶜ-logic : Bᶜ-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_
