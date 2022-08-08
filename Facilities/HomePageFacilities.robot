*** Settings ***
Library   Selenium2Library
Resource  ../Variables/variables.robot


*** Keywords ***
Home Page Check
    ${passed}  Run Keyword And Return Status  Wait For Element  ${loginBoxTitle}
    Run Keyword If  ${passed}  Log To Console  Home Page Open
    ...  ELSE  FAIL  Home Page Open!!!
    Wait and Click Element    ${cookies}

