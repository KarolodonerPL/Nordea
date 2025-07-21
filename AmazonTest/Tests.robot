*** Settings ***
Documentation    Utworzenie automatycznego testu sprawdzającego poprawność działania procesu  wyszukiwania, filtrowania i dodawania produktu do koszyka na stronie Amazon.pl.
Library          SeleniumLibrary
Resource         ../AmazonKeywords/AmazonKeywords.resource

*** Test Cases ***
Test for Nordea
    Open Amazon Page
    Accept Cookies
    Input values for search bar and click search
    Add filters
    Check filter effects
    Get product information and add to cart
    Check Cart
    [Teardown]    Close Browser
    
*** Variables ***

