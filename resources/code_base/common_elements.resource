*** Settings ***
Library    SeleniumLibrary

*** Keywords ***

Click
    [Arguments]    ${locator}
    Click Element    ${locator}

Insert Text
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Browser
    [Arguments]    ${AUTOMATION_URL}   ${BROWSER}
    Open Browser    ${AUTOMATION_URL}   ${BROWSER}

Maximize Window
    Maximize Browser Window