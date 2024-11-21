*** Settings ***
Library        SeleniumLibrary
Resource    Login.robot

*** Variables ***

*** Keywords ***
I redirected to the
    [Arguments]                ${text}
    Wait Until Page Contains   ${text}

Click Forecast link
    [Arguments]                ${locator}
    Click Element              ${locator}
    