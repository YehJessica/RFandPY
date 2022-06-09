*** Settings ***
Library  SeleniumLibrary
Library  requestdata.py

*** Variables ***



*** Keywords ***
ABC123  
    getrequestdata
  #  ${text1}=Get Text  xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[2]/div/a[1]
  #  ${text2}=Get Text  xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[2]/div/a[2]

*** Test Cases ***
Open Google
    Open Browser  https://shopee.tw/m/topshop  chrome
    Maximize Browser Window

# CloseInf
    # Click Element  //*[@id="gb"]/div/div[1]/div/div[2]/a
    
RequestData
    ABC123


GetData
    ${text1}=  Get Text  xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[2]/div/a[1]
 #   ${text2}=  Get Text  xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[2]/div/a[2]
 #   Should Be Equal As Strings  ${text1}  ${text2}

#   ${item}  Set Variable  Stackoverflow

#    IF  "${text1}" == "雨衣"
 #     Log  This is correct.
 #   END


