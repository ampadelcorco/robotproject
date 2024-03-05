*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Library    OperatingSystem
Library    Collections
Library    DateTime

*** Keywords ***

Click
    [Arguments]    ${locator}
    Click Element    ${locator}

Access Link
    [Arguments]    ${locator}
    Click Link    ${locator}

Insert Text
    [Arguments]    ${locator}    ${text}
    Input Text    ${locator}    ${text}

Browser
    [Arguments]    ${AUTOMATION_URL}   ${BROWSER}
    Open Browser    ${AUTOMATION_URL}   ${BROWSER}
    
Maximize Window
    Maximize Browser Window

Go Back Page
    Go Back

Wait Until Text Visible
    [Arguments]    ${text}
    Wait Until Page Contains    ${text}

Should Contain Element
    [Arguments]    ${locator}
    Page Should Contain Element    ${locator}

Validate Disabled Elemente
    [Arguments]    ${locator}
    Element Should Be Disabled    ${locator}

Validate value
    [Arguments]    ${actual_Value}    ${expected_Value}
    Should Be Equal As Strings    ${actual_Value}  ${expected_Value}

Click Checkbox
     [Arguments]    ${locator}
     Select Checkbox    ${locator}
    
Wait Until Element Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}
Clear
    [Arguments]    ${locator}
    Clear Element Text    ${locator}

Clear And Type
    [Arguments]    ${locator}   ${text}
    Clear Element Text    ${locator}
    Insert Text    ${locator}   ${text}