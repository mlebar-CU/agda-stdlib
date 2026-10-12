----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Weak Commutatitivity structural rule + related
-- proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.CI 
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

record CI-Logic (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    weak-commute :
      C⟨ X ⨾ Y ⟩ ⊢ A →
      -----------------
      C⟨ Y ⨾ X ⟩ ⊢ A


modus-ponens-pullback :
  CI-Logic _⇒₁_ → 
  -----------------------
  (S A) ⊢ ((A ⇒₁ B) ⇒₁ B)


-- proof from page 27
modus-ponens-pullback x =
  Backbone.⇒-introduction y
    (Backbone.context-elimination y
      (CI-Logic.weak-commute x)
      (Backbone.⇒-elimination y
        (Backbone.hypothesis y)
        (Backbone.hypothesis y)))
  where
  y = CI-Logic.has-backbone x
