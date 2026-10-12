----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with 'and' connective + related proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K  --safe #-}

module Substructural-Logics.Connectives.And 
  {l s ℓ} {Lang : Set l} {Struct : Set s} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set ℓ)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  
  where

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_
open import Level using (Level; _⊔_)

private
  variable
    A B C : Lang
    X Y Z : Struct
    _⇒₁_ : Lang → Lang → Lang
    _∧₁_ : Lang → Lang → Lang
    

record And-Logic (_⇒_ _∧_ : Lang → Lang → Lang) : Set (l ⊔ s ⊔ ℓ) where
  field
    has-backbone : Backbone _⇒_
    and-introduction :
      X ⊢ A →
      X ⊢ B →
      -------------------
      X ⊢ (A ∧ B)
    and-elimination-1 :
      X ⊢ (A ∧ B) →
      -------------------
      X ⊢ A
    and-elimination-2 :
      X ⊢ (A ∧ B) →
      -------------------
      X ⊢ B

if-and-distrib :
  And-Logic (_⇒₁_) (_∧₁_) →
  -----------------------------------------------------------------
  (S ((A ⇒₁ B) ∧₁ (A ⇒₁ C))) ⊢ (A ⇒₁ (B ∧₁ C))

-- proof from page 34
if-and-distrib x = 
  Backbone.⇒-introduction y
    (And-Logic.and-introduction x
      (Backbone.⇒-elimination y
        (And-Logic.and-elimination-1 x
          (Backbone.hypothesis y))
        (Backbone.hypothesis y))
      (Backbone.⇒-elimination y
        (And-Logic.and-elimination-2 x
          (Backbone.hypothesis y))
        (Backbone.hypothesis y)))
    where
    y = And-Logic.has-backbone x

