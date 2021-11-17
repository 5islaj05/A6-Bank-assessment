package org.solent.ood.bank.model.client;

import org.solent.ood.bank.model.dto.CreditCard;
import org.solent.ood.bank.model.dto.TransactionReplyMessage;

public interface BankRestClient {

    public  TransactionReplyMessage transferMoney(CreditCard fromCard, CreditCard toCard, Double amount);

    public  TransactionReplyMessage transferMoney(CreditCard fromCard, CreditCard toCard, Double amount, String userName, String password);
}
