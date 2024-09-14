*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Browser}  chrome
${URL}   https://dicedreams-font-end.vercel.app
${Delay}    1s




*** Test Cases ***
TC1001 การเข้าสู่ระบบ
    Open Browser    ${URL}    ${Browser}
    
    Click Button    id=login-button
    Wait Until Element Is Visible  xpath=//div[@id='login-form']/div  10s
    Input Text      name=identifier    WOJA2
    Click Button   id=loginPassword
    Input Text      name=loginPassword   111111 
    Click Button    id=login-submit-button
    
    Capture Page Screenshot
    Close Browser

*** Keywords ***
Check Title blog  
    Page Should Contain   ${BLOG_TITLE2}
    Sleep    1
    Capture Page Screenshot