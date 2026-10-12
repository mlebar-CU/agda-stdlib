----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Strong Contraction structural rule + related
-- proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.W 
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  where

private
  variable
    A B : Lang
    X Y : Struct
    _⇒₁_ : Lang → Lang → Lang

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_ 

record W-Logic (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    strong-contract :
      C⟨ ((X ⨾  Y) ⨾ Y) ⟩ ⊢ A →
      -----------------
      C⟨ X ⨾  Y ⟩ ⊢ A

double-if-contract :
  W-Logic _⇒₁_ →
  ---------------------------
  S (A ⇒₁ (A ⇒₁ B)) ⊢ (A ⇒₁ B)

-- proof from page 28
double-if-contract x =
  Backbone.⇒-introduction y
    (Backbone.context-elimination y
      (W-Logic.strong-contract x)
      (Backbone.⇒-elimination y
        (Backbone.⇒-elimination y
          (Backbone.hypothesis y)
          (Backbone.hypothesis y))
        (Backbone.hypothesis y)))
    where
    y = W-Logic.has-backbone x
