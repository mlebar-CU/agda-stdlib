------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic + some basic proofs about conditional
------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Backbone 
  {l s ℓ} {Lang : Set l} {Struct : Set s} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set ℓ)
  (C⟨_⟩ : Struct → Struct )
  (_⨾_ : Struct → Struct → Struct)
  where

open import Data.Product using (_×_; proj₁; proj₂) renaming (_,_ to ⟨_,_⟩)
open import Level using (Level; _⊔_)
open import Function.Base using (_∘_)

private 
  variable
    A B C : Lang
    X Y Z : Struct
    _⇒₁_ _⇒₂_ : Lang → Lang → Lang

record Backbone (_⇒_ : Lang → Lang → Lang)  : Set (l ⊔ s ⊔ ℓ) where
  field
    hypothesis :
      -------------------
      (S A) ⊢ A

    context-elimination :
      (C⟨ X ⟩ ⊢ A → C⟨ Y ⟩ ⊢ A) →
      X ⊢ A →
      ---------
      Y ⊢ A

    left-semicolon-context-introduction :
      (C⟨ X ⟩ ⊢ A → C⟨ Y ⟩ ⊢ A) →
      ----------------------------------------
      (C⟨ Z ⨾ X ⟩ ⊢ A → C⟨ Z ⨾ Y ⟩ ⊢ A)

    right-semicolon-context-introduction :
      (C⟨ X ⟩ ⊢ A → C⟨ Y ⟩ ⊢ A) →
      ----------------------------------------
      (C⟨ X ⨾ Z ⟩ ⊢ A → C⟨ Y ⨾ Z ⟩ ⊢ A)

    ⇒-introduction :
      (X ⨾ S A) ⊢ B →
      -------------
      X ⊢ (A ⇒ B)

    ⇒-elimination :
      X ⊢ (A ⇒ B) →
      Y ⊢ A →
      -------------
      (X ⨾ Y) ⊢ B

  -- proof from page 23
  deduction-to-implication-transitivity :
    S A ⊢ B →
    ------------------------
    S (B ⇒ C) ⊢ (A ⇒ C)


  deduction-to-implication-transitivity = ⇒-introduction
    ∘ ⇒-elimination hypothesis

-- Lemma 2.22 (Uniqueness of conditionals)
conditional-unique-lemma :
 
  Backbone _⇒₁_ →
  Backbone  _⇒₂_ →
  ------------------------------------------------
  S (A ⇒₁ B) ⊢ (A ⇒₂ B)

conditional-unique-lemma L₁ L₂ = 
  ⇒-introduction (⇒-elimination hypothesis hypothesis)
    where 
    open Backbone L₁ using (hypothesis; ⇒-elimination)
    open Backbone L₂ using (⇒-introduction)


conditional-unique : 
  
  Backbone _⇒₁_ → 
  Backbone _⇒₂_ → 
  ------------------------------------------------
  S (A ⇒₁ B) ⊢ (A ⇒₂ B) × S (A ⇒₂ B) ⊢ (A ⇒₁ B)

conditional-unique L₁ L₂ = 
  ⟨ conditional-unique-lemma L₁ L₂ , conditional-unique-lemma L₂ L₁ ⟩
