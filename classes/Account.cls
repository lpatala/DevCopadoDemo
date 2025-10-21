/*
    Types of Classes - 
        1. Final  - Classes which cannot be extended.
        2. Virtual - Classes which can be extended.
        3. Abstract - Abstract classes can be extended but not instantiated.
    Note: 
     * Virtual class methods should have body and it is not possible to create the method prototype in Apex.
     * Abstract class can contain methods with body or without body.

*/
public Virtual class Account {

    protected Integer balance = 5000;

    public Integer deposit(Integer amount) {
        balance += amount;
        return balance;
    }

    public Virtual Integer withdraw(Integer amount) {
        try {
            if (amount > balance) {
                throw new MyException(
                    'Insufficient Funds Exception: You do not have the sufficient funds to complete this transaction'
                    + '\nCurrent Balance: ' + balance
                    + '\nRequested Withdrawal: ' + amount
                );
            }
            balance -= amount;
        }
        catch (MyException e) {
            System.debug('Exception: ' + e.getMessage());
        }
        return balance; 
    }
}