<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="/">
    <html>
      <head>
        <title>Quote-Journey</title>
        <link href="style/style.css" rel="stylesheet" type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>


      </head>
      <body style="font-family: HelveticaNeueLTStd-Lt,sans-serif;">
         <script>
            document.getElementById('datePicker').value = new Date().toDateInputValue();
          </script>
        <div class="content">
          <div id="quote_main">
            <form action="quoter.html" method="post" id="quote_form_1">
              <fieldset>
                <legend><h3>Dynamic Quote in seconds</h3></legend>
                <!--  <xsl:apply-templates/>  -->
              
                <table class="w3-table-all">
                   <tr>
                       <td id="title1" colspan="100%">BUSINESS OWNERS' INFORMATION, THEN BUSINESS INFORMATION</td>
                   </tr>
                  <xsl:for-each select="QuestionList/Questions">
                    <tr>
                      <xsl:choose>
                        <xsl:when test="Response/ResponseType='Dropdown' and Response/Responsesubtype='Currency(USD)'">
                            <td>
                                <label for=""><xsl:value-of select="Description" /></label>
                                </td>
                                <td>
                                $<input type="number"  min="1" max="999999" step="any"  placeholder="500" name="{Question}"  />
                                </td>
                        </xsl:when>
                         <xsl:when test="Response/ResponseType='Text' and Question='NumOfEmployees'">
                            <td>
                                <label for=""><xsl:value-of select="Description" /></label>
                                </td>
                                <td>
                                $<input type="number"  min="1" max="999999" step="any"  placeholder="10" name="{Question}"  />
                                </td>
                        </xsl:when>
                        <xsl:when test="Response/ResponseType='Date'">
                              <td>
                              <label for=""><xsl:value-of select="Description" />:</label>
                              </td>
                              <td>
                              <input id="datePicker" type="date" name="{Question}" />
                              </td>
                              </xsl:when>
                        <xsl:when test="Response/ResponseType='Text' and Response/Responsesubtype='Zipcode5'">
                          <td>
                            <label for=""><xsl:value-of select="Description" /></label>
                          </td>
                          <td>
                            <input type='text' name="{Question}"  pattern='[0-9]{5}' placeholder="50029"/>
                          </td>
                        </xsl:when>
                        <xsl:when test="Response/ResponseType='Dropdown' and Response/Responsevalues ">
                          <td>
                            <label for=""><xsl:value-of select="Description" />:</label>
                          </td>
                          <td>
                            <select name="{Question}" >
                              <xsl:for-each select="Response/Responsevalues">
                                <option value="{Value}"><xsl:value-of select="Value" /></option>
                              </xsl:for-each>
                            </select>
                          </td>
                        </xsl:when>
                        <xsl:when test="Response/ResponseType='Text' and Response/Responsesubtype='Telephone-US'">
                          <td style="border-bottom: 1px solid black;">
                            <label for=""><xsl:value-of select="Description" /></label>
                          </td>
                          <td style="border-bottom: 1px solid black;">
                            <input type="text" name="{Question}"  placeholder="123-456-6712" /> <small style="font-style:italic;"  > </small>
                          </td>
                          <!-- <tr style="border-bottom:1px solid black"> -->
                             
                          <!-- </tr> -->
                        </xsl:when>
                        <xsl:when test="Response/ResponseType='Text' and Response/Responsesubtype='Email'">
                          <td>
                            <label for=""><xsl:value-of select="Description" /></label>
                          </td>
                          <td>
                            <input type="email"  name="{Question}" placeholder="b_owner@biz.com" />
                          </td>
                        </xsl:when>
                          <xsl:when test="Response/ResponseType='Radio' ">
                          <td>
                            <label for=""><xsl:value-of select="Description" /></label>
                          </td>
                          <td>
                               <xsl:for-each select="Response/Responsevalues"> 
                                <!-- <option value="{Value}"><xsl:value-of select="Value" /></option> -->
                                <input type="radio"  name="{../../Question}" value="{Value}"/><xsl:value-of select="Value"/> &#160;
                              </xsl:for-each> 
                              </td>
                        </xsl:when>
                        
                        <xsl:otherwise>
                          
                            <label for=""><xsl:value-of select="Description" />:</label>
                          
                          
                            <input type="text" name="{Question}" />
                          
                        </xsl:otherwise>
                      </xsl:choose>
                    </tr>
                  </xsl:for-each>
                </table>
             
                <br /><button type='submit' form='quote_form_1' value='Submit' id="mybutton">Submit Info</button>
                <!-- <button type="submit" value="Submit" onclick='printFormContents(this.form);return false;' id="quoteBtn">Get A Quote</button> -->
              </fieldset>
            </form>
          </div>
        </div>
         
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>