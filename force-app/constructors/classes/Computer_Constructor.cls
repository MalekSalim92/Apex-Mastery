public with sharing class Computer_Constructor 
{
  
    private String computer_type;
    
    public Computer_Constructor()
    {
        computer_type  = 'Gaming';
    }

    public Computer_Constructor(String computer_type)
    {
        this.computer_type = computer_type;
    }

    public void printType()
    {System.debug(computer_type);

    }

}