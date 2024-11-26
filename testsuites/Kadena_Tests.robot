*** Settings ***
Documentation                              This is the main test suite of the Kadena project
Resource                                   ../variables/KadenaVariable.robot
Resource                                   ../variables/KadenaCredentials.robot
Resource                                   ../locators/LoginLocators.robot
Resource                                   ../locators/HomeLocators.robot
Resource                                   ../resources/Common.robot
Resource                                   ../resources/KadenaApp.robot
Test Setup                                 Common.Open Test Browser            ${BROWSER_NAME}
Test Teardown                              Common.Close Test Browser

# robot -d results -v BROWSER_NAME:Edge testsuites

*** Test Cases ***
Test Case 1: Login with invalid password
    [Documentation]                        Login with invalid credentials
    [Tags]                                 M0MAIN-SIT-001    
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            test-order-receiver-3@example.com    ${EMAIL}
    AND I enter                            ${INVALID_PASSWORD}        ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    THEN A message should display          ${INVALID_ERROR_MESSAGE}

Test Case 2: Login with invalid email
    [Documentation]                        Login with invalid credentials
    [Tags]                                 M0MAIN-SIT-001
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            ${INVALID_EMAIL}           ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}          ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    THEN A message should display          ${INVALID_ERROR_MESSAGE}

Test Case 3: Login with access to Forecasting
    [Documentation]                        Login with access to Forecasting
    [Tags]                                 M0MAIN-SIT-002
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            ${VALID_FORECASTING_EMAIL}  ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}           ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    AND A message should display           Welcome
    AND The link should not be clickable   ${ORDERING_LINK}
    AND The link should not be clickable   ${PROCUREMENT_LINK}
    AND The link should not be clickable   ${VENDOR_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${FORECAST_LINK}
    THEN I should be redirected to the     Forecasting                 ${MODULES_HEADER_BANNER}

Test Case 4: Login with access to Supply Planning modules
    [Documentation]                        Login with access to Supply Planning
    [Tags]                                 M0MAIN-SIT-002
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            ${VALID_FORECASTING_EMAIL}  ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}           ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    AND A message should display           Welcome
    AND The link should not be clickable   ${ORDERING_LINK}
    AND The link should not be clickable   ${PROCUREMENT_LINK}
    AND The link should not be clickable   ${VENDOR_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${SUPPLY_LINK}
    THEN I should be redirected to the     Supply Planning             ${MODULES_HEADER_BANNER}

Test Case 5: Login with access to Ordering module
    [Documentation]                        Login with access to Ordering module
    [Tags]                                 M0MAIN-SIT-003    
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            ${VALID_ORDERING_EMAIL}     ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}           ${PASSWORD}   
    WHEN I click the button                ${LOGIN_BUTTON} 
    AND The link should not be clickable   ${FORECAST_LINK}
    AND The link should not be clickable   ${SUPPLY_LINK}
    AND The link should not be clickable   ${PROCUREMENT_LINK}
    AND The link should not be clickable   ${VENDOR_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${ORDERING_LINK}
    THEN I should be redirected to the     Ordering                    ${MODULES_HEADER_BANNER}
    
Test Case 6: Login with access to Procurement module as a Procurement Supervisor
    [Documentation]                        Login with access to Procurement module as a Procurement Supervisor
    [Tags]                                 M0MAIN-SIT-004
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            ${VALID_PROCUREMENT_EMAIL}   ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}            ${PASSWORD}   
    WHEN I click the button                ${LOGIN_BUTTON} 
    AND The link should not be clickable   ${FORECAST_LINK}
    AND The link should not be clickable   ${SUPPLY_LINK}
    AND The link should not be clickable   ${ORDERING_LINK}
    AND The link should not be clickable   ${VENDOR_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${PROCUREMENT_LINK}        
    THEN I should be redirected to the     Procurement                 ${MODULES_HEADER_BANNER}

Test Case 7: Login with access to Procurement module as a Procurement Specialist
    [Documentation]                        Login with access to Procurement module as a Procurement Specialist
    [Tags]                                 M0MAIN-SIT-005
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            ${VALID_PROCUREMENTSP_EMAIL}    ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}               ${PASSWORD}   
    WHEN I click the button                ${LOGIN_BUTTON} 
    AND The link should not be clickable   ${FORECAST_LINK}
    AND The link should not be clickable   ${SUPPLY_LINK}
    AND The link should not be clickable   ${ORDERING_LINK}
    AND The link should not be clickable   ${VENDOR_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${PROCUREMENT_LINK}        
    THEN I should be redirected to the     Procurement                     ${MODULES_HEADER_BANNER}

Test Case 8: Login with access to Vendor module
    [Documentation]                        Login with access to Vendor module
    [Tags]                                 M0MAIN-SIT-006    
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            ${VALID_VENDOR_EMAIL}           ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}               ${PASSWORD}   
    WHEN I click the button                ${LOGIN_BUTTON} 
    AND The link should not be clickable   ${FORECAST_LINK}
    AND The link should not be clickable   ${SUPPLY_LINK}
    AND The link should not be clickable   ${ORDERING_LINK}
    AND The link should not be clickable   ${PROCUREMENT_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${VENDOR_LINK}        
    THEN I should be redirected to the     Vendor                          ${MODULES_HEADER_BANNER}

Test Case 9: Login with access to Quality Management module
    [Documentation]                        Login with access to Quality Management module
    [Tags]                                 M0MAIN-SIT-007    
    ...                                    MAIN
    GIVEN I go to Login page
    AND I enter                            ${VALID_VENDOR_EMAIL}           ${EMAIL}
    AND I enter                            ${VALID_PASSWORD}               ${PASSWORD}   
    WHEN I click the button                ${LOGIN_BUTTON} 
    AND The link should not be clickable   ${FORECAST_LINK}
    AND The link should not be clickable   ${SUPPLY_LINK}
    AND The link should not be clickable   ${ORDERING_LINK}
    AND The link should not be clickable   ${PROCUREMENT_LINK}
    AND The link should not be clickable   ${QUALITY_LINK}
    AND The link should not be clickable   ${INVENTORY_LINK}
    AND The link should be clickable       ${VENDOR_LINK}        
    THEN I should be redirected to the     Quality Management              ${MODULES_HEADER_BANNER}

Test Case 10: Should not be able to access Procurement Page when Ordering credentials are used
    [Documentation]                        Logging in using Ordering credentials
    [Tags]                                 Ordering    
    ...                                    Authentication
    GIVEN I go to Login page
    AND I enter                            ${VALID_ORDERING_EMAIL}        ${EMAIL}
    and I enter                            ${VALID_PASSWORD}              ${PASSWORD}
    WHEN I click the button                ${LOGIN_BUTTON}
    AND I navigate to                      ${PROCUREMENTPAGE_URL}
    THEN The page should display           Unauthorized