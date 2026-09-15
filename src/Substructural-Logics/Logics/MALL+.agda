----------------------------------------------------------------------------
-- The Agda standard library
--
-- Definition for Positive Multiplicative Additive Linear Logic (BC in Restall)
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.MALL+-Logic where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Structural-Rules.B
open import Substructural-Logics.Structural-Rules.C
open import Substructural-Logics.Logics.Full-Conn

record MALL⁺-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct) (∅ : Struct)
  (_⇒_ _⇐_ _∧_ _∨_  _∘_ : Lang → Lang → Lang) (t ⊤ ⊥ : Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-B-logic : B-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-C-logic : C-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-full-conn-logic : Full-Conn-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_ _⇐_ _∧_ _∨_ _∘_ t ⊤ ⊥

