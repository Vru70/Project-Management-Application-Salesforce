public class sendReleaseMail
{
 	public static void sendNewMail(List<String> emailAdd, String rRecord )
 	{
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
		// Set recipients to two contact IDs.
		// Replace IDs with valid record IDs in your org.
		message.toAddresses = emailAdd;
		message.subject = 'New release record '+  rRecord +' is created';
		message.plainTextBody = 'Hi, New Release record has been created. Thank You!! ';
		Messaging.SingleEmailMessage[] messages = 
    	new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);
        System.debug('Emial Sending....');
		if (results[0].success) 
        {
    		System.debug('The email was sent successfully.');
		} else {
    		System.debug('The email failed to send: '
          + results[0].errors[0].message);
		}
     
 	}
   
}