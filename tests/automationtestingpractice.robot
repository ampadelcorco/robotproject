*** Settings ***

Resource    ../resources/page_objects/main_page_object.resource

*** Test Cases ***
Test blog form page
        Open blog automation Page
        Maximize Window
        Validate table temporary   Amit
#        Fill name field    Amanda
#        Fill email field    aa@email.com
#        Fill phone number field    1187655556
#        Fill address field    Rua Amendoada,55
#        Choose Gender option   female
#        Choosing day of the week by position    3
#        Choosing day of the week by value    Monday
#        Choosing a country    Brazil
#        Choosing color    White
#        Validate cell value by row and column  3    1    Learn Java
#        Validate Especified Value by row and column value   Animesh    Subject    Javascript 
#        Select Page from Table page number    3
#        Click checkbox table by value    Product 14
#        Click Submit Button