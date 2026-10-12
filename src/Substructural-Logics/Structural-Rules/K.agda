----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Weakening structural rule + related proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.K 
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

record K-Logic (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    weaken :
      (C⟨ X ⟩ ) ⊢ A →
      ------------------
      (C⟨ X ⨾  Y ⟩) ⊢ A

if-weaken :
  K-Logic _⇒₁_ →
  -----------------
  (S A) ⊢ (B ⇒₁ A)

--proof from page 27
if-weaken Lang Struct x =
  Backbone.⇒-introduction y
    (Backbone.context-elimination y
      (K-Logic.weaken x)
      (Backbone.hypothesis y))
    where
    y = K-Logic.has-backbone x
