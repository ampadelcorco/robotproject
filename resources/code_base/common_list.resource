*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    common_elements.resource

*** Keywords ***

Select List By Value
    [Arguments]    ${list_locator}    ${value}
    Select From List By Value    ${list_locator}    ${value}

Select Value From List by label  
       [Arguments]    ${locator}    ${value}
       Select From List By Label    ${locator}    ${value}

Select List Item With Index
    [Arguments]    ${list_locator}    ${index}
    Select From List By Index    ${list_locator}    ${index}

Insert Text on Element from list by value
    [Arguments]    ${list_locator}    ${value}     ${text}
    ${element}=     Get Element From Multiline String    ${list_locator}    ${value}
    Insert Text    ${element}    ${text}

Click on Element from list by position
    [Arguments]    ${list_locator}    ${position}
    ${element}=     Get Element from list by position    ${list_locator}    ${position}
    Click Element    ${element}

Click on Element from list by value
    [Arguments]    ${list_locator}    ${value}
    ${element}=     Get Element from list by value    ${list_locator}    ${value}
    Click Element    ${element}
Get Element from list by position
    [Arguments]    ${list_locator}    ${position}     
    ${elements}=    Get WebElements    ${list_locator}     
    ${element}=     Get From List    ${elements}  ${position}   
    [Return]        ${element}
Get Element from list by value
    [Arguments]    ${list_locator}    ${value}     
    ${elements}=    Get WebElements    ${list_locator}
    FOR    ${element}    IN    @{elements}
        ${element_text}=    Get Text    ${element}
        ${lowercase_value}=    Convert To Lower Case    ${value}
        ${lowercase_element_text}=    Convert To Lowercase    ${element_text}
        Run Keyword If    '${lowercase_element_text}' == '${lowercase_value}'    Return From Keyword    ${element}
    END
    Fail    The value is not in the list: ${value}

Get Element From Multiline String
    [Arguments]    ${list_locator}    ${value}     
    ${elements}=    Get WebElements    ${list_locator}
    ${lowercase_value}=    Convert To Lowercase    ${value}
    ${text}=    '''${value}:
    FOR    ${element}    IN    @{elements}
        ${element_text}=    Get Text    ${element}
        ${lowercase_element_text}=    Convert To Lowercase    ${element_text}
        Run Keyword If    '${lowercase_element_text}' == '${lowercase_value}'    Return From Keyword    ${element}
    END
    Fail    The value is not in the list: ${value}
    