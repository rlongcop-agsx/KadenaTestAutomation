*** Settings ***
Library        SeleniumLibrary
Library        JSONLibrary
Library        OperatingSystem

*** Keywords ***
Write Load Times to JSON
    [Arguments]          ${load_results}
    ${data}=             Create Dictionary    Load time=${load_results}
    ${json_string}=      Convert Json To String    ${data}    
    ${output_file}=      Set Variable    load_times.json
    Create File          ${output_file}    ${json_string}
    Log                  Load times written to ${output_file}