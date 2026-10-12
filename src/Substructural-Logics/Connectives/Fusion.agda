----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with 'fusion' connective + related proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Connectives.Fusion 
   {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  where

private 
  variable
    A B C : Lang
    X Y Z : Struct
    _⇒₁_ _⇒₂_ : Lang → Lang → Lang
    _⇐₁_ _⇐₂_ : Lang → Lang → Lang
    _∘₁_ _∘₂_ : Lang → Lang → Lang

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_
open import Data.Product using (_×_; proj₁; proj₂) renaming (_,_ to ⟨_,_⟩)

record Fusion-Logic
  (_⇒_ _∘_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    fusion-introduction :
      X ⊢ A → Y ⊢ B →
      -------------------
      (X ⨾ Y) ⊢ (A ∘ B)

    fusion-elimination :
      X ⊢ (A ∘ B) →
      ------------------------------------------
      C⟨ (S A) ⨾ (S B) ⟩ ⊢ C → C⟨ X ⟩ ⊢ C


-- Lemma 2.25 (Uniqueness of fusion)
fusion-unique :
  Fusion-Logic _⇒₁_ _∘₁_ →
  Fusion-Logic _⇒₁_ _∘₂_  →
  ---------------------------------------------------------
  (S (A ∘₁ B)) ⊢ (A ∘₂ B) × (S (A ∘₂ B)) ⊢ (A ∘₁ B)

fusion-unique x y =
  ⟨ Backbone.context-elimination z
      (Fusion-Logic.fusion-elimination x (Backbone.hypothesis w))
      (Fusion-Logic.fusion-introduction y
          (Backbone.hypothesis w)
          (Backbone.hypothesis w)) ,
    Backbone.context-elimination w
      (Fusion-Logic.fusion-elimination y (Backbone.hypothesis z))
      (Fusion-Logic.fusion-introduction x
          (Backbone.hypothesis z)
          (Backbone.hypothesis z)) ⟩
    where
    z = Fusion-Logic.has-backbone x
    w = Fusion-Logic.has-backbone y
