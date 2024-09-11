*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Browser}  chrome
${URL}   https://dicedreams-font-end.vercel.app/
${Delay}    1s



*** Keywords ***



*** Test Cases ***
Search Google
    Open Browser    ${URL}    ${Browser}
    Click Button    css=.MuiButton-text
    sleep    ${Delay}
    Click Button   id=identifier
    Input Text      name=identifier    nawadr
    Click Button   id=loginPassword
    Input Text      name=loginPassword   55667788b 
    Click Button    xpath=//div[@id='root']/div/main/div/div/div[2]/div[3]/button
    Maximize Browser Window
    Sleep    5s
    Scroll Element Into View    css=h6#username
    Wait Until Element Is Visible    css=h6#username    60s
    Click Element    css=h6#username
    Wait Until Element Is Visible    css=button#long-button    30s
    Click Element    css=button#long-button
    
    #Page Should Contain    แก้ไขโพสต์นัดเล่น สำเร็จ
    Capture Page Screenshot
    Close Browser