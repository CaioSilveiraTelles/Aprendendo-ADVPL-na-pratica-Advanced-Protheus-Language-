#include 'protheus.ch'
#include 'parmtype.ch'
#include "rwmake.ch"
#INCLUDE "TOPCONN.CH"


user function SZ1MOD( _CPF,_DATA,_NOME, _CIDADE,_BAIRRO,_ESTADO,_Sexo,_END,_EMAIL,_CEP,_TEL,_ATIVO, _OBS)
    lFound := u_BuscaCpf(_CPF)
    if RecLock("SZ1",!lFound)
        SZ1->Z1_FILIAL := XFILIAL("SZ1")
        SZ1->Z1_CPF := _CPF
        SZ1->Z1_DATA := _DATA
        SZ1->Z1_NOME := _NOME
        SZ1->Z1_CIDADE := _CIDADE
        SZ1->Z1_BAIRRO := _BAIRRO
        SZ1->Z1_ESTADO := _ESTADO
        IF _SEXO == 1
            SZ1->Z1_SEXO :="M"
        elseif _sexo== 2
            SZ1->Z1_SEXO :="F"
        else
            SZ1->Z1_SEXO :="N"
        endif
        SZ1->Z1_END := _END
        SZ1->Z1_EMAIL := _EMAIL
        SZ1->Z1_CEP := _CEP
        SZ1->Z1_TEL := _TEL
        if _ATIVO == 1
            SZ1->Z1_ATIVO := .T.
        else
            SZ1->Z1_ATIVO := .F.
        ENDIF

        SZ1->Z1_OBS := _OBS

        MsUnLock("SZ1")


    ENDIF

    SalvarRR()


return

static function SalvarRR()
    Odlg:End()
return msgalert("Salvo com Sucesso")




