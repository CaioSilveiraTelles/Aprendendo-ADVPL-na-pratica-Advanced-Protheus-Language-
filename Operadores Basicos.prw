#include 'protheus.ch'
#include 'parmtype.ch'

user function Operadores()
    local nNum:=10
    local nNum2:=40

    alert(nNum + nNum2)
    alert(nNum - nNum2)
    alert(nNum * nNum2)
    alert(nNum / nNum2)
    alert(nNum % nNum2) //Resto da Divisao //

    //Operadores relacionais//
    alert(nNum < nNum2)
    alert(nNum > nNum2)
    alert(nNum = nNum2) //Comparar igual Diferente de outras linguagens//
    alert(nNum == nNum2) //Exatamente igual//
    alert(nNum <= nNum2)
    alert(nNum >= nNum2)
    alert(nNum != nNum2)    //Diferente//

    //Operadores de atribuição//
    //nNum1:=10
    //nNum1 +=nNum2
    //nNum1  -= nNum2
    //nNum1  *= nNum2
    //nNum1  /= nNum2

return 
