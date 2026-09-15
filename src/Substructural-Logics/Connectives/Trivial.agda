----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with 'trivial truth' connective + related proof
----------------------------------------------------------------------------

{-# OPTIONS --cubical-compatible --safe #-}

module Substructural-Logics.Connectives.Trivial where

open import Substructural-Logics.Backbone
open import Substructural-Logics.Punctuation.Leftid
open import Substructural-Logics.Connectives.Truth
open import Substructural-Logics.Structural-Rules.K
open import Data.Product using (_×_; proj₁; proj₂) renaming (_,_ to ⟨_,_⟩)


record Trivial-Logic
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct)
  (_⇒_ : Lang → Lang → Lang)
  (⊤ ⊥ : Lang) : Set where
  field
    is-logic : Logic S _⊢_ C⟨_⟩ _⨾_  _⇒_

    ⊤-introduction :
      ∀ {X : Struct} →
      ---------
      X ⊢ ⊤

    ⊥-elimination :
      ∀ {X : Struct} {A : Lang} →
      X ⊢ ⊥ →
      ------------
      C⟨ X ⟩ ⊢ A

-- Lemma 2.32
t-⊤-equiv :
  ∀ (Lang : Set) (Struct : Set) (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct) (∅ : Struct)
  (_⇒_ : Lang → Lang → Lang)  (t ⊤ ⊥ : Lang) →
  Truth-Logic S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_ t →
  Trivial-Logic S _⊢_ C⟨_⟩ _⨾_ _⇒_ ⊤ ⊥ →
  K-Logic S _⊢_ C⟨_⟩ _⨾_ _⇒_ →
  ------------------------------------------
  ∀ {A B : Lang} → (S t) ⊢ ⊤  × (S ⊤) ⊢ t

t-⊤-equiv Lang Struct S _⊢_ C⟨_⟩ _⨾_ ∅ _⇒_  t ⊤ ⊥ x y z =
  ⟨ (Trivial-Logic.⊤-introduction y) ,
    Logic.context w
      (lPo-Logic.left-pop u)
        (Logic.context w (K-Logic.weaken z) (Truth-Logic.t-introduction x)) ⟩
    where
    w = K-Logic.is-logic z
    v = Truth-Logic.is-leftid-Logic x
    u = Leftid-Logic.is-left-pop v
