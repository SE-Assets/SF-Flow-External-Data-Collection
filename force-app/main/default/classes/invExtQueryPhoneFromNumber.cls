public with sharing class invExtQueryPhoneFromNumber {
    @InvocableMethod(label='Find phone from number' description='Ask the remote side for the phone rec matching your number')
    public static List<phoneListObject> invExtQueryPhoneFromNumber(List<String> phoneNumbers){
        //todo: this should crash, don't use it.
        List<phoneListObject> pListList = new List<phoneListObject>();
        phoneListObject pList = new phoneListObject();
        pList.phoneList = new List<externalPhone>();
        string phoneNumber = phoneNumbers[0]; //lol dont do this 
        for(phones__x phone : [select id, brand__c, phonenumber__c, uuid__c, id__c, externalId, displayUrl from phones__x where phonenumber__c = :phoneNumber]){
            externalPhone ePhone = new externalPhone();
            ephone.Brand = phone.brand__c;
            ephone.DisplayUrl = phone.displayurl;
            ephone.ExternalId = phone.externalId;
            ePhone.ID = phone.id__c;
            ephone.PhoneNumber = phone.phonenumber__c;
            ephone.uuid = phone.uuid__c;
            pList.phoneList.add(ephone);
        }
        pListList.add(plist);
        return pListList;
    }
}
