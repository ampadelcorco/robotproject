*** Settings ***
Library    SeleniumLibrary
Resource    common_elements.resource

*** Keywords ***

Table Click Cell
    [Arguments]    ${table_locator}    ${row}    ${column}
    Click   xpath=//table[@id='${table_locator}']/tbody/tr[${row}]/td[${column}]