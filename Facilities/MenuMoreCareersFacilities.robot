*** Settings ***
Library   Selenium2Library
Resource  ../Variables/variables.robot
Resource  ../Variables/MenuVariables.robot
Resource  ../Variables/MainFunction.robot



*** Keywords ***
Open Careers
    [Arguments]  ${url}=https://useinsider.com/careers/
    Sleep    1s
    Wait And Click Element  ${moreMenu}
    Sleep    2s
    Wait And Click Element  ${careers}
    ${currentUrl} =   get location
    run keyword if  '${currentURL}'=='${url}'  log to console  Url is correct
    ...  ELSE   FAIL  Url isn't correct!!


Open Quality Assurance and Selected Location
    Sleep    2s
    Wait For Element    ${seeAllTeams}
    Execute Javascript  document.querySelector("#career-find-our-calling > div > div > a").click()
    Wait For Element    ${qualityAssurance}
    Run Keyword And Ignore Error    Scroll Element Into View    ${qualityAssurance}
    Wait And Click Element    ${qualityAssurance}
    Sleep    2s
    Wait And Click Element  ${seeAllQAJobs}

See All QA Jobs Filter
    Sleep    2s
    Wait For Element    ${locationFilter}
    Wait And Click Element    ${locationFilter}
    Wait And Click Element    ${locationIstanbul}
    Wait And Click Element    ${departmentFilter}
    Wait And Click Element    ${QADepartment}

All Jobs Position contains Quality Assurance Check and Apply Now Click    [Arguments]  ${position}=Quality Assurance
    Check Element Text     ${qaPositionNameOne}    Quality Assurance    First Quality assurance check
    Check Element Text     ${qaPositionNameTwo}    Quality Assurance    Second Quality assurance check
    Run Keyword And Ignore Error    Scroll Element Into View    ${DirectionButton}
    Wait And Click Element    ${applyNow}
    Sleep    5s

Lever Application Form Page Check
    [Arguments]   ${LeverApplicationUrl}=https://jobs.lever.co/useinsider/0ba4065b-955a-4661-ad4a-f32479f63757
    ${handles}=  Get Window Handles
    Switch Window   ${handles}[1]
    ${currentUrl} =   get location
    run keyword if  '${currentURL}'=='${LeverApplicationUrl}'  log to console  Lever Application form page Url is correct
    ...  ELSE   FAIL  Lever Application form page Url Url isn't correct!!
