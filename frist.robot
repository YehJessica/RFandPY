*** Settings ***
Library  SeleniumLibrary
Library  requestdata.py
Library    String
Variables  requestdata.py

*** Variables ***

#${py_data}  ${aaa} 
# Setting variable '' failed: Invalid variable name ''.


*** Keywords ***
webdata_fromrequests  
    getrequestdata

*** Test Cases ***
Open Google
    Open Browser  https://shopee.tw/m/topshop  Chrome  executable_path=./chromedriver
    Maximize Browser Window

# CloseInf 
    # Click Element  //*[@id="gb"]/div/div[1]/div/div[2]/a
 
GetDataTest_1
#Test PASS===================================================
    ${text1_xpath}=  Get WebElement  //*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/header/div[2]/div/div[1]/div[2]/div/a[1]
    Wait Until Element Is Visible  ${text1_xpath}  15s
    ${text1}=  Get Text  ${text1_xpath} 
    Log  ${text1}  

#Test Fail===================================================
#//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/header/div[2]/div/div[1]/div[2]/div/a[1]
 #   ${text2}=  Get Text  xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/header/div[2]/div/div[1]/div[2]/div/a[1]
 #   ${text2}=  Get Text  xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[2]/div/a[2]
 #   Should Be Equal As Strings  ${text1}  ${text2}

#   ${item}  Set Variable  Stackoverflow

#    IF  "${text1}" == "雨衣"
 #     Log  This is correct.
 #   END

CompareData_PY&RF
#requests===================================================
 #   ${value}  webdata_fromrequests
  #    Log  ${value}
#selenium===================================================
   ${textALL_xpath}=  Get WebElements  //*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/header/div[2]/div/div[1]/div[2]/div
   ${text3}=  Get WebElements  //*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/header/div[2]/div/div[1]/div[2]/div/a[*] 
#    ${getcount_RF}=  Get Element Count  //*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/header/div[2]/div/div[1]/div[2]/div/a[1] #result : 1
#    ${getcount_RF}=  Get Element Count  ${textALL_xpath} 
    #TypeError: object of type 'WebElement' has no len()

    ${textALL_RF}=  Get Text  ${textALL_xpath}
    Log  ${textALL_RF}
    #-------------------------------------------------
     #口罩 手機殼 雨衣 拖鞋 洋裝 酒精 小米 水壺

    ${text3_len}=  Get length  ${text3}
    FOR  ${i}  IN RANGE  ${text3_len}
        ${text3_text}=  Get Text  ${text3}[${i}]
        Log  ${text3_text}
    END

#    ${text_len}=  Get length  ${textALL_RF}
 #   Log  ${text_len}
    Should Be Equal As Strings  ${textALL_RF}   ${value}
    Close Browser

