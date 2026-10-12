----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Mingle structural rule
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.M 
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

record M-Logic
  (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone  _⇒_

    weak-contract :
      C⟨ X ⟩ ⊢ A →
      ------------------
      C⟨ (X ⨾  X) ⟩ ⊢ A
