<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="ISO-8859-1"  method="text/html" />
<xsl:template match="//page">
<html>
  <head>
    <title>Oracle Catalog</title>
  </head>
  <body>
    <table border="1" cellspacing="0">
        <tr>
         <th>Journal</th>
         <th>Publisher</th>
         <th>Edition</th>
         <th>Title</th>
         <th>Author</th>
        </tr>
      <xsl:for-each select="ROWSET/ROW">
        <tr>
         <td><xsl:value-of select="JOURNAL"/></td>
         <td><xsl:value-of select="PUBLISHER"/></td>
         <td><xsl:value-of select="EDITION"/></td>
         <td><xsl:value-of select="TITLE"/></td>
         <td><xsl:value-of select="AUTHOR"/></td>
        </tr>
      </xsl:for-each>
    </table>
  </body>
</html>
</xsl:template>
</xsl:stylesheet>
