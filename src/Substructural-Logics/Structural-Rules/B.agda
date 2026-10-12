----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Associative structural rule + related proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.B 
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  (_⇒_ : Lang → Lang → Lang) where

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_

private
  variable
    A B C : Lang
    X Y Z : Struct
    _⇒₁_ : Lang → Lang → Lang

record B-Logic (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone  _⇒_

    assoc :
      C⟨ (X ⨾ ( Y ⨾ Z)) ⟩ ⊢ A →
      -------------------------
      C⟨ ((X ⨾  Y) ⨾ Z) ⟩ ⊢ A

if-extend :
  B-Logic _⇒₁_ → 
  ------------------------------------
  (S (A ⇒₁ B)) ⊢ ((C ⇒₁ A) ⇒₁ (C ⇒₁ B))

--proof from page 27
if-extend x =
  Backbone.⇒-introduction y
    (Backbone.⇒-introduction y
      (Backbone.context-elimination y
        (B-Logic.assoc x)
        (Backbone.⇒-elimination y
          (Backbone.hypothesis y)
          (Backbone.⇒-elimination y
            (Backbone.hypothesis y)
            (Backbone.hypothesis y)))))
    where
    y = B-Logic.has-backbone x
