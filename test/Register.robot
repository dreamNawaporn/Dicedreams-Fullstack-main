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
    Click Button    id=register-button
    Click Button    id=first_name
    Input Text    id=first_name    nawaporn
    Click Button    id=last_name
    Input Text    id=last_name    boongon
    Click Button    id=username
    Input Text    id=username    nawadr
    Click Button    id=phone_number
    Input Text    id=phone_number    0987654321
    Click Button    id=email
    Input Text    id=email    nawaporn2@gmail.com
    Click Button    id=password
    Input Text    id=password    55667788b
    sleep    ${Delay}
    Wait Until Element Is Visible    xpath=//input[@placeholder='MM/DD/YYYY' and @type='text']    timeout=10s
    Click Element    xpath=//input[@placeholder='MM/DD/YYYY' and @type='text']
    Input Text    xpath=//input[@placeholder='MM/DD/YYYY' and @type='text']    09/06/2004
    Click Element    xpath=//input[@name='gender' and @value='other']
    Click Element    xpath=//button[contains(text(),'Register')]
    sleep    ${Delay}
    Capture Page Screenshot
    Close Browser