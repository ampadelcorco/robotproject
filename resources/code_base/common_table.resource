*** Settings ***
Library    SeleniumLibrary
Library    BuiltIn
Resource   common_elements.resource
Resource   ../page_objects/main_page_object.resource
Resource   ../page_objects/automation_blog/automation_blog_page.resource

*** Keywords ***
Row count
    [Arguments]    ${tableLocator}      
    ${rowCount}=    SeleniumLibrary.Get Element Count    ${tableLocator}
    [Return]  ${rowCount}

Column count
    [Arguments]    ${tableLocator}      
    ${colCount}=    SeleniumLibrary.Get Element Count    ${tableLocator}
    [Return]  ${colCount}

Get cell by position
    [Arguments]    ${tableLocator}    ${row}    ${col}
    ${tableCell}=    Get Table Cell    ${tableLocator}    ${row}    ${col}
    [Return]    ${tableCell}

Header Click
    [Arguments]        ${tableLocator}    
    Click Element    ${tableLocator}   

Click on Cell
    [Arguments]        ${tableLocator}    ${row}    ${col}
    Click Element    ${tableLocator}    ${row}    ${col}

Table Cell Contains
    [Arguments]    ${tableLocator}    ${row}    ${col}    
    Table Should Contain   ${tableLocator}    ${row}    ${col}   

Get Table Cells
    [Arguments]    ${table_locator}

    ${cells}=     Get WebElements    ${table_locator} //td
    [Return]    ${cells}

Get Table Rows
    [Arguments]    ${table_locator}

    ${rows}=     Get WebElements    ${table_locator} //tr
    [Return]    ${rows} 

Row should contain
    [Arguments]    ${tableLocator}    ${row}    ${col}    ${expectedValue}
    Table Row Should Contain    ${tableLocator}    ${row}    ${col}    ${expectedValue}

Header should contain
    [Arguments]    ${tableLocator}    ${expectedValue}
    Table Header Should Contain    ${tableLocator}    ${expectedValue}

Get Table Cell By position validating expected cell value
    [Arguments]    ${tableLocator}    ${expectedValue}
    ${rowCount}=    Get Element Count    ${tableLocator} tr
    ${colCount}=    Get Element Count    ${tableLocator} th
    ${result}=    Create List

    FOR    ${row}    IN RANGE    1    ${rowCount+1}
        ${currentRow}=    Set Variable    ${row}
        FOR    ${col}    IN RANGE    1    ${colCount+1}
            ${currentColInLoop}=    Set Variable    ${col}
            ${cellLocator}=    Set Variable    css:tr:nth-child(${row}) td:nth-child(${col})
            ${cellValue}=    Get Text    ${cellLocator}
            IF    '${cellValue}' == '${expectedValue}'
                Append To List    ${result}    [${cellValue}, ${currentRow}, ${currentColInLoop}]
            END
        END
    END
    [Return]    ${result}

Get Table Cell without header By row and column value
    [Arguments]    ${table_locator}   ${table_header_locator}    ${row_item}    ${column_item}

    ${colCount}=    Get column index on table body by text ${table_header_locator} ${column_item}
    ${row_list}=    Get rows on table without header by text ${table_locator} ${row_item}
#    ${target_elements}=    Get element from row list by column index ${row_list}    ${colCount}

    [Return]     ${colCount}

Append Variables
    [Arguments]     ${variavel1}    ${variavel2}
    ${appended_locator}=     Set Variable    ${variavel1}${variavel2}
    [Return]    ${appended_locator}

Get column index on table body by text
    [Arguments]    ${table_header_locator}    ${column_item}
    ${header_cells}=     Get WebElements   ${table_header_locator}
    ${columnIndex}=    Set Variable    -1
    ${length}=    Get Length    ${header_cells}
    FOR    ${index}    IN RANGE  ${length}
        ${cellValue}=    Get Text    ${header_cells}[${index}]
        IF    '${cellValue}' == '${column_item}'
            ${adjustedIndex}=     Evaluate     ${index} + 1
            Set Test Variable    ${columnIndex}    ${adjustedIndex}
            Exit For Loop If      '${cellValue}' == '${column_item}'       
        END
    END
    [Return]    ${columnIndex}
    LOG     The ${column_item} is located at column ${columnIndex}

Get rows on table without header by text
    [Arguments]    ${table_locator}     ${row_item}
    ${rows}=    Get WebElements    ${table_locator} tr
    ${length}=    Get Length    ${rows}
    ${variavel}=    Set Variable  2
    FOR    ${row}    IN    @{rows}
        ${locator}=    Create List    ${row}    css:td
        ${cells}=    Get WebElements     ${locator}
        # ${cells}=    Call Method    ${row}      find_element        class=td  
        Log    ${cells}
    END
    #${row}=    Set Variable    ${rows}:nth-of-type(${variavel})
    #${matching_rows}=    Create List

    #FOR    ${index}    IN RANGE    1    ${length}   
    #    ${row}=    Get WebElements    ${rows}[${index}] td
    #    FOR    ${cell}    IN    @{row}
    #        ${cell_value}=    Get Text    ${cell}
    #        LOG     ${cell_value}
    #        LOG     ${row_item}
    #        Run Keyword If    '${cell_value}' == '${row_item}'
    #            Append To List    ${matching_rows}    ${rows}[${index}]
    #    END
    #END

    #Run Keyword If    Length    ${matching_rows} == 0
    #    Log    No rows containing '${row_item}' were found in the table.

    #[Return]    ${matching_rows}
    #Log    ${matching_rows}

Get Pagination Table Page Elements
    [Arguments]    ${locator}
    ${pageElements}=    Get WebElements    ${locator}
    [Return]    ${pageElements}

Click Page In Pagination Table
    [Arguments]    ${locator}    ${pageNumber}
    ${pageElements}=    Get Pagination Table Page Elements    ${locator}
    ${pageNumberInteger}=    Convert To Integer    ${pageNumber}
    ${pageNumberElement}=    Get From List    ${pageElements}    ${pageNumberInteger - 1}
    Click Element    ${pageNumberElement}

#Change Page In Pagination Table
#    [Arguments]    ${locator}    ${targetPage}
#    Click Page In Pagination Table    ${locator}    ${targetPage}

#Toggle Checkbox Based on Value in Table
#   [Arguments]    ${table_locator}    ${row_item}    ${column_item}    ${expected_value}
#    ${rowCount}=    Get Element Count    ${table_Locator} tr
#    ${colCount}=    Get Element Count    ${table_Locator} th
#    ${result}=    Create List

#    FOR    ${row}    IN RANGE    1    ${rowCount+1}
#        ${currentRow}=    Set Variable    ${row}
#        FOR    ${col}    IN RANGE    1    ${colCount+1}
#            ${currentColInLoop}=    Set Variable    ${col}
#            ${checkboxLocator}=    Set Variable    css:tr:nth-child(${row}) td:nth-child(${col}) input
#            IF    '${col}' == '${column_item}'
#                IF    '${row}' == '${row_item}'
#    ${checkboxExists}=    Run Keyword And Return Status    Page Should Contain Element    ${checkboxLocator}
#    Run Keyword If    '${checkboxExists}' == 'True'  Select Checkbox    ${checkboxLocator}
#    Log    Checked checkbox for: ${expected_value}
#                END
#            END
#        END
#    END
#    [Return]    ${result}

Toggle Checkbox Based on Value in Table
    [Arguments]    ${pagination_table_locator}    ${valueToFind}    ${row}    ${col}
    ${checkboxLocator}=    Set Variable    css:${pagination_table_locator} tr:nth-child(${row}) td:nth-child(${col}) input
    Click Checkbox    ${checkboxLocator}