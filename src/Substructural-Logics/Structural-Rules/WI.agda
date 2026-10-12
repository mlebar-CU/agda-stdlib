----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Weak Contraction structural rule
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.WI 
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  where

private
  variable
    A : Lang
    X : Struct

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_ 

record WI-Logic
  (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    weak-contract :
      C⟨ (X ⨾  X) ⟩ ⊢ A →
      ------------
      C⟨ X ⟩ ⊢ A
