*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Verify element if clickable
    [Arguments]        ${locator}    ${expected_status}
    ${actual_status}=    Run Keyword And Return Status    Click Element    ${locator}
    Should Be Equal    ${actual_status}    ${expected_status}

Get page contains
    [Arguments]                ${text}
    Wait Until Page Contains   ${text}

Get text header
    [Arguments]                ${locator}
    
    ${actual_header_text}=     Wait Until Keyword Succeeds    
    ...                        10    1s    
    ...                        Get Text    
    ...                        ${locator}

Verify header text
    [Arguments]                ${expected_header_text}    
    ...                        ${locator}
    
    ${status}=                 Run Keyword And Return Status    
    ...                        Get text header    
    ...                        ${locator}
    
    IF    '${status}' == 'FAIL'
        Get page contains      ${expected_header_text}
    END

Navigate to page
    [Arguments]                ${url}
    Go To                      ${url}

Verify page display
    [Arguments]                ${text}
    ${status}=                 Run Keyword And Return Status
    ...                        Wait Until Page Contains   
    ...                        ${text}
    
    Should Be Equal            ${status}    ${True}