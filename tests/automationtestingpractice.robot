*** Settings ***

Resource    ../resources/page_objects/main_page_object.resource

*** Variables ***
${name}     Amanda
${email}     aa@email.com
${phone}     1187655556
${address}     Rua Amendoada,55

*** Test Cases ***
Test blog form page
        Open blog automation Page
        Maximize Window
        Fill name field    ${name}
        Fill email field    ${email}
        Fill phone number field    ${phone}
        Fill address field    ${address}
        Choose Gender option   female
        Choosing day of the week by position    3
        Choosing day of the week by value    Monday
        Choosing a country    Brazil
        Choosing color    White
        Validate table   7    1
        Validate Especified Value   Javascript
        Select Page from Table Pages    3   #Fazer por valor tambem
        Click checkbox table by value    Product 14
        Click Submit Button