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
    
    Wait Until Element Is Visible    id=post-button    20s
    Execute JavaScript    document.querySelector("#post-button")?.scrollIntoView({ behavior: 'smooth', block: 'center' });
    Sleep    ${Delay}
    Execute JavaScript    document.querySelector("#post-button")?.click();
    #sleep    ${Delay}
    Wait Until Element Is Visible    id=name_games    20s
    Input Text    id=name_games    หมาป่า
    Execute JavaScript    document.querySelector("#name_games").scrollIntoView({ behavior: 'smooth', block: 'center' });
    Wait Until Element Is Visible    id=detail_post    20s
    Execute JavaScript    document.querySelector("#detail_post").scrollIntoView({ behavior: 'smooth', block: 'center' });
    Input Text    id=detail_post  ต้องการคนมาได้มากกว่าจำนวนที่ใส่ไว้
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'MuiInputBase-root')]    20s
    Click Button    xpath=//button[@aria-label='Choose date']
    Log    Trying to input date
    # Input date directly if necessary
    Input Text    xpath=//input[@placeholder='MM/DD/YYYY']    09/06/2024
    Wait Until Element Is Visible    xpath=//input[@placeholder='hh:mm aa']    20s
    Log    Trying to input time
    # Input time directly if necessary
    Input Text    xpath=//input[@placeholder='hh:mm aa']  12:00pm
    Wait Until Element Is Visible    id=num_people    20s
    Input Text    id=num_people    5
    Execute JavaScript    document.getElementById('upload-image-button').click();
    Execute JavaScript    document.getElementById('create-post-button').click();
    sleep    ${Delay}
    Capture Page Screenshot
    Close Browser