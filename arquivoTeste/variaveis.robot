*** Settings ***

*** Variables ***
# Tipo lista (Arrays)
@{MESES}   janeiro  fevereiro  marco

## robot -d ./logs arquivoTeste/variaveis.robot
*** Test Cases ***
Imprimir valores dos meses
    Log To Console  ${MESES[0]} ${MESES[1]} ${MESES[2]}