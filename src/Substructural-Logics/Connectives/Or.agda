----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with 'or' connective + related proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Connectives.Or 
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct)
  where

private 
  variable
    A B C : Lang
    X Y Z W : Struct
    _⇒₁_ : Lang → Lang → Lang
    _∧₁_ : Lang → Lang → Lang
    _∨₁_ : Lang → Lang → Lang


open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_ 
open import Substructural-Logics.Connectives.And S _⊢_ C⟨_⟩ _⨾_ 
open import Data.Product using (_×_; proj₁; proj₂) renaming (_,_ to ⟨_,_⟩)

record Or-Logic
  (_⇒_ _∨_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    product-context :
      (C⟨ X ⟩ ⊢ A × C⟨ Y ⟩ ⊢ A → C⟨ Z ⟩ ⊢ A) →
      X ⊢ A × Y ⊢ A  →
      ---------
      Z ⊢ A

    semicolon-product-context-l :
      (C⟨ X ⟩ ⊢ A × C⟨ Y ⟩ ⊢ A → C⟨ Z ⟩ ⊢ A) →
      ----------------------------------------
      (C⟨ W ⨾ X ⟩ ⊢ A × C⟨ W ⨾ Y ⟩ ⊢ A → C⟨ W ⨾ Z ⟩ ⊢ A)

    semicolon-product-context-r :
      (C⟨ X ⟩ ⊢ A × C⟨ Y ⟩ ⊢ A → C⟨ Z ⟩ ⊢ A) →
      ----------------------------------------
      (C⟨ X ⨾ W ⟩ ⊢ A × C⟨ Y ⨾ W ⟩ ⊢ A → C⟨ Z ⨾ W ⟩ ⊢ A)

    or-introduction-1 :
      X ⊢ A →
      ---------
      X ⊢ (A ∨ B)

    or-introduction-2 :
      X ⊢ B →
      ---------------
      X ⊢ (A ∨ B)

    or-elimination :
      X ⊢ (A ∨ B) →
      --------------------------------------------------
      (C⟨ (S A) ⟩ ⊢ C × C⟨ (S B) ⟩ ⊢ C  → C⟨ X ⟩ ⊢ C)


or-if-distrib :
  Or-Logic _⇒₁_ _∨₁_ →
  And-Logic _⇒₁_ _∧₁_ →
  ---------------------------------------
  S ((A ⇒₁ C) ∧₁ (B ⇒₁ C)) ⊢ ((A ∨₁ B) ⇒₁ C)

or-if-distrib x y =
   Backbone.⇒-introduction z
    (Or-Logic.product-context x
      (Or-Logic.semicolon-product-context-l x
        (Or-Logic.or-elimination x
          (Backbone.hypothesis z)))
      ⟨ Backbone.⇒-elimination z
        (And-Logic.and-elimination-1 y
          (Backbone.hypothesis z))
        (Backbone.hypothesis z) ,
        Backbone.⇒-elimination z
          (And-Logic.and-elimination-2 y
            (Backbone.hypothesis z))
          (Backbone.hypothesis z) ⟩)
    where
    z = Or-Logic.has-backbone x
