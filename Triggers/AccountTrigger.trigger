trigger AccountTrigger on Account (after insert) {
    if(!AccountTriggerHandler.isRecursive) {
        AccountTriggerHandler.isRecursive = true;
        List<Account> listChildAccount = new List<Account>();
        for(Account newAccount : trigger.new) {
            // Create child account
            listChildAccount.add(
                new Account(
                    Name = newAccount.Name + ' - Child',
                    ParentId = newAccount.Id
                )
            );
        }
        try {
            insert listChildAccount;
        } catch(DMLException e) {
            System.debug('AccountTrigger: ' + e.getMessage());
        }
    }
}