trigger sendReleseMail on Releases__c (after insert) 
{
    List<String> emailIdOfManagerAndCLient = new List<String>();
    String rName;
	// send mail to project manager and client manager
	for(Releases__c re : Trigger.New)
    {
       emailIdOfManagerAndCLient.add(re.Client_Manager_Email_ID__c);
       emailIdOfManagerAndCLient.add(re.Project_Manager_Email__c);
       System.debug('Email ID added to List');
        rName = re.Name;
        System.debug('Email ID added to List '+ rName);
    }
    System.debug('Email class calling....');
    sendReleaseMail.sendNewMail(emailIdOfManagerAndCLient, rName);
    
}