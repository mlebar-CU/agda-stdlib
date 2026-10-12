----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with backward conditional connective +
-- related proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Connectives.Backif 
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct)
  where

private 
  variable
    A B C : Lang
    X Y Z : Struct
    _⇒₁_ _⇒₂_ : Lang → Lang → Lang
    _⇐₁_ _⇐₂_ : Lang → Lang → Lang

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_
open import Data.Product using (_×_; proj₁; proj₂) renaming (_,_ to ⟨_,_⟩)

record Backif-Logic
    (_⇒_ _⇐_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    backif-introduction :
      ((S A) ⨾ X) ⊢ B →
      -------------------
      X ⊢ (B ⇐ A)

    backif-elimination :
      X ⊢ (B ⇐ A) →
      Y ⊢ A →
      -------------------
      (Y ⨾ X) ⊢ B


-- Uniqueness of back-conditionals
backif-unique :
  Backif-Logic (_⇒₁_) (_⇐₁_) →
  Backif-Logic (_⇒₂_) (_⇐₂_) →
  ---------------------------------------------------------
  (S (A ⇐₁ B)) ⊢ (A ⇐₂ B) × (S (A ⇐₂ B)) ⊢ (A ⇐₁ B)

backif-unique x y = 
  ⟨ (Backif-Logic.backif-introduction y
      (Backif-Logic.backif-elimination x
        (Backbone.hypothesis z)
        (Backbone.hypothesis w))) ,
      Backif-Logic.backif-introduction x
        (Backif-Logic.backif-elimination y
          (Backbone.hypothesis w)
          (Backbone.hypothesis z)) ⟩
    where
    z = Backif-Logic.has-backbone x
    w = Backif-Logic.has-backbone y
