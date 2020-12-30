<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml/text" omit-xml-declaration="no"/>
<xsl:template match="/">
<xsl:element name="catalog">
<xsl:apply-templates select="catalog/journal"/>
</xsl:element>
</xsl:template>
<xsl:template match="journal">
<xsl:element name="journal">
<xsl:element name="journal_title">
<xsl:value-of select="@title"/>
</xsl:element>
<xsl:element name="catalogId">
<xsl:value-of select="catalogId"/>
</xsl:element>
<xsl:element name="publisher">
<xsl:value-of select="@publisher"/>
</xsl:element>
<xsl:element name="edition">
<xsl:value-of select="@edition"/>
</xsl:element>
<xsl:apply-templates select="article"/>
</xsl:element>
</xsl:template>
<xsl:template match="article">
<xsl:element name="article_section">
<xsl:value-of select="@section"/>
</xsl:element>
<xsl:copy-of select="title"/>
<xsl:copy-of select="author"/>
</xsl:template>
</xsl:stylesheet>
