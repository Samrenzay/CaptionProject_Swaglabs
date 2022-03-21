*** Settings ***
Documentation      This suite will handles all the test cases related to invalid
...     credential test for swaglabs. Test case - TC_OH_3,4,5
Resource      ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser And Navigate To URL
Test Teardown      Close Browser

Test Template       Verify Invalid Credential Template

*** Test Cases ***
TC1   sdsjfhkj     6756468       Epic sadface: Username and password do not match any user in this service
TC2   ${EMPTY}  dhfjhh           Epic sadface: Username is required
TC3   797809      ${EMPTY}       Epic sadface: Password is required



*** Keywords ***
Verify Invalid Credential Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text        id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Element    id=login-button
    Element Text Should Be    xpath=//*[@class="error-message-container error"]       ${expected_error}

