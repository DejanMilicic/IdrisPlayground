module OTP

data Bit : Type where
    ZeroBit : Bit
    OneBit : Bit

xor : Bit -> Bit -> Bit
xor ZeroBit ZeroBit = ZeroBit
xor ZeroBit OneBit = OneBit
xor OneBit ZeroBit = OneBit
xor OneBit OneBit = ZeroBit

data BitVector : Nat -> Type where
    Nil : BitVector Z
    Cons : Bit -> BitVector n -> BitVector (S n)
%name BitVector xs, ys -- hint for automatic naming

bitwiseXor : (n : Nat) -> BitVector n -> BitVector n -> BitVector n
bitwiseXor 0 [] [] = Nil
bitwiseXor (S k) (Cons x xs) (Cons y ys) = Cons (xor x y) (bitwiseXor k xs ys)

otpEncrypt : (n : Nat) -> (message : BitVector n) -> (key : BitVector n) -> BitVector n
otpEncrypt n message key = bitwiseXor n message key

otpDecrypt : (n : Nat) -> (cipherText : BitVector n) -> (key : BitVector n) -> BitVector n
otpDecrypt n cipherText key = bitwiseXor n cipherText key

-- proof below

total xorCancel : (x : Bit) -> (y : Bit) -> xor (xor x y) y = x
xorCancel ZeroBit ZeroBit = Refl
xorCancel ZeroBit OneBit = Refl
xorCancel OneBit ZeroBit = Refl
xorCancel OneBit OneBit = Refl

total
otpCorrect : (n : Nat) -> (msg : BitVector n) -> (ky : BitVector n) -> otpDecrypt n (otpEncrypt n msg ky) ky = msg
otpCorrect 0 [] [] = Refl
otpCorrect (S n) (Cons x xs) (Cons y ys) = 
    let xor_eq = xorCancel x y in
    rewrite xor_eq in
    let ih = otpCorrect n xs ys in
    rewrite ih in
    Refl
