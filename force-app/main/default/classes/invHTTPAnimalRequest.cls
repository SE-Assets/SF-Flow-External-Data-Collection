public with sharing class invHTTPAnimalRequest {
    @InvocableMethod(label='Get Animal List' description='HTTP req to pick up a list of animals apparently')
    //alright, so since we need to return a list of strings for each call, you return a list<list>
    //this is mainly because if you pb'd this, you'd be executing it once for all the times, and returning
    //a list to each callout of it. We aren't doing that but we still playin by the rules, feel?
    public static List<List<string>> invHTTPAnimalRequest() {
        //I forget how to do an http request EVERY TIME
        //every time I go to this url and essentially copy/paste
        //https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_classes_restful_http_httprequest.htm
        HTTP http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals'); //got this from trailhead. thx.
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        List<String> animalList = new list<String>();
        if(response.getStatusCode() == 200){
            Map<string, object> results = (Map<string, object>) JSON.deserializeUntyped(response.getBody());
            List<Object> animals = (List<Object>) results.get('animals');
            for(Object animal:animals)
                animalList.add(String.valueOf(animal));
        }
        List<List<String>> returnList = new List<List<String>>();
        returnList.add(animalList);
        return returnList;
    }
}
