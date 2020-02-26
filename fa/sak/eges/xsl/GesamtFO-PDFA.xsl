<?xml version="1.0" encoding="ISO-8859-1"?>
<!-- gematik revision="\main\rel_ors1\2" -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 xmlns:fo="http://www.w3.org/1999/XSL/Format"
 xmlns:kvno="urn::kvno-org/kvabrechnung"
 xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
 version="1.0">

	<!-- Version:  17.05.2011
		
		Anpassung an das 2.Quartal 2011


	    gematik, 12.02.2012: 
          - font-family von Arial auf Helvetica angepasst, 
          - XSLT-Version von 1.00 auf 1.0 korrigiert
-->

	<!-- Globaler Parameter 'Gesamttyp' zur Steuerung der Ausgabe. Es k�nnen folgende Gesamtaufstellungen erzeugt werden:
		Gesamtaufstellung, Gesamtaufstellung / Erm�chtigte �rzte oder Gesamtaufstellung / Krankenh�user
		M�gliche Werte f�r den Parameter sind: arzt, ermaechtigt und krankenhaus.
		Der gew�nschte Wert wird der XML-Datei entnommen.
-->
<xsl:param name="Gesamttyp" select="/kvno:anlage_hvv/@gesamtaufstellung-typ"/>


<xsl:output method="xml" encoding="ISO-8859-1" indent="yes"/>
<xsl:strip-space elements="*"/>

<xsl:template match="/">
	<xsl:call-template name="start"/>
</xsl:template>


<xsl:template name="start">

	<xsl:element name="fo:root">
		<xsl:attribute name="font-family"><xsl:value-of select="'Helvetica'"/></xsl:attribute>
	
		<xsl:element name="fo:layout-master-set">
			<xsl:element name="fo:simple-page-master">
				<xsl:attribute name="master-name"><xsl:value-of select="'seite_1'"/></xsl:attribute>
				<xsl:attribute name="page-height"><xsl:value-of select="'29.7cm'"/></xsl:attribute>
				<xsl:attribute name="page-width"><xsl:value-of select="'21cm'"/></xsl:attribute>
				<xsl:attribute name="margin-top"><xsl:value-of select="'1.5cm'"/></xsl:attribute>
				<xsl:attribute name="margin-bottom"><xsl:value-of select="'1.5cm'"/></xsl:attribute>
				<xsl:attribute name="margin-left"><xsl:value-of select="'1.5cm'"/></xsl:attribute>
				<xsl:attribute name="margin-right"><xsl:value-of select="'1cm'"/></xsl:attribute>
				<xsl:element name="fo:region-body">
					<xsl:attribute name="margin-top"><xsl:value-of select="'1.0cm'"/></xsl:attribute>
					<xsl:attribute name="margin-bottom"><xsl:value-of select="'1.0cm'"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="fo:region-after">
					<xsl:attribute name="extent"><xsl:value-of select="'0.4cm'"/></xsl:attribute>
				</xsl:element>
			</xsl:element>
			
			<xsl:element name="fo:simple-page-master">
				<xsl:attribute name="master-name"><xsl:value-of select="'seite_rest'"/></xsl:attribute>
				<xsl:attribute name="page-height"><xsl:value-of select="'29.7cm'"/></xsl:attribute>
				<xsl:attribute name="page-width"><xsl:value-of select="'21cm'"/></xsl:attribute>
				<xsl:attribute name="margin-top"><xsl:value-of select="'1.5cm'"/></xsl:attribute>
				<xsl:attribute name="margin-bottom"><xsl:value-of select="'1.5cm'"/></xsl:attribute>
				<xsl:attribute name="margin-left"><xsl:value-of select="'1.5cm'"/></xsl:attribute>
				<xsl:attribute name="margin-right"><xsl:value-of select="'1cm'"/></xsl:attribute>
				<xsl:element name="fo:region-body">
					<xsl:attribute name="margin-top"><xsl:value-of select="'1.0cm'"/></xsl:attribute>
					<xsl:attribute name="margin-bottom"><xsl:value-of select="'1.0cm'"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="fo:region-before">
					<xsl:attribute name="extent"><xsl:value-of select="'0.4cm'"/></xsl:attribute>
				</xsl:element>
				<xsl:element name="fo:region-after">
					<xsl:attribute name="extent"><xsl:value-of select="'0.4cm'"/></xsl:attribute>
				</xsl:element>
			</xsl:element>
			
			<xsl:element name="fo:page-sequence-master">
				<xsl:attribute name="master-name"><xsl:value-of select="'contents'"/></xsl:attribute>
				
				<xsl:element name="fo:repeatable-page-master-alternatives">
					<xsl:element name="fo:conditional-page-master-reference">
						<xsl:attribute name="master-reference"><xsl:value-of select="'seite_1'"/></xsl:attribute>
						<xsl:attribute name="page-position"><xsl:value-of select="'first'"/></xsl:attribute>
					</xsl:element>
					<xsl:element name="fo:conditional-page-master-reference">
						<xsl:attribute name="master-reference"><xsl:value-of select="'seite_rest'"/></xsl:attribute>
						<xsl:attribute name="page-position"><xsl:value-of select="'rest'"/></xsl:attribute>
					</xsl:element>
				</xsl:element>
			</xsl:element>
		</xsl:element>  <!-- fo:layout-master-set -->
		

		<xsl:element name="fo:declarations">
			<x:xmpmeta xmlns:x="adobe:ns:meta/">
				<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
					<rdf:Description rdf:about="" xmlns:xmp="http://ns.adobe.com/xap/1.0/"/>
					<rdf:Description rdf:about="" xmlns:pdf="http://ns.adobe.com/pdf/1.3/">
						<pdf:Keywords>PDF FOP Apache XSL-FO</pdf:Keywords>
					</rdf:Description>
					<rdf:Description rdf:about="" xmlns:dc="http://purl.org/dc/elements/1.1/">
						<dc:title>Gesamtaufstellung im Format PDF/A-1b</dc:title>
						<dc:subject>PDF/A-1b</dc:subject>
						<dc:creator>KV Nordrhein</dc:creator>
					</rdf:Description>
				</rdf:RDF>
			</x:xmpmeta>
		</xsl:element>
		
		<xsl:element name="fo:page-sequence">
			<xsl:attribute name="master-reference"><xsl:value-of select="'contents'"/></xsl:attribute>
			
			<xsl:element name="fo:static-content">   <!-- Kopfzeile -->
				<xsl:attribute name="flow-name"><xsl:value-of select="'xsl-region-before'"/></xsl:attribute>
				<fo:block text-align="left" font-size="8pt">&#160;</fo:block>
			</xsl:element>
			
			<xsl:element name="fo:static-content">   <!-- Fusszeile -->
				<xsl:attribute name="flow-name"><xsl:value-of select="'xsl-region-after'"/></xsl:attribute>
				<fo:block text-align="center" font-size="8pt">
					Seite <fo:page-number/>
					von <fo:page-number-citation ref-id="terminator"/>
				</fo:block>
			</xsl:element>
			
			<xsl:element name="fo:flow">
				<xsl:attribute name="flow-name"><xsl:value-of select="'xsl-region-body'"/></xsl:attribute>
				
				<xsl:element name="fo:block">
					<xsl:attribute name="font-size"><xsl:value-of select="'14pt'"/></xsl:attribute>
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<xsl:attribute name="text-align"><xsl:value-of select="'center'"/></xsl:attribute>
					<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
					<fo:inline text-decoration="underline">
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header/kvno:empfaenger/@V"/>
					</fo:inline>
				</xsl:element>
				
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt'">
						<xsl:call-template name="Arztstempel"/>
						<xsl:call-template name="Block_1"/>
						<xsl:call-template name="AssistentenVertreter"/>
						<xsl:call-template name="TeilnahmeNotfalldienst"/>
						<xsl:call-template name="Block_2"><xsl:with-param name="lfd-nummer" select=" '2' "/></xsl:call-template>
						<xsl:call-template name="Block_3"><xsl:with-param name="lfd-nummer" select=" '3' "/></xsl:call-template>
						<xsl:call-template name="Block_10"><xsl:with-param name="lfd-nummer" select=" '4' "/></xsl:call-template>
						<xsl:call-template name="Block_11"><xsl:with-param name="lfd-nummer" select=" '5' "/></xsl:call-template>
						<xsl:call-template name="Block_4"><xsl:with-param name="lfd-nummer" select=" '6' "/></xsl:call-template>
						<xsl:call-template name="Block_5"><xsl:with-param name="lfd-nummer" select=" '7' "/></xsl:call-template>
						<xsl:call-template name="Block_6"><xsl:with-param name="lfd-nummer" select=" '8' "/></xsl:call-template>
						<xsl:call-template name="Block_9"><xsl:with-param name="lfd-nummer" select=" '9' "/></xsl:call-template>
						<xsl:call-template name="Block_12"><xsl:with-param name="lfd-nummer" select=" '10' "/></xsl:call-template>
					</xsl:when>
					<xsl:when test="$Gesamttyp='ermaechtigt'">
						<xsl:call-template name="Ermaechtigtestempel"/>
						<xsl:call-template name="Block_1E"/>
						<xsl:call-template name="Block_2"><xsl:with-param name="lfd-nummer" select=" '2' "/></xsl:call-template>
						<xsl:call-template name="Block_3"><xsl:with-param name="lfd-nummer" select=" '3' "/></xsl:call-template>
						<xsl:call-template name="Block_11"><xsl:with-param name="lfd-nummer" select=" '4' "/></xsl:call-template>
						<xsl:call-template name="Block_4"><xsl:with-param name="lfd-nummer" select=" '5' "/></xsl:call-template>
						<xsl:call-template name="Block_5"><xsl:with-param name="lfd-nummer" select=" '6' "/></xsl:call-template>
						<xsl:call-template name="Block_6"><xsl:with-param name="lfd-nummer" select=" '7' "/></xsl:call-template>
						<xsl:call-template name="Block_9"><xsl:with-param name="lfd-nummer" select=" '8' "/></xsl:call-template>
					</xsl:when>
					<xsl:when test="$Gesamttyp='krankenhaus'">
						<xsl:call-template name="Krankenhausstempel"/>
						<xsl:call-template name="Block_1E"/>
						<xsl:call-template name="Block_7"><xsl:with-param name="lfd-nummer" select=" '2' "/></xsl:call-template>
						<xsl:call-template name="Block_2"><xsl:with-param name="lfd-nummer" select=" '3' "/></xsl:call-template>
						<xsl:call-template name="Block_3"><xsl:with-param name="lfd-nummer" select=" '4' "/></xsl:call-template>
						<xsl:call-template name="Block_4"><xsl:with-param name="lfd-nummer" select=" '5' "/></xsl:call-template>
						<xsl:call-template name="Block_5"><xsl:with-param name="lfd-nummer" select=" '6' "/></xsl:call-template>
						<xsl:call-template name="Block_6"><xsl:with-param name="lfd-nummer" select=" '7' "/></xsl:call-template>
						<xsl:call-template name="Block_9"><xsl:with-param name="lfd-nummer" select=" '8' "/></xsl:call-template>
					</xsl:when>
				</xsl:choose>
				
				
				<xsl:call-template name="Block_8"/>
				
					<!-- Endemarke f�r den Seitenz�hler -->
				<xsl:element name="fo:block">
					<xsl:attribute name="id"><xsl:value-of select="'terminator'"/></xsl:attribute>
				</xsl:element>
				
			</xsl:element>
		</xsl:element>

	</xsl:element>  <!-- fo:root -->
</xsl:template>
			
			
<!-- Beginn Arztstempel -->
<xsl:template name="Arztstempel">
	<fo:table text-align="center" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'20pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'9pt'"/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="'black'"/></xsl:attribute>
		<fo:table-column column-width="7.5cm"/>
		<fo:table-column column-width="5.5cm"/>
		<fo:table-column column-width="5.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="center" height="1.5cm" display-align="center">
				<fo:table-cell padding="6pt" text-align="left">
					<fo:block>
						<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:bsnr/@V"/>
					</fo:block>
					<fo:block>
						<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:praxistyp/@V"/>
					</fo:block>
					<xsl:for-each select="/kvno:anlage_hvv/kvno:header/kvno:absender/kvno:praxisinhaber/kvno:arzt">
						<fo:block>
							<xsl:value-of select="kvno:titel/@V"/>&#160;
							<xsl:value-of select="kvno:vorname/@V"/>&#160;
							<xsl:value-of select="kvno:nachname/@V"/>
							<xsl:for-each select="kvno:fachgruppe">
								<fo:block>
									<xsl:attribute name="color"><xsl:value-of select="'#808080'"/></xsl:attribute>
									<xsl:value-of select="./@V"/>
								</fo:block>
							</xsl:for-each>
						</fo:block>
					</xsl:for-each>
					<fo:block>
						<xsl:attribute name="color"><xsl:value-of select="'#808080'"/></xsl:attribute>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:strasse/@V"/>
						<fo:block/>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:plz/@V"/>&#160;
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:ort/@V"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="6pt" text-align="left">
					<xsl:attribute name="font-size"><xsl:value-of select="'14pt'"/></xsl:attribute>
					<xsl:attribute name="border-width"><xsl:value-of select="'0'"/></xsl:attribute>
					<xsl:attribute name="border-style"><xsl:value-of select="'solid'"/></xsl:attribute>
					<fo:block>
					<xsl:call-template name="quartalende">
						<xsl:with-param name="q_ende" select="/kvno:anlage_hvv/kvno:header/kvno:abrechnungsquartal/@V"/>
					</xsl:call-template>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
	<xsl:call-template name="Block_Gesamtaufstellung"/>
</xsl:template>
			
<!-- Beginn Stempel Erm�chtige �rzte -->
<xsl:template name="Ermaechtigtestempel">
	<fo:table text-align="center" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'20pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'9pt'"/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="'black'"/></xsl:attribute>
		<fo:table-column column-width="7.5cm"/>
		<fo:table-column column-width="5.5cm"/>
		<fo:table-column column-width="5.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="center" height="1.5cm" display-align="center">
				<fo:table-cell padding="6pt" text-align="left">
					<fo:block>
						<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:bsnr/@V"/>
					</fo:block>
					<xsl:for-each select="/kvno:anlage_hvv/kvno:header/kvno:absender/kvno:praxisinhaber/kvno:arzt">
						<fo:block>
							<xsl:value-of select="kvno:titel/@V"/>&#160;
							<xsl:value-of select="kvno:vorname/@V"/>&#160;
							<xsl:value-of select="kvno:nachname/@V"/>
							<xsl:for-each select="kvno:fachgruppe">
								<fo:block>
									<xsl:attribute name="color"><xsl:value-of select="'#808080'"/></xsl:attribute>
									<xsl:value-of select="./@V"/>
								</fo:block>
							</xsl:for-each>
							<xsl:for-each select="kvno:krkh">
								<fo:block>
									<xsl:value-of select="./@V"/>
								</fo:block>
							</xsl:for-each>
						</fo:block>
					</xsl:for-each>
					<fo:block>
						<xsl:attribute name="color"><xsl:value-of select="'#808080'"/></xsl:attribute>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:strasse/@V"/>
						<fo:block/>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:plz/@V"/>&#160;
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:ort/@V"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="6pt" text-align="left">
					<xsl:attribute name="font-size"><xsl:value-of select="'14pt'"/></xsl:attribute>
					<xsl:attribute name="border-width"><xsl:value-of select="'0'"/></xsl:attribute>
					<xsl:attribute name="border-style"><xsl:value-of select="'solid'"/></xsl:attribute>
					<fo:block>
					<xsl:call-template name="quartalende">
						<xsl:with-param name="q_ende" select="/kvno:anlage_hvv/kvno:header/kvno:abrechnungsquartal/@V"/>
					</xsl:call-template>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
	<xsl:call-template name="Block_Gesamtaufstellung"/>
</xsl:template>

<!-- Beginn Stempel Krankenh�user -->
<xsl:template name="Krankenhausstempel">
	<fo:table text-align="center" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'20pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'9pt'"/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
		<xsl:attribute name="color"><xsl:value-of select="'black'"/></xsl:attribute>
		<fo:table-column column-width="7.5cm"/>
		<fo:table-column column-width="5.5cm"/>
		<fo:table-column column-width="5.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="center" height="1.5cm" display-align="center">
				<fo:table-cell padding="6pt" text-align="left">
					<fo:block>
						<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:bsnr/@V"/>
					</fo:block>
					<xsl:for-each select="/kvno:anlage_hvv/kvno:header/kvno:absender/kvno:praxisinhaber/kvno:arzt">
						<fo:block>
							<xsl:value-of select="kvno:titel/@V"/>&#160;
							<xsl:value-of select="kvno:vorname/@V"/>&#160;
							<xsl:value-of select="kvno:nachname/@V"/>
							<xsl:for-each select="kvno:fachgruppe">
								<fo:block>
									<xsl:attribute name="color"><xsl:value-of select="'#808080'"/></xsl:attribute>
									<xsl:value-of select="./@V"/>
								</fo:block>
							</xsl:for-each>
							<xsl:for-each select="kvno:krkh">
								<fo:block>
									<xsl:value-of select="./@V"/>
								</fo:block>
							</xsl:for-each>
						</fo:block>
					</xsl:for-each>
					<fo:block>
						<xsl:attribute name="color"><xsl:value-of select="'#808080'"/></xsl:attribute>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:strasse/@V"/>
						<fo:block/>
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:plz/@V"/>&#160;
						<xsl:value-of select="/kvno:anlage_hvv/kvno:header//kvno:ort/@V"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="6pt" text-align="left">
					<xsl:attribute name="font-size"><xsl:value-of select="'14pt'"/></xsl:attribute>
					<xsl:attribute name="border-width"><xsl:value-of select="'0'"/></xsl:attribute>
					<xsl:attribute name="border-style"><xsl:value-of select="'solid'"/></xsl:attribute>
					<fo:block>
					<xsl:call-template name="quartalende">
						<xsl:with-param name="q_ende" select="/kvno:anlage_hvv/kvno:header/kvno:abrechnungsquartal/@V"/>
					</xsl:call-template>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
	<xsl:call-template name="Block_Gesamtaufstellung"/>
</xsl:template>



	<!--  Gesamtaufstellung (Version f�r �rzte, erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Block_Gesamtaufstellung">
	<fo:table table-layout="fixed" width="100%">
		<fo:table-column column-width="8cm"/>
		<fo:table-body>
			<fo:table-row line-height="1cm">
				<fo:table-cell><fo:block>&#160;</fo:block></fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<xsl:attribute name="font-size"><xsl:value-of select="'12pt'"/></xsl:attribute>
				<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
				<xsl:attribute name="text-align"><xsl:value-of select="'left'"/></xsl:attribute>
				<fo:table-cell  padding="3pt">
					<xsl:choose>
						<xsl:when test="$Gesamttyp='arzt' ">
							<fo:block>Gesamtaufstellung</fo:block>
						</xsl:when>
						<xsl:when test="$Gesamttyp='ermaechtigt' ">
							<fo:block>Gesamtaufstellung / Erm�chtigte �rzte</fo:block>
						</xsl:when>
						<xsl:when test="$Gesamttyp='krankenhaus' ">
							<fo:block>Gesamtaufstellung / Krankenh�user</fo:block>
						</xsl:when>
					</xsl:choose>
				</fo:table-cell>
			</fo:table-row>		
		</fo:table-body>
	</fo:table>
	<xsl:call-template name="Tabelle_Behandlungsfaelle"/>
</xsl:template>

<xsl:template name="Tabelle_Behandlungsfaelle">
	<fo:table text-align="center" border-spacing="3pt" table-layout="fixed" width="100%">
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
		<fo:table-column column-width="10cm"/>
		<fo:table-column column-width="2.5cm"/>
		<fo:table-column column-width="2.2cm"/>
		<fo:table-column column-width="3.8cm"/>
		<fo:table-header>
			<fo:table-row font-size="9pt">
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block>Abrechnungsgebiete</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block>Geb�hren-</fo:block>
					<fo:block>ordnung</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block>Arbeits-</fo:block>
					<fo:block>gebiet</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block>Anzahl der Behandlungsf�lle</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-header>
		<fo:table-body>
			<fo:table-row text-align="center" height="1cm" display-align="center">
				<fo:table-cell padding="3pt" border="1pt solid black" text-align="left">
					<fo:block><xsl:value-of select="'Ersatz- und Prim�rkassen'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="'BM�/EGO'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="'B'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="/kvno:anlage_hvv/kvno:body/kvno:anzahl_faelle/kvno:arbeitsgebiet_b/@V"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row text-align="center" height="1cm" display-align="center">
				<fo:table-cell padding="3pt" border="1pt solid black" text-align="left">
					<fo:block><xsl:value-of select="'KOV-Bundesbehandlung (BVG/BEG)'"/></fo:block>
					<fo:block><xsl:value-of select="'Auslandsabkommen, Grenzg�nger, Rheinschiffer'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="'BM�/EGO'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="'H'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="/kvno:anlage_hvv/kvno:body/kvno:anzahl_faelle/kvno:arbeitsgebiet_h/@V"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row text-align="center" height="1cm" display-align="center">
				<fo:table-cell padding="6pt" border="1pt solid black" text-align="left">
					<fo:block>
						<xsl:value-of select="'Sonstige Kostentr�ger (Polizei, Bundeswehr, Zivildienst, Bundespolizei, SHT), Postbeamte A, Entsch�digungsamt Berlin'"/>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="'BM�/EGO'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="'I'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="/kvno:anlage_hvv/kvno:body/kvno:anzahl_faelle/kvno:arbeitsgebiet_i/@V"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row text-align="center" height="1cm" display-align="center">
				<fo:table-cell>
					<fo:block></fo:block>
				</fo:table-cell>
				<fo:table-cell>
					<fo:block></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="'Gesamt'"/></fo:block>
				</fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black">
					<fo:block><xsl:value-of select="/kvno:anlage_hvv/kvno:body/kvno:anzahl_faelle/kvno:gesamt/@V"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
	<xsl:call-template name="Veraenderungsverbot"/>
</xsl:template>


	<!--  Block 1  - Hinweis, dass die Erkl�rung nicht ver�ndert werden darf (Version f�r �rzte, erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Veraenderungsverbot">
	<fo:table border="1pt solid black" table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'20pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'8pt'"/></xsl:attribute>
		<fo:table-body>
			<fo:table-row>
				<fo:table-cell padding="2pt" font-weight="'normal'">
					<fo:block>Es wird darauf hingewiesen, dass eine Ver�nderung des Erkl�rungstextes zur Unwirksamkeit der Erkl�rung f�hrt mit der Folge, dass die Abrechnung abgelehnt werden kann.</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
</xsl:template>



	<!--  Block 1  - Erkl�rung zur Quartalsabrechnung (nur f�r �rzte)
-->
<xsl:template name="Block_1">
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'20pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="left">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>x</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="'1) Erkl�rung zur Quartalsabrechnung'"/></fo:block>		
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" font-weight="'normal'">
					<fo:block>Ich versichere/Wir versichern, dass die Abrechnung ordnungsgem�� und vollst�ndig und unter Beachtung der ma�geblichen Regelungen, insbesondere des SGB V, des BMV-� bzw. EKV, des EBM und des HVV (z.B. der Abrechnungsausschl�sse gem�� � 1 Abs. 1 HVV) in der jeweils geltenden Fassung durch mich/uns erfolgt ist.</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
					<fo:block>Ich versichere/Wir versichern ferner, dass die in den beiliegenden Abrechnungsunterlagen in Rechnung gestellten Leistungen von mir selbst/uns oder von nicht�rztlichen Hilfskr�ften unter meiner/unserer Aufsicht bzw. von einem Vertreter (vgl. �32 ZV-�rzte) ausgef�hrt wurden. Keine der in Rechnung gestellten Leistungen wurden durch einen von der KV Nordrhein nicht genehmigten �rztlichen Assistenten/AIP und/oder angestellten Arzt/�rztin sowie in einer nicht genehmigten Zweigpraxis ausgef�hrt.</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>		
</xsl:template>


	<!--  Block 1E  - Erkl�rung zur Quartalsabrechnung (nur f�r erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Block_1E">
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'40pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="left">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>x</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="'1) Erkl�rung zur Quartalsabrechnung'"/></fo:block>		
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" font-weight="'normal'">
					<xsl:choose>
						<xsl:when test="$Gesamttyp='ermaechtigt' ">
							<fo:block>Ich versichere, dass die Abrechnung ordnungsgem�� und vollst�ndig und unter Beachtung der ma�geblichen Regelungen, insbesondere des SGB V, des BMV-� bzw. EKV, des EBM und des HVV (z.B. der Abrechnungsausschl�sse gem�� � 1 Abs. 1 HVV) in der jeweils geltenden Fassung durch mich erfolgt ist.</fo:block>
						</xsl:when>
						<xsl:when test="$Gesamttyp='krankenhaus' ">
							<fo:block>Ich versichere, dass die Abrechnung ordnungsgem�� und vollst�ndig und unter Beachtung der ma�geblichen Regelungen, insbesondere des SGB V, des BMV-� bzw. EKV, des EBM und des HVV (z.B. der Abrechnungsausschl�sse gem�� � 1 Abs. 1 HVV) in der jeweils geltenden Fassung erfolgt ist.</fo:block>
						</xsl:when>
					</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
					<xsl:choose>
						<xsl:when test="$Gesamttyp='ermaechtigt' ">
							<fo:block>Ich versichere ferner, dass die in den beiliegenden Abrechnungsunterlagen in Rechnung gestellten Leistungen von mir selbst (pers�nlich) oder von nicht�rztlichen Hilfskr�ften unter meiner Aufsicht ausgef�hrt wurden.</fo:block>
						</xsl:when>
						<xsl:when test="$Gesamttyp='krankenhaus' ">
							<fo:block>Ich versichere ferner, dass die in den beiliegenden Abrechnungsunterlagen in Rechnung gestellten Leistungen nur von den zur Leistungserbringung berechtigten Personen erbracht wurden.</fo:block>
						</xsl:when>
					</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
					<xsl:choose>
						<xsl:when test="$Gesamttyp='ermaechtigt' ">
							<fo:block>Insbesondere versichere ich, dass ich die Verantwortung f�r die Erf�llung der Abrechnungsvoraussetzungen trage, weil ich diese selbst erf�lle.</fo:block>
						</xsl:when>
						<xsl:when test="$Gesamttyp='krankenhaus' ">
							<fo:block>Insbesondere versichere ich, dass ich die volle Verantwortung f�r die Erf�llung aller Abrechnungsvoraussetzungen trage.</fo:block>
						</xsl:when>
					</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>
	<xsl:call-template name="Ueberweisungsscheine"/>
</xsl:template>


	<!--  Assistenten und Vertreter
-->
<xsl:template name="AssistentenVertreter">
<fo:table border="0" table-layout="fixed" width="100%">
	<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
	<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
	<xsl:attribute name="space-after.optimum"><xsl:value-of select="'20pt'"/></xsl:attribute>
	<fo:table-column column-width="0.5cm"/>
	<fo:table-column column-width="0.5cm"/>
	<fo:table-column column-width="17.5cm"/>
	<fo:table-body>
		<xsl:choose>
			<xsl:when test="//kvno:body/kvno:assistenten/kvno:assistent">
				<xsl:apply-templates select="//kvno:body/kvno:assistenten/kvno:assistent"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="keinAssistent"/>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="//kvno:body/kvno:vertreter/kvno:vertretung">
				<xsl:apply-templates select="//kvno:body/kvno:vertreter/kvno:vertretung"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="keinVertreter"/>
			</xsl:otherwise>
		</xsl:choose>
		<fo:table-row>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell padding="3pt">
			<fo:block>Insbesondere versichere ich/versichern wir, dass ich/wir die Verantwortung f�r die Erf�llung der Abrechnungsvoraussetzung trage(n), weil ich/wir diese selbst erf�lle(n) bzw. ich/wir mich/uns von deren Erf�llung pers�nlich �berzeugt habe(n).</fo:block>
			<fo:block>&#160;</fo:block>
			<fo:block>Ich habe/Wir haben davon Kenntnis genommen, dass durch die Besch�ftigung eines nicht genehmigten Assistenten/Vertreters Honorarr�ckforderungen seitens der Kassen�rztlichen Vereinigung Nordrhein entstehen k�nnen.</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</fo:table-body>
</fo:table>
</xsl:template>


	<!--  Teilnahme am organisierten �rztlichen Notfalldienst
-->
<xsl:template name="TeilnahmeNotfalldienst">
<fo:table border="0" table-layout="fixed" width="100%">
	<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
	<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
	<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
	<fo:table-column column-width="0.5cm"/>
	<fo:table-column column-width="0.5cm"/>
	<fo:table-column column-width="17.5cm"/>
	<fo:table-body>
		<fo:table-row text-align="left">
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell padding="3pt" border="0">
				<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
				<fo:block><xsl:value-of select="'Teilnahme am organisierten �rztlichen Notfalldienst'"/></fo:block>		
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell padding="3pt" font-weight="'normal'">
				<fo:block>Ich versichere/Wir versichern, </fo:block>
			</fo:table-cell>
		</fo:table-row>
	
		<xsl:choose>
			<xsl:when test="//kvno:body/kvno:notfalldienst/kvno:datum | //kvno:body/kvno:notfalldienst/kvno:zeitraum">
				<xsl:apply-templates select="//kvno:body/kvno:notfalldienst/kvno:datum | //kvno:body/kvno:notfalldienst/kvno:zeitraum">
					<xsl:sort select="@V | kvno:datum_von/@V"/>
				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>
				<xsl:call-template name="keinNotfalldienst"/>
			</xsl:otherwise>
		</xsl:choose>
		<fo:table-row>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell padding="3pt" font-weight="'normal'">
				<fo:block>abgerechneten Leistungen selbst oder durch einen Vertreter als Leistungen im organisierten Notfalldienst in eigener Praxis bzw. in einer von der KVNo und �KNo genehmigten Notfallpraxis erbracht zu haben.</fo:block>
			</fo:table-cell>
		</fo:table-row>
	</fo:table-body>
</fo:table>
<xsl:call-template name="Ueberweisungsscheine"/>
</xsl:template>


	<!--  Abrechnung von �berweisungsscheinen (Version f�r �rzte, erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Ueberweisungsscheine">
<fo:table border="0" table-layout="fixed" width="100%">
	<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
	<xsl:attribute name="font-weight"><xsl:value-of select="'normal'"/></xsl:attribute>
	<xsl:attribute name="space-after.optimum"><xsl:value-of select="'15pt'"/></xsl:attribute>
	<fo:table-column column-width="0.5cm"/>
	<fo:table-column column-width="0.5cm"/>
	<fo:table-column column-width="17.5cm"/>
	<fo:table-body>
		<fo:table-row text-align="left">
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell padding="3pt" border="0">
				<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
				<fo:block><xsl:value-of select="'Abrechnung von �berweisungsscheinen'"/></fo:block>		
			</fo:table-cell>
		</fo:table-row>
		<fo:table-row>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
			<fo:table-cell padding="3pt" font-weight="'normal'">
				<xsl:choose>
				<xsl:when test="$Gesamttyp='arzt' ">
				<fo:block>Ich versichere/Wir versichern, nur vollst�ndig gekennzeichnete �berweisungsscheine zur Abrechnung gebracht zu haben. Ich versichere/wir versichern, dass in den von mir/uns zur Abrechnung gebrachten Zuweisungsf�llen die mir/uns erteilten Auftr�ge nicht �berschritten wurden.</fo:block>
				</xsl:when>
				<xsl:when test="$Gesamttyp='ermaechtigt' ">
				<fo:block>Ich versichere, nur vollst�ndig gekennzeichnete �berweisungsscheine zur Abrechnung gebracht zu haben. Ich versichere, dass in den von mir zur Abrechnung gebrachten Zuweisungsf�llen die mir erteilten Auftr�ge nicht �berschritten wurden.</fo:block>
				</xsl:when>
				<xsl:when test="$Gesamttyp='krankenhaus' ">
				<fo:block>Ich versichere, dass nur vollst�ndig gekennzeichnete �berweisungsscheine zur Abrechnung gebracht werden. Ich versichere, dass in den zur Abrechnung gebrachten Zuweisungsf�llen die erteilten Auftr�ge nicht �berschritten wurden.</fo:block>
				</xsl:when>
				</xsl:choose>
			</fo:table-cell>
		</fo:table-row>
	</fo:table-body>
</fo:table>
</xsl:template>


	<!--  Block 2  - Erkl�rung bei datentechnischen Abrechnungsverfahren (Version f�r �rzte, erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Block_2">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="left"  keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_2/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Erkl�rung bei datentechnischen Abrechnungsverfahren (Datentr�ger- oder Onlineabrechnung)' )"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" font-weight="'normal'">
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt' ">
						<fo:block>Hiermit best�tige(n) ich/wir, dass durch entsprechende organisatorische und technische Ma�nahmen eine Erfassung jeder einzelnen Leistung zur Abrechnung erst nach deren vollst�ndiger Erbringung erfolgt ist. Das verwendete Abrechnungssystem ist von der KBV zertifiziert und g�ltig. Der zust�ndigen Bezirksstelle der Kassen�rztlichen Vereinigung Nordrhein ist die Abrechnung mittels EDV angezeigt worden.</fo:block>
					</xsl:when>
					<xsl:when test="$Gesamttyp='ermaechtigt' or $Gesamttyp='krankenhaus' ">
						<fo:block>Hiermit best�tige ich, dass durch entsprechende organisatorische und technische Ma�nahmen eine Erfassung jeder einzelnen Leistung zur Abrechnung erst nach deren vollst�ndiger Erbringung erfolgt ist. Das verwendete Abrechnungssystem ist von der KBV zertifiziert und g�ltig. Der zust�ndigen Bezirksstelle der Kassen�rztlichen Vereinigung Nordrhein ist die Abrechnung mittels EDV angezeigt worden.</fo:block>
					</xsl:when>
				</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt' ">
						<fo:block>Ich versichere/Wir versichern, dass alle gem�� der aktuell g�ltigen Richtlinie zur IT-gest�tzten Quartalsabrechnung (IT-Rtl. KVNo) einzureichenden Abrechnungsbelege an die zust�ndige Bezirksstelle termingerecht �bersandt wurden.</fo:block>
					</xsl:when>
					<xsl:when test="$Gesamttyp='ermaechtigt' or $Gesamttyp='krankenhaus' ">
						<fo:block>Ich versichere, dass alle gem�� der aktuell g�ltigen Richtlinie zur IT-gest�tzten Quartalsabrechnung (IT-Rtl. KVNo) einzureichenden Abrechnungsbelege an die zust�ndige Bezirksstelle termingerecht �bersandt wurden.</fo:block>
					</xsl:when>
				</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row  keep-with-next="always">
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
					<fo:block>Art der Abrechnung</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
			
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'0pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'9pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.0cm"/>
		<fo:table-body>
			<fo:table-row keep-with-next="always">
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_2/kvno:datentraegerabr/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0" padding="3pt">
					<fo:block>Datentr�gerabrechnung, Anzahl eingereichter Datentr�ger: 
					<xsl:choose>
					<xsl:when test="//kvno:body/kvno:ankreuzfeld_2/kvno:datentraegerabr/@Anzahl">
						<xsl:value-of select="//kvno:body/kvno:ankreuzfeld_2/kvno:datentraegerabr/@Anzahl"/>
					</xsl:when>
					<xsl:otherwise>
						<xsl:value-of select=" ' _____________________ ' "/>
					</xsl:otherwise>
					</xsl:choose>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell><fo:block>&#160;</fo:block></fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="2pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_2/kvno:onlineabr/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0" padding="3pt">
					<fo:block>Onlineabrechnung</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>


	<!--  Block 3  - Erkl�rung zur Verordnung von Arzneimitteln (Version f�r �rzte, erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Block_3">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="left" keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_3/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Erkl�rung zur Verordnung von Arzneimitteln gem. � 29 Abs. 5 BMV-�/� 15 Abs. 5 EKV' )"/></fo:block>		
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row keep-with-next="always">
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" font-weight="'normal'">
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt' ">
						<fo:block>Ich versichere/Wir versichern, dass ich/wir zur Verordnung von Arzneimitteln ausschlie�lich zertifizierte Arzneimittel-Datenbanken und Software-Versionen eingesetzt habe(n).</fo:block>
					</xsl:when>
					<xsl:when test="$Gesamttyp='ermaechtigt' ">
						<fo:block>Ich versichere, dass ich zur Verordnung von Arzneimitteln ausschlie�lich zertifizierte Arzneimittel-Datenbanken und Software-Versionen eingesetzt habe.</fo:block>
					</xsl:when>
					<xsl:when test="$Gesamttyp='krankenhaus' ">
						<fo:block>Ich versichere, dass ich zur Verordnung von Arzneimitteln ausschlie�lich zertifizierte Arzneimittel-Datenbanken und Software-Versionen eingesetzt wurden.</fo:block>
					</xsl:when>
				</xsl:choose>
					<fo:block>Hierbei wurde folgende nach � 29 Abs. 3 BMV-�/� 15 Abs.3 EKV zugelassene Arzneimittel-Datenbank und zu ihrer Nutzung zugelassene Software angewendet: </fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border-bottom="1pt solid black" padding="3pt">
					<fo:block>
						<xsl:for-each select="//kvno:body/kvno:ankreuzfeld_3/kvno:avwg_software">
							<xsl:choose>
								<xsl:when test="position() = last()">
									<xsl:value-of select="./@V"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="concat(./@V, ', ')"/>
								</xsl:otherwise>
							</xsl:choose>
						</xsl:for-each>
					</fo:block>
				</fo:table-cell>
			</fo:table-row>
			
		</fo:table-body>
	</fo:table>	
</xsl:template>


	<!--  Block 4  - Erkl�rung bei Abrechnung spezieller Laboratoriumsuntersuchungen (Version f�r �rzte, erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Block_4">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<!--
		<xsl:choose>
			<xsl:when test="$Gesamttyp='arzt' ">
				<xsl:attribute name="break-before"><xsl:value-of select="'page'"/></xsl:attribute>   Seitenumbruch
			</xsl:when>
		</xsl:choose>
		-->
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="left"  keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_4/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Erkl�rung bei Abrechnung spezieller Laboratoriumsuntersuchungen (Abschnitt 32.3 EBM)' )"/></fo:block>		
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt' ">
						<fo:block>Ich best�tige/Wir best�tigen, dass die von mir zur Abrechnung gebrachten speziellen Laboratoriumsuntersuchungen aus dem Abschnitt 32.3 EBM sowie den Abschnitten 1.7.1, 1.7.4 und 1.7.5 in meiner Praxis von mir bzw. unter meiner pers�nlichen �berwachung (pers�nliche Anwesenheit) - nicht in den R�umen einer Laborgemeinschaft - aus- und durchgef�hrt wurden.</fo:block>
					</xsl:when>
					<xsl:when test="$Gesamttyp='ermaechtigt' ">
						<fo:block>Ich best�tige, dass die von mir zur Abrechnung gebrachten speziellen Laboratoriumsuntersuchungen aus dem Abschnitt 32.3 EBM sowie den Abschnitten 1.7.1, 1.7.4 und 1.7.5 in meiner Praxis von mir bzw. unter meiner pers�nlichen �berwachung (pers�nliche Anwesenheit) - nicht in den R�umen einer Laborgemeinschaft - aus- und durchgef�hrt wurden.</fo:block>
					</xsl:when>
					<xsl:when test="$Gesamttyp='krankenhaus' ">
						<fo:block>Ich best�tige, dass die zur Abrechnung gebrachten speziellen Laboratoriumsuntersuchungen aus dem Abschnitt 32.3 EBM sowie den Abschnitten 1.7.1, 1.7.4 und 1.7.5 unter pers�nlicher �berwachung des verantwortlichen Arztes (pers�nliche Anwesenheit) - nicht in den R�umen einer Laborgemeinschaft - aus- und durchgef�hrt wurden.</fo:block>
					</xsl:when>
				</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>


	<!--  Block 5  - Erkl�rung bei Abrechnung von Leistungen, an denen mehrere �rzte/Arztpraxen mitgewirkt haben
				(Version f�r �rzte, erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Block_5">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row  keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_5/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Erkl�rung bei Abrechnung von Leistungen, an denen mehrere �rzte/Arztpraxen mitgewirkt haben' )"/></fo:block>		
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt' or $Gesamttyp='ermaechtigt' ">
						<fo:block>Ich versichere hiermit, dass in denjenigen F�llen, in denen an der Erbringung der Leistungen aus den Abschnitten 1.5, 5.4, 31.3, 31.4, 36.3 und 36.6 und der Leistungen nach den Nrn. 01910, 01911, 05350, 30920, 30922 und 30924 EBM mehrere �rzte bzw. Arztpraxen in demselben Arztfall mitgewirkt haben, Einigkeit unter den beteiligten �rzten/Arztpraxen besteht, dass nur ich allein/nur die unterzeichnende Arztpraxis in den jeweiligen F�llen diese Leistungen abrechne(t). Ferner best�tige ich, dass bei der Erbringung der Leistungen nach der Nr. 01857 EBM kein weiterer Vertragsarzt mitgewirkt hat sowie, dass ich im Fall der Abrechnung der Leistungen nach den GOP 30920, 30922 und 30924 EBM der allein behandlungsf�hrende Arzt bin.</fo:block>
					</xsl:when>
					<xsl:when test="$Gesamttyp='krankenhaus' ">
						<fo:block>Ich versichere hiermit, dass in denjenigen F�llen, in denen an der Erbringung der Leistungen aus den Abschnitten 1.5, 5.4, 31.3, 31.4, 36.3 und 36.6 und der Leistungen nach den Nrn. 01910, 01911, 05350, 30920, 30922 und 30924 EBM mehrere �rzte bzw. Arztpraxen in demselben Arztfall mitgewirkt haben, Einigkeit unter den beteiligten �rzten/Arztpraxen besteht, dass nur die erm�chtigte Einrichtung das Krankenhaus in den jeweiligen F�llen diese Leistungen abrechnet.</fo:block>
						<fo:block>Ferner best�tige ich, dass bei der Erbringung der Leistungen nach der Nr. 01857 EBM kein weiterer Vertragsarzt mitgewirkt hat sowie, dass im Fall der Abrechnung der Leistungen nach den GOP 30920, 30922 und 30924 EBM der �rztliche Leiter der allein behandlungsf�hrende Arzt ist.</fo:block>
					</xsl:when>
				</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>


	<!--  Block 6  - Erkl�rung bei Abrechnung von Kosten gem. Abschnitt I Punkt 7.3 der Allg. Bestimmungen des EBM
				(Version f�r �rzte, erm�chtigte �rzte und Krankenh�user)
-->
<xsl:template name="Block_6">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row  keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_6/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Erkl�rung bei Abrechnung von Kosten gem. Abschnitt I Punkt 7.3 der Allg. Bestimmungen des EBM' )"/></fo:block>		
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt' ">
						<fo:block>Ich erkl�re/Wir erkl�ren, dass bei der Abrechnung von Kosten f�r Materialien, die gem�� Abschnitt I Punkt 7.3 der Allgemeinen Bestimmungen des EBM in den berechnungsf�higen Leistungen <fo:inline text-decoration="underline">nicht</fo:inline> enthalten sind, die tats�chlich realisierten Preise gegen�ber der KV Nordrhein in Rechnung gestellt werden. Ich versichere/Wir versichern weiterhin, dass ggf. vom Hersteller bzw. Lieferanten gew�hrte R�ckverg�tungen, wie Preisnachl�sse, Rabatte, Umsatzbeteiligung, Bonifikation und r�ckverg�tungsgleiche Gewinnbeteiligungen (mit Ausnahme von Barzahlungsrabatten) an die KV Nordrhein weitergegeben werden.</fo:block>
					</xsl:when>
					<xsl:when test="$Gesamttyp='ermaechtigt' or $Gesamttyp='krankenhaus' ">
						<fo:block>Ich erkl�re, dass bei der Abrechnung von Kosten f�r Materialien, die gem�� Abschnitt I Punkt 7.3 der Allgemeinen Bestimmungen des EBM in den berechnungsf�higen Leistungen <fo:inline text-decoration="underline">nicht</fo:inline> enthalten sind, die tats�chlich realisierten Preise gegen�ber der KV Nordrhein in Rechnung gestellt werden. Ich versichere weiterhin, dass ggf. vom Hersteller bzw. Lieferanten gew�hrte R�ckverg�tungen, wie Preisnachl�sse, Rabatte, Umsatzbeteiligung, Bonifikation und r�ckverg�tungsgleiche Gewinnbeteiligungen (mit Ausnahme von Barzahlungsrabatten) an die KV Nordrhein weitergegeben werden.</fo:block>
					</xsl:when>
				</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>



	<!--  Block 7  - Erkl�rung zu ambulanten Notfallleistungen (nur Krankenh�user)
-->
<xsl:template name="Block_7">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="break-before"><xsl:value-of select="'page'"/></xsl:attribute>  <!-- Seitenumbruch -->
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_7/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Erkl�rung zu ambulanten Notfallleistungen' )"/></fo:block>		
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
					<fo:block>Hiermit best�tige ich, dass die Abrechnung der ambulanten Notfallleistungen ausschlie�lich durch das Krankenhaus erfolgt. Die Abrechnung derartiger Leistungen durch den erm�chtigten Krankenhausarzt ist demnach ausgeschlossen.</fo:block>
					<fo:block></fo:block>
					<fo:block>Ferner best�tige ich, dass Datum und Uhrzeit der ambulanten Notfallbehandlung angegeben wurden.</fo:block>
					<fo:block></fo:block>
					<fo:block>Ich erkl�re hiermit, dass die zur Abrechnung gebrachten Notfallleistungen nur die medizinische Erstversorgung umfassen.</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>


	<!--  Block 8  - Erstellungsdatum der Gesamtaufstellung
-->
<xsl:template name="Block_8">
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'50pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="6cm"/>
		<fo:table-column column-width="12.5cm"/>
		<fo:table-body>
			<fo:table-row  keep-with-next="always">
				<fo:table-cell padding="0pt" border-bottom="1pt dotted black" text-align="center">
					<fo:block>
						<xsl:call-template name="Datum">
							<xsl:with-param name="Date" select="//kvno:header/kvno:erstellungsdatum/@V"/>
						</xsl:call-template>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="0pt" border="0pt"><fo:block></fo:block></fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell padding="0pt" border="0pt">
					<fo:block>Datum</fo:block>
				</fo:table-cell>
				<fo:table-cell padding="0pt" border="0pt"><fo:block></fo:block></fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>



	<!--  Block 9  - Best�tigung gem. �6 Qualit�tssicherungsvereinbarung Zervix-Zytologie
-->
<xsl:template name="Block_9">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_9/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Best�tigung gem�� �6 Abs. 1 der Qualit�tssicherungsvereinbarung Zervix-Zytologie' )"/></fo:block>		
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row  keep-with-next="always">
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="3pt" font-weight="'normal'">
					<fo:block>Ich best�tige, dass in meiner Praxis/Einrichtung keine zytologischen Leistungen in Haus-/Heimarbeit erbracht werden. Die Befundungen finden ausschlie�lich in der Praxis/Einrichtung an einem zytologischen Arbeitsplatz statt. Dies gilt auch f�r die ggf. bei mir t�tigen Pr�paratebefunder/innen.</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>



	<!--  Block 10  - Abrechnung von Laborleistungen nach Kapitel 32.2 EBM
-->
<xsl:template name="Block_10">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="left"  keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_10/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Abrechnung von Laborleistungen nach Kapitel 32.2 EBM' )"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row  keep-with-next="always">
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="2pt" font-weight="'normal'">
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt' ">
						<fo:block>Ich/wir sind Mitglied der Laborgemeinschaft (BSNR):
						<xsl:choose>
							<xsl:when test="//kvno:body/kvno:ankreuzfeld_10/@lag-nr">
								<xsl:value-of select="//kvno:body/kvno:ankreuzfeld_10/@lag-nr"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select=" ' _____________________ ' "/>
							</xsl:otherwise>
						</xsl:choose>
						</fo:block>
					</xsl:when>
				</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="2pt" font-weight="'normal'">
				<xsl:choose>
					<xsl:when test="$Gesamttyp='arzt' ">
						<fo:block>Ich/wir erkl�re(n), dass die von mir/uns �ber Muster 10 A bezogenen und von der Laborgemeinschaft abzurechnenden Analysekosten dem erteilten Auftrag entsprechen und nicht Bestandteil meiner/unserer Abrechnung sind.</fo:block>
					</xsl:when>
				</xsl:choose>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>

<!--  Block 11  - Erkl�rung zur Qualit�tssicherung bei Abrechnung von Laborleistungen
-->
<xsl:template name="Block_11">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="left"  keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_11/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Erkl�rung zur Qualit�tssicherung bei Abrechnung von Laborleistungen' )"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row  keep-with-next="always">
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="2pt" font-weight="'normal'">
					<fo:block>Ich best�tige/Wir best�tigen, dass die Voraussetzungen f�r die Abrechnung der Laborleistungen, f�r die nach der Richtlinie der Bundes�rztekammer zur Qualit�tssicherung laboratoriumsmedizinischer Untersuchungen gem�� Teil A und B1 eine erfolgreiche Teilnahme an der externen Qualit�tssicherung erforderlich ist, erf�llt sind.</fo:block>
					<fo:block>Ferner best�tige(n) ich/wir, dass nur die Materialien (Serum und/oder Urin und/oder Liquor) abgerechnet wurden, f�r die ein g�ltiger Nachweis einer erfolgreichen Ringversuchsteilnahme vorliegt.</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>


<!--  Block 12  - Best�tigung bei Abrechnung der GOP 06225 EBM
-->
<xsl:template name="Block_12">
	<xsl:param name="lfd-nummer"/>
	<fo:table table-layout="fixed" width="100%">
		<xsl:attribute name="space-before"><xsl:value-of select="'30pt'"/></xsl:attribute>
		<xsl:attribute name="font-size"><xsl:value-of select="'10pt'"/></xsl:attribute>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="0.5cm"/>
		<fo:table-column column-width="17.5cm"/>
		<fo:table-body>
			<fo:table-row text-align="left"  keep-with-next="always">
				<fo:table-cell padding="0pt" border="1pt solid black" text-align="center">
					<fo:block>
						<xsl:if test="//kvno:body/kvno:ankreuzfeld_12/@V = 'true' ">
							<xsl:value-of select="'x'"/>
						</xsl:if>
					</fo:block>
				</fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="1pt" border="0">
					<xsl:attribute name="font-weight"><xsl:value-of select="'bold'"/></xsl:attribute>
					<fo:block><xsl:value-of select="concat($lfd-nummer, ') Best�tigung bei Abrechnung der GOP 06225 EBM' )"/></fo:block>
				</fo:table-cell>
			</fo:table-row>
			<fo:table-row  keep-with-next="always">
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
				<fo:table-cell padding="2pt" font-weight="'normal'">
					<fo:block>Ich best�tige/Wir best�tigen, dass die Voraussetzungen zur Abrechnung der GOP 06225 EBM, die in der Pr�ambel des EBM zum Kapitel 6.1 unter Nr. 6 aufgef�hrt sind, f�r alle Behandlungsf�lle, auch au�erhalb der kollektivvertraglichen Versorgung, erf�llt wurden.</fo:block>
				</fo:table-cell>
			</fo:table-row>
		</fo:table-body>
	</fo:table>	
</xsl:template>







	<!-- Assistenten
-->
<xsl:template match="//kvno:body/kvno:assistenten/kvno:assistent">
	<fo:table-row>
		<fo:table-cell border="0pt"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell border="0pt"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell  border="0pt" padding="3pt">
			<fo:block space-after.optimum="0pt"></fo:block>
			<fo:block>In der Zeit vom
				<fo:inline font-weight="bold">
					<xsl:call-template name="Datum">
						<xsl:with-param name="Date" select="./kvno:datum_von/@V"/>
					</xsl:call-template>
				</fo:inline>
				bis
				<fo:inline font-weight="bold">
					<xsl:call-template name="Datum">
						<xsl:with-param name="Date" select="./kvno:datum_bis/@V"/>
					</xsl:call-template>
				</fo:inline>
				war
				<fo:inline font-weight="bold">
					<xsl:value-of select="concat(./kvno:anrede/@V,' ',./kvno:titel/@V,' ',./kvno:name/@V)"/>
				</fo:inline>
				als genehmigte(r) Assistent/in und/oder angestellte(r) Arzt/�rztin in meiner Praxis t�tig.
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>
	

<xsl:template name="keinAssistent">
	<fo:table-row>
		<fo:table-cell border="0pt"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell border="0pt"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell  border="0pt" padding="3pt">
			<fo:block space-after.optimum="0pt"></fo:block>
			<fo:block>In der Zeit vom ................ bis .................. war Frau/Herr Dr. med ......................................... als genehmigte(r) Assistent/in und/oder angestellte(r) Arzt/�rztin in meiner Praxis t�tig.</fo:block>
		</fo:table-cell>
	</fo:table-row>			
</xsl:template>
	
	
	
	<!-- Vertreter
-->
<xsl:template match="//kvno:body/kvno:vertreter/kvno:vertretung">
	<fo:table-row>
		<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell padding="3pt">
			<fo:block space-after.optimum="0pt"></fo:block>
			<fo:block>In der Zeit vom
				<fo:inline font-weight="bold">
					<xsl:call-template name="Datum">
						<xsl:with-param name="Date" select="./kvno:datum_von/@V"/>
					</xsl:call-template>
				</fo:inline>
				bis
				<fo:inline font-weight="bold">
					<xsl:call-template name="Datum">
						<xsl:with-param name="Date" select="./kvno:datum_bis/@V"/>
					</xsl:call-template>
				</fo:inline>
				wurde ich in meiner Praxis von
				<fo:inline font-weight="bold">
					<xsl:value-of select="concat(./kvno:anrede/@V,' ',./kvno:titel/@V,' ',./kvno:name/@V)"/>
				</fo:inline>
				vertreten.
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>


<xsl:template name="keinVertreter">
	<fo:table-row>
		<fo:table-cell border="0pt"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell border="0pt"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell  border="0pt" padding="3pt">
			<fo:block space-after.optimum="0pt"></fo:block>
			<fo:block>In der Zeit vom ................ bis .................. wurde ich in meiner Praxis von Frau/Herrn Dr. ......................................... vertreten.</fo:block>		
		</fo:table-cell>
	</fo:table-row>			
</xsl:template>


	<!-- Notfalldienste
-->
<xsl:template match="//kvno:body/kvno:notfalldienst/kvno:datum">
	<fo:table-row>
		<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell padding="3pt">
			<fo:block>die am 
				<fo:inline font-weight="bold" font-style="italic">
					<xsl:call-template name="Datum">
						<xsl:with-param name="Date" select="./@V"/>
					</xsl:call-template>
				</fo:inline>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>

<xsl:template match="//kvno:body/kvno:notfalldienst/kvno:zeitraum">
	<fo:table-row>
		<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell border="0"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell padding="3pt">
			<fo:block>an folgenden Tagen 
				<fo:inline font-weight="bold" font-style="italic">
					<xsl:call-template name="Datum">
						<xsl:with-param name="Date" select="kvno:datum_von/@V"/>
					</xsl:call-template>
					- 
					<xsl:call-template name="Datum">
						<xsl:with-param name="Date" select="kvno:datum_bis/@V"/>
					</xsl:call-template>
				</fo:inline>
			</fo:block>
		</fo:table-cell>
	</fo:table-row>
</xsl:template>


<xsl:template name="keinNotfalldienst">
	<fo:table-row>
		<fo:table-cell border="0pt"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell border="0pt"><fo:block>&#160;</fo:block></fo:table-cell>
		<fo:table-cell  border="0pt" padding="3pt">
			<fo:block space-after.optimum="0pt"></fo:block>
			<fo:block>die am ......................... / an folgenden Tagen .....................................................................</fo:block>
		</fo:table-cell>
	</fo:table-row>			
</xsl:template>






	<!-- Nachfolgend einige Templates
-->

<xsl:template match="//kvno:body/kvno:ankreuzfeld_1[@V='true']/kvno:notfalldienst">
	<xsl:for-each select="child::*">
		<xsl:sort select="./@V | ./kvno:datum_von/@V"/>
		<xsl:choose>
			<xsl:when test="not(child::*)">   <!-- aktueller Knoten hat keine Kinder mehr -->
				<fo:block>die am 
					<xsl:call-template name="Datum"><xsl:with-param name="Date" select="./@V"/></xsl:call-template>
				</fo:block>
			</xsl:when>
			<xsl:when test="child::*">    <!-- aktueller Knoten hat noch Kinder -->
				<xsl:variable name="str1">
					<xsl:if test="kvno:datum_von/@V">
						<fo:block>
							<xsl:call-template name="Datum">
								<xsl:with-param name="Date" select="kvno:datum_von/@V"/></xsl:call-template>
						</fo:block>
					</xsl:if>
				</xsl:variable>
				<xsl:variable name="str2" select="' bis '"/>
				<xsl:variable name="str3">
					<xsl:if test="kvno:datum_bis/@V">
						<fo:block>
							<xsl:call-template name="Datum">
								<xsl:with-param name="Date" select="kvno:datum_bis/@V"/></xsl:call-template>
						</fo:block>
					</xsl:if>
				</xsl:variable>
				<fo:block><xsl:value-of select="concat('die an folgenden Tagen ', $str1, $str2, $str3)"/></fo:block>
			</xsl:when>
		</xsl:choose>
	</xsl:for-each>
</xsl:template>


<xsl:template name="Datum">
	<xsl:param name="Date"/>
	<xsl:variable name="Time" select="substring-after($Date, 'T')"/>
	<xsl:choose>
		<xsl:when test="$Date">
			<xsl:value-of select="substring($Date,9,2)"/><xsl:text>.</xsl:text>
			<xsl:value-of select="substring($Date,6,2)"/><xsl:text>.</xsl:text>
			<xsl:value-of select="substring($Date,1,4)"/>
		</xsl:when>
		<xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
	</xsl:choose>
	<xsl:if test="$Time">
		<xsl:text>&#160;&#160;</xsl:text><xsl:value-of select="concat($Time, ' Uhr')"/>
	</xsl:if>
</xsl:template>

<xsl:template name="quartalende">
	<xsl:param name="q_ende"/>
	<xsl:choose>
	<xsl:when test="$q_ende">
		<xsl:value-of select="substring($q_ende,6,2)"/><xsl:text>. Quartal </xsl:text>
		<xsl:value-of select="substring($q_ende,1,4)"/>
	</xsl:when>
	<xsl:otherwise><xsl:text>&#160;</xsl:text></xsl:otherwise>
	</xsl:choose>
</xsl:template>

</xsl:stylesheet>
