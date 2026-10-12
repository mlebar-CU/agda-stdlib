----------------------------------------------------------------------------
-- The Agda standard library
--
-- Logic with Twisted Associative structural rule + related
-- proof
----------------------------------------------------------------------------

{-# OPTIONS --without-K --safe #-}

module Substructural-Logics.Structural-Rules.B' 
  {Lang : Set} {Struct : Set} (S : Lang → Struct)
  (_⊢_ : Struct → Lang → Set)
  (C⟨_⟩ : Struct → Struct)
  (_⨾_ : Struct → Struct → Struct)
  where

private
  variable
    A : Lang
    X Y Z : Struct

open import Substructural-Logics.Backbone S _⊢_ C⟨_⟩ _⨾_

record B'-Logic
  (_⇒_ : Lang → Lang → Lang) : Set where
  field
    has-backbone : Backbone _⇒_

    twisted-assoc :
      ----------------------------------------------------
      (C⟨ (X ⨾ ( Y ⨾ Z)) ⟩ ⊢ A → C⟨ ((Y ⨾  X) ⨾ Z) ⟩ ⊢ A)
