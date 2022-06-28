*** Settings ***
Library      SeleniumLibrary
Library      requestdata.py
Library      String
Variables    requestdata.py
Library      Collections 

Suite Setup  Open Browser  https://shopee.tw/m/topshop  Chrome
Suite Teardown    Close Browser

*** Variables ***


*** Keywords ***
webdata_fromrequests
    ${result}=    getrequestdata
    [return]      ${result}         

*** Test Cases ***
Get Hot Searches Frist Item 
    Maximize Browser Window
    sleep  5s
#Test PASS===================================================
    ${text1_xpath}=                  Get WebElement    //*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/header/div[2]/div/div[1]/div[2]/div/a[1]
    Wait Until Element Is Visible    ${text1_xpath}    15s
    ${text1}=                        Get Text          ${text1_xpath} 
    Log                              ${text1}          


Verify Hot Searches All Item
#requests===================================================
    ${value}    webdata_fromrequests
    Log         ${value}

#selenium===================================================
    ${textALL_xpath}=    Get WebElements    //*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/header/div[2]/div/div[1]/div[2]/div/*
    ${textALL_len}=    Get length       ${textALL_xpath}

    ${textALL_list}=    Create List      
    FOR               ${i}             IN RANGE          ${textALL_len}
    ${textALL_text}=    Get Text         ${textALL_xpath}[${i}]    
 #    Log  ${textALL_text}
    Append To List    ${textALL_list}    ${textALL_text}
    Log               ${textALL_list}
    END
    
    Should Be Equal As Strings    ${textALL_list}    ${value}


