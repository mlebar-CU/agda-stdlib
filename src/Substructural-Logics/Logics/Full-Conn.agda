----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic containing all connectives - not defined directly in
-- the book but used for easily defining other logics
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Logics.Full-Conn where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Connectives.And
open import Substructural-Logics.Connectives.Or
open import Substructural-Logics.Connectives.Backif
open import Substructural-Logics.Connectives.Fusion
open import Substructural-Logics.Connectives.Trivial
open import Substructural-Logics.Connectives.Truth

record Full-Conn-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct) (∅ : Struct)
  (_⇒_ _⇐_ _∧_ _∨_ _∘_ : Lang → Lang → Lang) (t ⊤ ⊥ : Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    is-and-logic : And-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _∧_

    is-or-logic : Or-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _∨_

    is-fusion-logic : Fusion-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _∘_

    is-backif-logic : Backif-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ _⇐_

    is-trivial-logic : Trivial-Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_ ⊤ ⊥

    is-truth-logic : Truth-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_ t

