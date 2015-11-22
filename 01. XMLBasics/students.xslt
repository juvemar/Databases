<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/students">
    <html>
      <head></head>
      <body>
        <h3>Students</h3>
        <div>
          <xsl:for-each select="student">
            <dl>
              <dt>
                Student name:
              </dt>
              <dd>
                <xsl:value-of select="name"/>
              </dd>
              <dt>
                Gender:
              </dt>
              <dd>
                <xsl:value-of select="sex"/>
              </dd>
              <dt>
                Date of Birth:
              </dt>
              <dd>
                <xsl:value-of select="birthdate"/>
              </dd>
              <dt>
                Phone Number:
              </dt>
              <dd>
                <xsl:value-of select="phone"/>
              </dd>
              <dt>
                Email:
              </dt>
              <dd>
                <xsl:value-of select="email"/>
              </dd>
              <dt>
                Course:
              </dt>
              <dd>
                <xsl:value-of select="course"/>
              </dd>
              <dt>
                Specialty:
              </dt>
              <dd>
                <xsl:value-of select="specialty"/>
              </dd>
              <dt>
                Faculty Number:
              </dt>
              <dd>
                <xsl:value-of select="name"/>
              </dd>
              <dt>
                Exams:
              </dt>
              <dd>
                <dl>
                  <xsl:for-each select="passedexams/exam">
                    <dt>Course: </dt>
                    <dd>
                      <xsl:value-of select="course"/>
                    </dd>
                    <dt>Tutor: </dt>
                    <dd>
                      <xsl:value-of select="tutor"/>
                    </dd>
                    <dt>Score: </dt>
                    <dd>
                      <xsl:value-of select="score"/>
                    </dd>
                  </xsl:for-each>
                </dl>
              </dd>
            </dl>
          </xsl:for-each>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
