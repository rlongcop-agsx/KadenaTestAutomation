*** Settings ***
Library                          SeleniumLibrary
Resource                         ../../variables//KadenaVariable.robot

*** Variables ***
${LOGIN_HEADER}=                 Connexi

*** Keywords ***
Navigate to login page
    Go To                        ${LOGINPAGE_URL}

Verify Page Loaded
    Wait Until Page Contains     ${LOGIN_HEADER}

Enter Credential
    [Arguments]                  ${credential}    ${locator}
    Input Text                   ${locator}       ${credential}

Click submit button
    [Arguments]                  ${locator}
    Click Button                 ${locator}

Validate Error Message
    [Arguments]                  ${text}
    Page Should Contain          ${text}