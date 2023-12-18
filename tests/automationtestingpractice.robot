*** Settings ***

Resource    ../resources/page_objects/main_page_object.resource
Resource    ../resources/page_objects/automation_blog/automation_page.resource

*** Variables ***
${gender_male}    male
${gender_female}    female
*** Test Cases ***

Fill Writing Form
        Open automation Page
        Maximize Window
        Fill Form     Amanda      amanda.test@test.com    551176267282    Rua Amendoada,55    