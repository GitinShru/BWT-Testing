*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            https://bwtstudios.com/sign-in
@{CREDENTIALS}    gitin.shru@gmail.com    Gitin#123
@{Register}       John    David    test12@abc.com    Test@123    test12@abc.com    Test@123

*** Test Cases ***
Test1
    SeleniumLibrary.Open Browser    ${url}    chrome
    Input Text    name=email    ${CREDENTIALS}[0]
    Input Text    id=password-fields    ${CREDENTIALS}[1]
    Sleep    5s
    Maximize Browser Window
    Scroll Element Into View    xpath=//*[@id="main"]/div[2]/div/div/div[1]/div[2]/div/form/div/div[4]/button
    Sleep    5s
    Click Button    xpath=//*[@id="main"]/div[2]/div/div/div[1]/div[2]/div/form/div/div[4]/button
    Page Should Contain    Please continue your registration below
    Close Browser

Test2
    SeleniumLibrary.Open Browser    ${url}    chrome
    Login
    Click Link    xpath=//*[@id="main"]/div[2]/div/div[2]/div/div/div/div/div/div/div[2]/div[1]/div[1]/a
    Page Should Contain    Welcome to Busking With Talent
    Close Browser

Test3
    SeleniumLibrary.Open Browser    https://bwtstudios.com/    chrome
    Click Element    id=a1
    Register
    Switch Window    NEW
    Press Keys    None    ESC
${EMPTY}

*** Keywords ***
Login
    Input Text    name=email    ${CREDENTIALS}[0]
    Input Text    id=password-fields    ${CREDENTIALS}[1]
    Sleep    5s
    Maximize Browser Window
    Scroll Element Into View    xpath=//*[@id="main"]/div[2]/div/div/div[1]/div[2]/div/form/div/div[4]/button
    Sleep    5s
    Click Button    xpath=//*[@id="main"]/div[2]/div/div/div[1]/div[2]/div/form/div/div[4]/button

Register
    Input Text    name=name    ${Register}[0]
    Input Text    name=last_name    ${Register}[1]
    Input Text    id=email    ${Register}[2]
    Input Text    xpath=//*[@id="password-fieldss"]    ${Register}[3]
    Input Text    id=email_verify    ${Register}[4]
    Input Text    id=password-fields    ${Register}[5]
    Maximize Browser Window
    Sleep    5s
    Click Button    id=register
