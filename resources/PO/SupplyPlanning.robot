*** Settings ***
Library        SeleniumLibrary

*** Keywords ***
I redirected to the
    [Arguments]        ${text}
    Wait Until Page Contains    ${text}