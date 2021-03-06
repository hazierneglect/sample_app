<xsl:stylesheet version="1.0"
      xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
      xmlns:fo="http://www.w3.org/1999/XSL/Format">

<xsl:strip-space elements="orderedlist"/>

<xsl:template match="orderedlist/listitem">
  <fo:list-item indent-start='2pi'>
    <fo:list-item-label>
      <xsl:variable name="level"
		    select="count(ancestor::orderedlist) mod 3"/>
      <xsl:choose>
	<xsl:when test='$level=1'>
	  <xsl:number format="i"/>
	</xsl:when>
	<xsl:when test='$level=2'>
	  <xsl:number format="a"/>
	</xsl:when>
	<xsl:otherwise>
	  <xsl:number format="1"/>
	</xsl:otherwise>
      </xsl:choose>
      <xsl:text>. </xsl:text>
    </fo:list-item-label>
    <fo:list-item-body>
      <xsl:apply-templates/>
    </fo:list-item-body>
  </fo:list-item>
</xsl:template>
</xsl:stylesheet>
