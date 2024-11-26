*** Settings ***
Documentation                      Keywords for the kadena web application
Resource                           ../resources/PO/Login.robot
Resource                           ../resources/PO/Home.robot
Resource                           ../resources/PO/Forecast.robot
Resource                           ../resources/PO/SupplyPlanning.robot
Resource                           ../resources/PO/Tableau.robot
Resource                           ../resources/PO/CreateJSON.robot
Resource                           ../resources/PO/Ordering.robot
Resource                           Common.robot
Library    ../venv/lib/python3.13/site-packages/robot/libraries/Collections.py
Library                            JSONLibrary
Library                            SikuliLibrary

*** Variables ***
${LOAD_TIME_RESULT}=        LOAD_TIME_RESULT.json

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

I should be redirected to the
    [Arguments]                         ${text}    ${locator}
    Home.Verify header text             ${text}    ${locator}

The Forecasting Page should be clickable
    [Arguments]                        ${locator}
    Home.Verify element if clickable   ${locator}    ${True}

The link should not be clickable
    [Arguments]                        ${locator}
    Home.Verify element if clickable   ${locator}    ${False}

The link should be clickable
    [Arguments]                        ${locator}
    Home.Verify element if clickable   ${locator}    ${True}

I navigate to
    [Arguments]                        ${url}
    Home.Navigate to page              ${url}

The page should display
    [Arguments]                        ${text}
    Home.Verify page display           ${text}

I logged in with valid credentials
    [Arguments]        ${email}    ${email_locator}
    ...                ${password}    ${password_locator}
    I go to Login page
    I enter            ${email}    ${email_locator}
    I enter            ${password}    ${password_locator}

I get the load time
    [Arguments]        ${module}
    ...                ${iteration}
    ...                ${element}
    ...                ${url}
    ...                ${text}
    
    ${load_results}=     Create List

    FOR    ${counter}    IN RANGE    0    ${iteration}
        Home.Verify element if clickable   ${module}    ${True}
        ${result}=       Tableau.Validate Load Time    ${text}
        Append To List   ${load_results}    ${result}
        ${last_iteration}=    Evaluate    ${iteration} - 1    modules=builtins
        Run Keyword If    ${counter} != ${last_iteration}    Go To    ${url}
    END

    CreateJSON.Write Load Times to JSON    ${load_results}
    