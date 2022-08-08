*** Settings ***
Resource         ../Variables/variables.robot
Library           Collections
Library           String
Library           Selenium2Library
Library           OperatingSystem
Resource          Variables.robot
Library           FakerLibrary  locale=tr_TR
Library           DateTime

*** Keywords ***
Launch Browser
    [Documentation]
    [Arguments]  ${url}=${ınsıderUrl}
    HeadlessChrome  ${url}
    Maximize Browser Window

HeadlessChrome
    [Documentation]
    [Arguments]   ${URL}   ${alias}=None
    Set Environment Variable   webdriver.chrome.driver   ${CURDIR}/chromedriver.exe
#   Set Screenshot Directory  ${CURDIR}/../result/${TEST_NAME}
    ${chrome_options}=    Set Chrome Options
    ${ws}=    Set Variable    window-size=1920,1200
    ${disableLogging}=    Set Variable    --log-level=3
    Call Method   ${chrome_options}    add_argument    ${ws}
    Call Method   ${chrome_options}    add_argument    ${disableLogging}
    Create Webdriver    Chrome   ${alias}   chrome_options=${chrome_options}
    Go To  ${URL}
    Capture Page Screenshot

Set Chrome Options
    [Documentation]
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    FOR    ${option}    IN    @{chrome_arguments}
    Call Method    ${options}    add_argument    ${option}
    END
    [Return]    ${options}

Wait And Click Element
    [Documentation]
    [Arguments]    ${element}    ${timeout}=10 sec    ${interval}=1 sec
    wait for element    ${element}    ${timeout}    ${interval}
    Click Element     ${element}

Wait For Element
    [Documentation]
    [Arguments]    ${element}    ${timeout}=45 sec    ${interval}=0.5 sec
    Wait Until Keyword Succeeds    ${timeout}    ${interval}    Page Should Contain Element    ${element}
    Capture Page Screenshot

When Test Fail Take Screenshot
    Run Keyword If Test Failed    Capture Page Screenshot
    Run Keyword If Test Failed    Close Browser
    Run Keyword If Test Passed    Close Browser

Wait Loading and Disapear
    run keyword and ignore error  wait for element  ${loadingBlock}
    run keyword and ignore error  wait for element  ${loadingNone}

Check Element Text
    [Arguments]   ${element}  ${expectedText}  ${checkMessage}   ${timeout}=60s
    Capture Page Screenshot
    Wait For Element  ${element}  ${timeout}
    ${expectedText}=  convert to string  ${expectedText}
    ${status}    ${value}=    Run Keyword And Ignore Error    Element Text Should Be    ${element}    ${expectedText}
    Run Keyword If    '${status}'=='PASS'    log to console    \n${checkMessage} Success
    ...    ELSE    Fail    \nERROR-${checkMessage}-ERROR
    Capture Page Screenshot
