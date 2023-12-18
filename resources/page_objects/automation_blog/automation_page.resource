*** Settings ***
Library    SeleniumLibrary
Resource   ../../code_base/common_elements.resource
Resource   ../../code_base/common_list.resource
Resource   ../../code_base/common_table.resource

*** Variables ***
${BROWSER}    Chrome
${AUTOMATION_URL}    https://testautomationpractice.blogspot.com/
${name_field}    id=name
${email_field}   id=email
${phone_field}   id=phone
${address_field}    //*[@id="textarea"]

*** Keywords ***
Open automation Page
   Browser    ${AUTOMATION_URL}   ${BROWSER}

Fill form
    [Arguments]    ${name}    ${email}    ${phone}    ${address}
    Insert Text    ${name_field}    ${name}
    Insert Text    ${email_field}    ${email}
    Insert Text    ${phone_field}    ${phone}
    Insert Text    ${address_field}    ${address}