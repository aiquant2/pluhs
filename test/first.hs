{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE NoImplicitPrelude   #-}
{-# LANGUAGE TemplateHaskell     #-}
{-# LANGUAGE TypeApplications    #-}
{-# LANGUAGE ScopedTypeVariables  #-}
{-# LANGUAGE TypeFamilies        #-}
{-# LANGUAGE OverloadedStrings   #-}

module Escrow where

import           Plutus.Contract
import           PlutusTx
import           PlutusTx.Prelude
import           Ledger
import           Ledger.Constraints as Constraints
import           Prelude (Semigroup (..), Show (..), String)

-- Escrow data type
data Escrow = Escrow
    { buyer   :: PubKeyHash
    , seller  :: PubKeyHash
    , amount  :: Integer
    }

-- Plutus script validator function
{-# INLINABLE mkValidator #-}
mkValidator :: Escrow -> () -> ScriptContext -> Bool
mkValidator escrow () ctx =
    traceIfFalse "not signed by buyer" (txSignedBy info (buyer escrow)) &&
    traceIfFalse "insufficient funds" (valuePaidTo info == Ada.lovelaceValueOf (amount escrow))
  where
    info = scriptContextTxInfo ctx

-- Wrap the validator function
validator :: Escrow -> Validator
validator escrow = mkValidator escrow

-- Create a validator script
validatorScript :: Escrow -> Ledger.Validator
validatorScript escrow = mkValidatorScript $$(PlutusTx.compile [|| mkValidator ||])

-- Create the escrow contract
startEscrow :: PubKeyHash -> PubKeyHash -> Integer -> Contract w s Text ()
startEscrow buyer' seller' amount' = do
    let escrow = Escrow buyer' seller' amount'
        v = validator escrow
        tx = Constraints.mustPayToTheScript () (Ada.lovelaceValueOf amount')
    ledgerTx <- submitTxConstraints v tx
    void $ awaitTxConfirmed $ getCardanoTxId ledgerTx

-- Redeem function to allow seller to withdraw funds
redeem :: Escrow -> Contract w s Text ()
redeem escrow = do
    let tx = Constraints.mustPayToPubKey (seller escrow) (Ada.lovelaceValueOf (amount escrow))
    ledgerTx <- submitTxConstraints (validator escrow) tx
    void $ awaitTxConfirmed $ getCardanoTxId ledgerTx
