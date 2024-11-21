*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
Verify element if clickable
    [Arguments]        ${locator}    ${expected_status}
    ${actual_status}=    Run Keyword And Return Status    Click Element    ${locator}
    Should Be Equal    ${actual_status}    ${expected_status}

I redirected to the
    [Arguments]                ${text}
    Wait Until Page Contains   ${text}