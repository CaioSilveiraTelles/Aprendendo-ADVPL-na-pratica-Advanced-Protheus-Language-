#include 'protheus.ch'
#include 'parmtype.ch'

static cStat:=''

user function Escopo()
    //VARIAVEIS LOCAIS//
    local nVar0:= 1
    local nVar1:= 20

    //VARIAVEIS PRIVATES//
    private cPri:='private'

    //VARIAVEIS PUBLICAS//
    public __cPublic:='P12125'

    TestEscomp(@nVar0,@nVar1)

RETURN
//FUNCAO STATIC//
Static Function TestEscomp(nValor1,nValor2)
    local __cPublic:='Alterei'
    default nValor1:=0
    DEFAULT nValor2:=10

    alert("Private: " ,cPri)

    msgalert(nValor2)
    alert("Variavel Static")



Return
