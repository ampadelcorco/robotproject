*** Settings ***
Library    SeleniumLibrary
Resource    common_elements.resource

*** Keywords ***

List Click Cell by position
    [Arguments]    ${table_locator}    ${row}
    Click   xpath=//list[@id='${table_locator}']/tbody/tr[${row}]