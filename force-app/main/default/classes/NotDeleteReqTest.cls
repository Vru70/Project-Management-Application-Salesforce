@isTest
public class NotDeleteReqTest
{ // this test class for do not allow to delete Approved Requirements
    @isTest
    public static void notDeleteTestMethod()
    {
        // Test Client Data
        Client__c cliTest = new CLient__c(Name='TestCLient', Country__c='India', State__c='Maharashtra', 
                                          City__c='Pune', Client_Manager__c='TestClientManager',
                                          Client_Manager_Email_ID__c='testClient_Manager_Email_ID__c@gmail.com',
                            				Company_Email_ID__c='testCompany_Email_ID__c@gmail.com', Industry__c='IT');
        //inserting client data
        insert cliTest;
        system.debug('Client added');
        
        //Test Project Data
        Project__c projectTest = new Project__c(Name='TestProject', Start_Date__c = Date.parse('1/5/2021') , 
                                                End_Date__c =Date.parse('10/5/2021'), Actual_Start_Date__c = Date.parse('2/5/2021') ,
                                               Project_Description__c ='This is Test Project',Budget__c =10000,
                                                Status__c ='Inprogress', Client__c = cliTest.Id, Project_Manager__c='Test Manager',
                                                Project_Manager_Email__c='testProject_Manager_Email__c@gmail.com');
        //Inserting project data
         insert projectTest;
        system.debug('Project added');
        
        //Test Req data
        Requirement__c req = new Requirement__c(Name='TestRequiremnet', Status__c='Approved',
                                                Requirement__c='Test Developer Needed', Project__c =projectTest.Id);
        
        //inserting  Req data
        insert req;
        system.debug('Requ added');
        
        
        // Delete Approved 
        try
        {
            delete req;
        }
        catch(Exception e)
        {
             System.assert(e.getMessage().contains('You can\'t delete this Approved Requirement record !'));
        }
    }
	
}