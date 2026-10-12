----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Strong Commutatitivity structural rule +
-- related proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.C 
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  where

private
  variable
    A B C : Lang
    X Y Z : Struct
    _⇒₁_ : Lang → Lang → Lang

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_

record C-Logic (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone  _⇒_

    strong-commute : ∀ {X Y Z : Struct} {A : Lang} →
      C⟨ ((X ⨾  Y) ⨾ Z) ⟩ ⊢ A →
      -----------------------------
      C⟨ ((X ⨾  Z) ⨾ Y) ⟩ ⊢ A

if-rearrange :
  C-Logic _⇒₁_ →
  -----------------------------------
  (S (A ⇒₁ (B ⇒₁ C))) ⊢ (B ⇒₁ (A ⇒₁ C))

--proof from page 27
if-rearrange x =
  Backbone.⇒-introduction y
    (Backbone.⇒-introduction y
      ( Backbone.context-elimination y
        (C-Logic.strong-commute x)
        (Backbone.⇒-elimination y
          (Backbone.⇒-elimination y
            (Backbone.hypothesis y)
            (Backbone.hypothesis y))
          (Backbone.hypothesis y))))
    where
    y = C-Logic.has-backbone x
