*** Settings ***
Resource   ../../code_base/common_elements.resource
Resource   ../../code_base/common_list.resource
Resource   ../../code_base/common_table.resource
Library    String

*** Variables ***
${BROWSER}                       Chrome
${AUTOMATION_URL}                https://testautomationpractice.blogspot.com/
${name_field}                    class=form-group:nth-of-type(1) .form-control:nth-of-type(1)
${email_field}                   class=form-group:nth-of-type(1) .form-control:nth-of-type(2)
${phone_field}                   class=form-group:nth-of-type(1) .form-control:nth-of-type(3)
${address_field}                 class=form-group:nth-of-type(2) .form-control
${gender_male}                   class=form-group:nth-of-type(3) #male
${gender_female}                 class=form-group:nth-of-type(3) #female
${day_checkbox_locator}          class=post-body.entry-content > .form-group:nth-of-type(4) label ~ div input
${days_locator}                  class=post-body.entry-content > .form-group:nth-of-type(4) label ~ div
${country_locator}               class=form-group:nth-of-type(5) .form-control
${color_list_locator}            class=form-group:nth-of-type(6) .form-control
${frame_locator}                 class=widget-content iframe#frame-one796456169
${submit_button}                 class=outside_container .buttons_reverse input
${pagination_table_locator}      id=productTable
${web_table_locator}             class=widget-content > table
${pagination_table_page}         class=pagination > li
${rowCount}                      xpath://table[@name='BookTable']/tbody/tr
${colCount}                      xpath://table[@name='BookTable']/tbody/tr[1]/th
${book_table}                    BookTable

*** Keywords ***
Open blog automation Page
   Browser    ${AUTOMATION_URL}   ${BROWSER}

Fill name field 
    [Arguments]    ${name}
    Insert Text   ${name_field}   ${name}

Fill email field
    [Arguments]    ${email}
    Insert Text   ${email_field}  ${email}

Fill phone number field
    [Arguments]    ${phone}
    Insert Text   ${phone_field}  ${phone}

Fill address field
    [Arguments]    ${address}
    Insert Text   ${address_field}  ${address}

Choosing day of the week by position
    [Arguments]    ${position}
    Click on Element from list by position    ${day_checkbox_locator}    ${position}

Choosing day of the week by value
    [Arguments]    ${value}
    Click on Element from list by value    ${days_locator}    ${value}

Choose Gender option
    [Arguments]    ${gender_option}
    ${gender_option_lower}=    Convert To Lower Case    ${gender_option}
    Run Keyword If    '${gender_option_lower}' == 'female'    Click     ${gender_female}
    ...    ELSE    Click     ${gender_male}

Click Submit Button
    Select Frame    ${frame_locator}
    Click    ${submit_button}
    Unselect Frame

Choosing a country 
    [Arguments]    ${value}
    ${countryValues}=    Get List Items      ${country_locator}
    [Return]    ${countryValues}  
    Select From List By Label    ${country_locator}    ${value}

Choosing color
    [Arguments]    ${value}   
    Select Value From List by label   ${color_list_locator}    ${value}

Validate table
    [Arguments]    ${row}    ${col}   ${expected_value}
    ${actualValue}=    Get cell by position   ${web_table_locator}    ${row}    ${col}
    Validate Table Cell Value    ${book_table}    ${row}    ${col}

Validate Especified Value
    [Arguments]    ${value}
    Get Table Cell By Value    ${web_table_locator}    ${value}
    Validate If Table Cell Have The Expected Value    ${value}   

Select Page from Table Pages
    [Arguments]    ${pageNumber}
    Change Page In Pagination Table    ${pagination_table_page}    ${pageNumber}

Click checkbox table by value
    [Arguments]    ${value}
    Toggle Checkbox Based on Value in Table    ${pagination_table_locator}   ${value}    4