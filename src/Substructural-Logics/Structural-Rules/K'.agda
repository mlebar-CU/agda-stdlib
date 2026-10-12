----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Commuted Weakening structural rule
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.K'
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
   where

private
  variable
    A B C : Lang
    X Y Z : Struct

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_ 

record K'-Logic (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone  _⇒_

    commute-weaken :
      C⟨ X ⟩ ⊢ A →
      ---------------
      C⟨ Y ⨾  X ⟩ ⊢ A
