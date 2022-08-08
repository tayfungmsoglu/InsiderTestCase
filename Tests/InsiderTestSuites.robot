*** Settings ***
Suite Setup
Suite Teardown    Close All Browsers
Test Setup        Launch Browser   ${ınsıderUrl}
Test Teardown     When Test Fail Take Screenshot
Resource          ../Facilities/HomePageFacilities.robot
Resource          ../Variables/MainFunction.robot
Resource    ../Facilities/MenuMoreCareersFacilities.robot
Library           Selenium2Library


*** Test Cases ***
01.Insider Test Cases
    Home Page Check
    Open Careers
    Open Quality Assurance and Selected Location
    See All QA Jobs Filter
    All Jobs Position contains Quality Assurance Check and Apply Now Click
    Lever Application Form Page Check

