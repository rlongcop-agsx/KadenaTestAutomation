*** Settings ***
Documentation                      Keywords for the kadena web application
Resource                           ../resources/PO/Login.robot
Resource                           ../resources/PO/Home.robot
Resource                           ../resources/PO/Forecast.robot
Resource                           ../resources/PO/SupplyPlanning.robot
Resource                           ../resources/PO/Ordering.robot
Resource                           Common.robot

*** Keywords ***
I go to Login page
    Login.Navigate to login page
    Login.Verify Page Loaded

I enter
    [Arguments]                    ${credential}    ${locator}
    Login.Enter Credential         ${credential}    ${locator}

I click the button
    [Arguments]                    ${locator}
    Login.Click submit button      ${locator}

A message should display
    [Arguments]                    ${text}
    Login.Validate Error Message   ${text}

I click the link
    [Arguments]                    ${element}
    Forecast.Click Forecast link    ${element}

I should be redirected to the Forcasting Page
    Forecast.I redirected to the        Forecasting

I should be redirected to the Supply Planning Page
    SupplyPlanning.I redirected to the        Supply Planning

I should be redirected to the
    [Arguments]                         ${text}
    Home.I redirected to the            ${text}

The Forecasting Page should be clickable
    [Arguments]                        ${locator}
    Home.Verify element if clickable    ${locator}    ${True}

The link should not be clickable
    [Arguments]                        ${locator}
    Home.Verify element if clickable    ${locator}    ${False}

The link should be clickable
    [Arguments]                        ${locator}
    Home.Verify element if clickable    ${locator}    ${True}