public with sharing class invExtSinglePhoneFromNumber {
    @InvocableMethod(label='Find phone from number' description='Ask the remote side for the phone rec matching your number')
    public static List<externalPhone> invExtQueryPhoneFromNumber(List<String> phoneNumbers){
        //this is like the anti-bulkification. Not to be used around flammable orgs.
        String phoneNumber = phoneNumbers[0];
        List<externalPhone> epList = new List<externalPhone>();
        for(phones__x phone : [select id, brand__c, phonenumber__c, uuid__c, id__c, externalId, displayUrl from phones__x where phonenumber__c = :phoneNumber limit 1]){
            externalPhone ePhone = new externalPhone();
            ephone.Brand = phone.brand__c;
            ephone.DisplayUrl = phone.displayurl;
            ephone.ExternalId = phone.externalId;
            ePhone.ID = phone.id__c;
            ephone.PhoneNumber = phone.phonenumber__c;
            ephone.uuid = phone.uuid__c;
            epList.add(ephone);
        }
        return epList;
    }
}
