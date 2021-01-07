trigger NotDeleteReq on Requirement__c (before delete) 
{
	if (Trigger.isBefore && Trigger.isDelete) // In a before delete trigger, the trigger accesses the records that will be
        { 	 				  // deleted with the Trigger.old list.
            for (Requirement__c req : Trigger.old) 
            {
            	if (req.Status__c == 'Approved') 
                {
                    System.debug('In before delete -> You can\'t delete this Approved Requirement record !');
                	req.addError('You can\'t delete this Approved Requirement record !');
            	} 
        	}
    	}
}