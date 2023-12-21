*** Settings ***
Library    SeleniumLibrary
Resource    common_elements.resource

*** Keywords ***

Select List By Value
    [Arguments]    ${list_locator}    ${value}
    Select From List By Value    ${list_locator}    ${value}

List Click by position
    [Arguments]    ${list_locator}    ${row}
    Click   xpath=//list[@id='${list_locator}']/tbody/tr[${row}]