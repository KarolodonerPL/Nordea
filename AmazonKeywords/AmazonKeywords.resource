*** Settings ***
Library          SeleniumLibrary
Library           String
Resource    ../AmazonPOM/AmazonMainPage.resource
Resource    ../AmazonPOM/AmazonSearchPage.resource
Resource    ../AmazonPOM/AmazonCartPage.resource
Resource    General.resource

*** Keywords ***
Open Amazon Page
    Open Browser    ${LOGIN URL}  ${BROWSER}
    Maximize Browser Window
    Title Should Be  ${AmazonTitle}

Accept Cookies
    ${Result} =  Run Keyword And Return Status   Wait Until Element Is Visible   ${CookieTab}
    log  ${Result}
    Run Keyword If   '${RESULT}'=='True'  Click Accept All Cookies

Click Accept All Cookies
    Click Element   ${CookieAccept}

Input values for search bar and click search
    Input Text   ${SearchTextField}   ${SearchText}
    Click Element   ${SearchButton}

Add filters
    Wait Until Element Is Visible  ${HPfilter}
    Click Element    ${HPfilter}
    Wait Until Element Is Visible    ${HPActiveFilter}
    Wait Until Element Is Visible    ${Filter}
    Drag And Drop By Offset    ${MinimalPrice}    100    0
    Drag And Drop By Offset    ${MaximalPrice}    -100    0
    Click Element      ${SearchButtonFilter}

Check filter effects
    Wait Until Element Is Visible    ${HPActiveFilter}
    ${checkboxClass} =  Get Element Attribute    ${HPCheckCheckBox}   class
    Should Be Equal As Strings    ${checkboxClass}   ${checkboxClassValues}
    
Get product information and add to cart
    ${ObjectPrice} =   Get Text    ${ProductPrice}
    ${ObjectPrice} =  Trim String Price  ${ObjectPrice}
    Set Test Variable   ${ObjectPrice}
    ${ObjectName} =   Get Text    ${ProductName}
    Set Test Variable   ${ObjectName}
    Click Button    ${ProductAddButton}
    Wait Until Element Is Visible    ${ProductAdded}

Check Cart
    Click Element    ${Cart}
    Wait Until Element Is Visible  ${CartObject}
    ${ObjectPriceInCart} =   Get Text  ${CartTotal}
    ${ObjectNameInCart} =   Get Text  ${CartProductName}
    ${ObjectNumberInCart} =   Get Text  ${ItemNumbers}
    ${ObjectPriceInCart} =  Trim String Price  ${ObjectPriceInCart}
    ${ObjectNameInCart} =    Trim String Name    ${ObjectNameInCart}
    Should Be Equal As Integers    1    ${ObjectNumberInCart}    number of elements in cart are incorrect
    Should Be Equal As Strings   ${ObjectPrice}    ${ObjectPriceInCart}   Price is incorrect
    Should Be Equal As Strings    ${ObjectNameInCart}    ${ObjectName}    Name is incorrect


*** Variables ***
${AmazonTitle}  Amazon.pl: zakupy internetowe elektroniki, odzieży, komputerów, książek, płyt DVD i innych
${LOGIN URL}    https://www.amazon.pl/
${BROWSER}      Chrome
${SearchText}   laptop
${checkboxClassValues}   a-label a-checkbox-label
${ObjectName}
${ObjectPrice}
