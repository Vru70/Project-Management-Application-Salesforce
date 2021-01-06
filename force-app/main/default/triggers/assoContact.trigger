trigger assoContact on Account (after insert) 
{

    if(Trigger.isAfter && Trigger.isInsert)
    {
        List<Contact> ListCon = new List<Contact>();    
        List<Opportunity> ListOpp = new List<Opportunity>();
   	 	for(Account A : Trigger.new)
    	{
            Contact C = new Contact();
        	C.AccountId = A.Id;
        	C.LastName = A.Name;
        	C.Phone = A.Phone;
        	ListCon.add(C);
            System.debug(C.LastName+'Added to list');
            
            if(A.Number_of_Opportunities__c > 0)
            { 
                for(Integer i=0; i < A.Number_of_Opportunities__c ; i++ )
                {
                    Opportunity opp = new Opportunity();
                    opp.AccountId = A.Id;
                    opp.Name = A.Name+' '+i ;
                    Date d1 = Date.today();
                    opp.CloseDate = d1.addDays(30);
                    opp.StageName='Prospecting';
                    ListOpp.add(opp);                    
                }
             }
            
            if(ListOpp != NULL)
                insert ListOpp;
            
            System.debug('Opportuity List added susccesfuly');
            
            if(ListCon != NULL)
        		insert ListCon;
    
    		System.debug('Contact List added susccesfuly');
        
            
    	}
      
    }
    
}