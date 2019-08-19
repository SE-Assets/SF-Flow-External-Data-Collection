public class externalPhone {
    //this needs to be a top level class
        //auraEnabled for flow to accept as a var type
        //invocableVariable for invocableMethods to accept as a return type
        @AuraEnabled @InvocableVariable
        public String Brand;

        @AuraEnabled @InvocableVariable
        public String DisplayUrl;

        @AuraEnabled @InvocableVariable
        public String ExternalId;

        @AuraEnabled @InvocableVariable
        public String ID;

        @AuraEnabled @InvocableVariable
        public String PhoneNumber;

        @AuraEnabled @InvocableVariable
        public String UUID;
}