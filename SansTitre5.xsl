<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="Company">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="simple" page-height="29.7cm" page-width="21cm" margin-top="2cm" margin-bottom="2cm" margin-left="2cm" margin-right="2cm">
					<fo:region-body margin-top="3cm"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="simple">
				<fo:flow flow-name="xsl-region-body">
					<fo:block text-align="center" font-size="20pt" margin-bottom="1cm">
						<xsl:value-of select="Address/Name"/>
					</fo:block>
					<fo:block font-size="10pt" text-align="right" margin-bottom="2cm">
						<xsl:value-of select="Address/Street"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="Address/City"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="Address/State"/>
						<xsl:text>, </xsl:text>
						<xsl:value-of select="Address/Zip"/>
					</fo:block>
					<fo:table table-layout="fixed" width="100%">
						<fo:table-column column-width="30%"/>
						<fo:table-column column-width="50%"/>
						<fo:table-column column-width="25%"/>
						<fo:table-column column-width="25%"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell padding="5pt" background-color="lightgrey">
									<fo:block font-weight="bold">Division Name</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="5pt" background-color="lightgrey">
									<fo:block font-weight="bold">Location</fo:block>
								</fo:table-cell>
								<fo:table-cell padding="5pt" background-color="lightgrey">
									<fo:block font-weight="bold">Manager</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="Company/Division">
								<fo:table-row>
									<fo:table-cell padding="5pt">
										<fo:block>
											<xsl:value-of select="Division-Name"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="5pt">
										<fo:block>
											<xsl:value-of select="Location"/>
										</fo:block>
									</fo:table-cell>
									<fo:table-cell padding="5pt">
										<fo:block>
											<xsl:for-each select="Person[@Manager='true']">
												<xsl:value-of select="First"/>
												<xsl:text> </xsl:text>
												<xsl:value-of select="Last"/>
											</xsl:for-each>
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
						</fo:table-body>
					</fo:table>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>