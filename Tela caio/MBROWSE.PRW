#include 'protheus.ch'
#include 'parmtype.ch'
#include "rwmake.ch"
#INCLUDE "TOPCONN.CH"



USER FUNCTION mBrwSZ1()
	LOCAL cAlias := "SZ1"

	PRIVATE cCadastro := "CADASTROS DE FUNCIONARIOS"

	PRIVATE aRotina     := { }

	AADD(aRotina, { "Pesquisar"     ,"AxPesqui",     0, 1 })

	AADD(aRotina, { "Visualizar"    ,"U_oPTIONS",     0, 2 })

	AADD(aRotina, { "Incluir"       ,"U_oPTIONS",     0, 3 })

	AADD(aRotina, { "Alterar"       ,"U_oPTIONS",     0, 4 })

	AADD(aRotina, { "Excluir"       ,"U_Delet01",     0, 5 })

	dbselectarea(cAlias)
	dbsetorder(1)
	mBrowse(6, 1, 22, 75, cAlias)

RETURN
User Function oPTIONS(cAlias,nREG,nOpcao)
	
	DO CASE
	 	CASE nOpcao == 2
			 u_MyFunction(cAlias,nREG,nOpcao)
	

	 	CASE nOpcao == 3
		 	nREADONLY:= .T.
			u_MyFunction(cAlias,nREG,nOpcao)
		
	 	CASE 	nOpcao == 4
		 	nREADONLY:=.T.
			u_MyFunction(cAlias,nREG,nOpcao)

		CASE nOpcao == 5
			U_Delet01(cAlias,nREG,nOpcao)
		
		OTHERWISE
	ENDCASE
RETURN