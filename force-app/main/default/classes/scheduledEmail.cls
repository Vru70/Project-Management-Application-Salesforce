global class scheduledEmail Implements Schedulable
{
    					
    global void execute(SchedulableContext sc)
    {	
        System.debug('Schedule class Constructor Started');
        List<Task_Assigned__c> emailList = [Select Employee_Email_ID__c, Name from Task_Assigned__c where Status__c='In Progress'];
        System.debug('Collected Emails for schedule class');
        sendmail(emailList);                                                           
    }
 
    public void sendmail(List<Task_Assigned__c> emailList)
    {
        System.debug('Inside send email method');
        for(Task_Assigned__c ts :emailList)
        {
            Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
		    // Set recipients to two contact IDs.
		    // Replace IDs with valid record IDs in your org.
            message.toAddresses = new String[] {ts.Employee_Email_ID__c};
		    message.subject = 'Task In Progress Daily Email';
            message.plainTextBody = 'Hi,  Task record '+ts.Name+' has chaneged it status to In Progress . Thank You!! ';
            Messaging.SingleEmailMessage[] messages = 
            new List<Messaging.SingleEmailMessage> {message};
            Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
            System.debug('Emial Sending....');
            if (results[0].success) 
            {
                System.debug('The email was sent successfully.');
            } else 
            {
                System.debug('The email failed to send: '+ results[0].errors[0].message);
            }

        }
                
    }
}
//every day at 6 pm
//scheduledEmail sc = new scheduledEmail();
//string cronExp = '0 0 18 * * ? *';
//system.schedule('Send Email to Task Employee', cronExp, sc);
//
//