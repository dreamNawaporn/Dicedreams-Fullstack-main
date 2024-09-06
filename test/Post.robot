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
    #Wait Until Element Is Visible    id=name_games    20s
    Click Button    xpath=//button[contains(@class, 'MuiButton-contained') and contains(text(), 'Post')]
    Wait Until Element Is Visible    id=post-button    20s
    Execute JavaScript    document.querySelector("#post-button").scrollIntoView(true);
    Sleep    ${Delay}
    Execute JavaScript    document.querySelector("#post-button")?.click();
    #sleep    ${Delay}
    #Click Button   id=name_games
    #Input Text      id=name_games    หมาป่า
    #Click Button   id=detail_post
    #Input Text      id=detail_post    ต้องการจำนวนมากมาเกินที่กำหนดได้
    #Click Button   css=#date_meet path
    #Click Button  xpath=(//button[@type='button'])[25]
    #Click Button   id=num_people
    #Input Text      id=num_people    7
    #Click Button   xpath=//div[@id='root']/div/main/div/div/div/form/span
    #Input Text      css=input:nth-child(7)   C:\fakepath\สีเหลือง สีฟ้า ภาพประกอบ น่ารัก Desktop Wallpaper.png
    #sleep    ${Delay}
    #Click Button    xpath=//div[@id='root']/div/main/div/div/div[2]/div[3]/button
    #sleep    ${Delay}
    #Capture Page Screenshot
    Close Browser