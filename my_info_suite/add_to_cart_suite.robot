*** Settings ***
Documentation   This suite will test the add to cart details
Resource      ../Resource/Base/CommonFunctionality.resource

Test Setup      Launch Browser And Navigate To URL
Test Teardown       Close Browser

Test Template       Verify Add TO Cart Template
*** Test Cases ***
TC1  standard_user       secret_sauce     sam      anu       278310
#TC2  problem_user        secret_sauce     sanu      tanu     567201


*** Keywords ***
Verify Add To Cart Template
    [Arguments]       ${username}  ${password}    ${firstname}       ${lastname}      ${zip}
    Input Text    id=user-name    ${username}
    Input Password    id=password    ${password}
    Click Element    id=login-button
    Click Element    id=add-to-cart-sauce-labs-backpack
    Click Element    xpath=//*[@id="shopping_cart_container"]
    Click Element    xpath=//*[@id="checkout"]
    Input Text    xpath=//*[@id="first-name"]    ${firstname}
    Input Text    xpath=//*[@id="last-name"]     ${lastname}
    Input Text    xpath=//*[@id="postal-code"]    ${zip}
    Click Element    xpath=//*[@id="continue"]
    Click Element    xpath=//*[@id="finish"]
    Click Element    id=back-to-products