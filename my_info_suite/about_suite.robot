*** Settings ***
Documentation      This suite handles test case related to about details
Resource    ../Resource/Base/CommonFunctionality.resource

#Library     DataDriver      file=../test_data/data.xlsx      sheet_name=About


Test Setup      Launch Browser And Navigate To URL
#Test Teardown      Close Browser

Test Template       Verify About Template


*** Test Cases ***
TC1     standard_user    secret_sauce    sam     anu     l&t     sm@gmail.com     2-10     India     3454565758


*** Keywords ***
Verify About Template
    [Arguments]     ${username}     ${password}    ${firstname}    ${lastname}      ${company}     ${business_email}    ${company_size}    ${country}    ${phone_number}
    Input Text       id=user-name    ${username}
    Input Password   id=password    ${password}
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
    #Click Element    xpath=//input[@value="Mobile Testing"]
    sleep   2s
    Scroll Element Into View   xpath=//button[text()="Submit"]
    sleep   2s
    Input Text    name="How_did_you_hear_about_Sauce_Labs__c"        fjhjkj
    #Input Text    name="Sales_Contact_Comments__c"    sagjhjkjannm
    sleep   2s
    Scroll Element Into View   xpath=//button[@class="mktoButton"]
    sleep   2s
    #Click Element    xpath=//*[@id="mktoCheckbox_29478_0"]
    Click Element    xpath=//button[@type="submit"]

