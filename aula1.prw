#include 'protheus.ch'
#include 'parmtype.ch'
#include "rwmake.ch"
//CRIANDO O PRIMEIRO MENU FACILMENTE//

user function aula01()
    
    
    local cVldAlt := ".T."
    local cVldExc := ".T."
    private cPerg := "PEGZZ9"
    private cString :="ZZ9"

    dbselectArea("ZZ9")
    dbSetOrder(1)

    oPerg := "PEGZZ9"

    Pergunte(cPerg, .F.)
    setKey(123, {|| Pergunte(cPerg,.T.)})

    AxCadastro(cString,"Cadastro de , , , ",cVldExc,cVldAlt)   

    Set key 123 to  


return