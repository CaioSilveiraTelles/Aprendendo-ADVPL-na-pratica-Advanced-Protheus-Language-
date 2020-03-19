#Include 'Protheus.ch'
#Include 'TopConn.ch'



User Function TRpt01()

	Local oReport
	Local cAlias := getNextAlias()
	
	OReport := RptStruc(cAlias)
	
	OReport:printDialog()

Return

Static Function RPrint(oReport,cAlias)

	Local oSecao1 := oReport:Section(1)
	
	oSecao1:BeginQuery()
	
		BeginSQL Alias cAlias
		
		SELECT A1_NOME AS CLIENTE ,COUNT(A1_COD) AS TOTALPEDIDOS, A1_LOJA AS LOJA  
				FROM %TABLE:SA1% SA1   
					INNER JOIN SC5010
					ON A1_COD = C5_CLIENTE AND A1_LOJA = C5_LOJACLI
				WHERE SA1010.D_E_L_E_T=''
					GROUP BY A1_NOME,A1_LOJA ,A1_COD
					ORDER BY COUNT(A1_COD ) DESC 
		
		EndSQL
		
		oSecao1:EndQuery()
		oReport:SetMeter((cAlias)->(RecCount()))
		
		oSecao1:Print()
		

Return

Static Function RptStruc(cAlias)

Local cTitulo := "TOTAL DE PEDIDOS"
Local cHelp := "Permite imprimir relatório de pedidos"
Local oReport
Local oSection1

//Instanciando a classe TReport:
oReport := TReport():New('TRPT001',cTitulo,/**/,{|oReport|RPrint(oReport, cAlias)},cHelp)

//Seção
oSection1 := TRSection():New(oReport, "Produtos",{"SA1"})

TRCell():New(oSection1,"FILIAL","SA1","Filial")
TRCell():New(oSection1,"CODIGO", "SA1", "Codigo") 
TRCell():New(oSection1,"LOJA", "SA1", "Loja") 
TRCell():New(oSection1,"NOME", "SA1", "NOME")



Return (oReport)

