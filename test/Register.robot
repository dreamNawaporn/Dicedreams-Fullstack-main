*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Browser}  chrome
${URL}   https://dicedreams-font-end.vercel.app/
${Delay}    1s



*** Keywords ***



*** Test Cases ***
TC2001การสมัครสมาชิก
    Open Browser    ${URL}    ${Browser}
    
    Click Button    css=.MuiButton-text
    sleep    ${Delay}
    Click Button   id=name_games
    Input Text      id=name_games    หมาป่า
    Click Button   id=detail_post
    Input Text      id=detail_post    ต้องการจำนวนมากมาเกินที่กำหนดได้
    Click Button   css=#date_meet path
    Click Button  xpath=(//button[@type='button'])[25]
    Click Button   id=num_people
    Input Text      id=num_people    7
    Click Button   xpath=//div[@id='root']/div/main/div/div/div/form/span
    Input Text      css=input:nth-child(7)   C:\fakepath\สีเหลือง สีฟ้า ภาพประกอบ น่ารัก Desktop Wallpaper.png
    sleep    ${Delay}
    Wait Until Element Is Visible    xpath=//input[@placeholder='MM/DD/YYYY' and @type='text']    timeout=10s
    Click Element    xpath=//input[@placeholder='MM/DD/YYYY' and @type='text']
    Input Text    xpath=//input[@placeholder='MM/DD/YYYY' and @type='text']    09/06/2004
    Click Element    xpath=//input[@name='gender' and @value='other']
    Click Element    xpath=//button[contains(text(),'Register')]
    sleep    ${Delay}
    Capture Page Screenshot
    Close Browser