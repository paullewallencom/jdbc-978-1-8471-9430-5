<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml"/>
<xsl:template match="/ROWSET">
<xsl:element name="CATALOG">
<xsl:apply-templates select="journal"/>
</xsl:element>
</xsl:template>
<xsl:template match="journal">
<xsl:element name="journal">
<xsl:attribute name="title">
<xsl:value-of select="JOURNAL_TITLE"/>
</xsl:attribute>
<xsl:attribute name="publisher">
<xsl:value-of select="PUBLISHER"/>
</xsl:attribute>
<xsl:attribute name="edition">
<xsl:value-of select="EDITION"/>
</xsl:attribute>
<xsl:element name="catalogId">
<xsl:value-of select="CATALOGID"/>
</xsl:element>
<xsl:element name="article">
<xsl:attribute name="section">
<xsl:value-of select="ARTICLE_SECTION"/>
</xsl:attribute>
<xsl:copy-of select="TITLE"/>
<xsl:copy-of select="AUTHOR"/>
</xsl:element>
</xsl:element>
</xsl:template>
</xsl:stylesheet>


