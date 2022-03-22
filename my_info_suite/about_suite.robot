*** Settings ***
Documentation      This suite handles test case related to about details
Resource    ../Resource/Base/CommonFunctionality.resource

Library     DataDriver      file=../test_data/data.xlsx      sheet_name=About


Test Setup      Launch Browser And Navigate To URL
Test Teardown      Close Browser

Test Template       Verify About Template


*** Test Cases ***
TC1
TC2
#TC1     standard_user    secret_sauce    swati     patil     l&t     sp@gmail.com     2-10     India     3454565758
#TC2     standard_user    secret_sauce    usha      koti      l&t     uk@gmail.com     2-10     India     9987656789

*** Keywords ***
Verify About Template
    [Arguments]     ${username}      ${firstname}    ${lastname}      ${company}     ${business_email}    ${company_size}    ${country}    ${phone_number}    ${p}
    Input Text       id=user-name    ${username}
    Input Password   id=password     ${p}
    Click Element    id=login-button
    Page Should Contain   Products
    Capture Page Screenshot
    Click Element     xpath=//*[@id="react-burger-menu-btn"]
    Click Element     xpath=//*[@id="about_sidebar_link"]
    Click Element    id=onetrust-accept-btn-handler
    Click Element    link=Contact
    Click Element     xpath=//span[text()="Contact sales"]
    Input Text       name=FirstName        ${firstname}
    Input Text       name=LastName         ${lastname}
    Input Text       name=Company          ${company}
    Input Text       name=Email           ${business_email}
    Select From List By Value    id=Company_Size__c        ${company_size}
    Select From List By Value    id=Country               ${country}
    Input Text       xpath=//*[@id="Phone"]                 ${phone_number}
    Input Text       xpath=//textarea[@id='How_did_you_hear_about_Sauce_Labs__c']      mysore



